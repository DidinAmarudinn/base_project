import 'dart:convert';
import 'package:movie_app/src/utils/api_constants.dart';
import 'package:movie_app/src/helpers/http_client.dart';
import 'package:movie_app/src/utils/exception.dart';

import '../../models/post/post_model.dart';

abstract class PostService {
  Future<PostModel?> getPost();
}

class PostServiceImplement extends PostService {
  final ApiClient client;

  PostServiceImplement(this.client);
  @override
  Future<PostModel?> getPost() async {
    final response = await client.retryClient().get(Uri.parse(getPostUrl));
    if (response.statusCode == 200) {
      final result = PostModel.fromJson(json.decode(response.body));
      return result;
    } else {
      throw ServerException();
    }
  }
}
