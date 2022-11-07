import 'package:flutter/foundation.dart';
import 'package:movie_app/src/data/repository/post_repostiory.dart';
import 'package:movie_app/src/utils/enum_state.dart';

import '../../models/post/post_model.dart';

class SplashScreenProvider extends ChangeNotifier {
  final PostRepository repository;

  SplashScreenProvider({required this.repository});

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = "";
  String get message => _message;

  PostModel? _postModel;
  PostModel? get postModel => _postModel;

  Future<void> getPostData() async {
    _state = RequestState.loading;
    notifyListeners();
    final result = await repository.getPost();
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (data) {
      _state = RequestState.loaded;
      _postModel = data;
      notifyListeners();
    });
  }
}
