import 'package:movie_app/src/helpers/preference_helper.dart';

import '../../models/post/post_model.dart';

abstract class PostLocal {
  Future<void> insertPostData(String? postModel);
  Future<PostModel?> getPostData();
}


class PostLocalImplement extends PostLocal {
  final PreferenceHelper helper;

  PostLocalImplement(this.helper);
  @override
  Future<PostModel?> getPostData() async {
    final result = await helper.getData();
    return result;
  }

  @override
  Future<void> insertPostData(String? postModel) async {
    helper.setData(postModel);
  }
  
}
