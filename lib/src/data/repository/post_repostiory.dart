import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:movie_app/src/data/local/post_local.dart';
import 'package:movie_app/src/data/network/post_service.dart';
import 'package:movie_app/src/helpers/network_info.dart';
import 'package:movie_app/src/utils/failure.dart';

import '../../models/post/post_model.dart';
import '../../utils/exception.dart';

abstract class PostRepository {
  Future<Either<Failure, PostModel?>> getPost();
}

class PostRepositoryImpl extends PostRepository {
  final PostLocal localSource;
  final PostService remoteSourece;
  final NetworkInfo networkInfo;

  PostRepositoryImpl({required this.localSource, required this.remoteSourece,required this.networkInfo});
  @override
  Future<Either<Failure, PostModel?>> getPost() async {
   if (await networkInfo.isConnected) {
     try {
      final result = await remoteSourece.getPost();
      await localSource.insertPostData(json.encode(result?.toJson()));
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
   } else {
     try {
        final result = await localSource.getPostData();
        return Right(result);
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
   }
  }
}
