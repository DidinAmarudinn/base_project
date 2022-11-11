import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/post/post_model.dart';

abstract class PreferenceHelper {
  Future<PostModel?> getData();
  Future<bool?> setData(String? postData);
}

class PreferenceHelperImpl extends PreferenceHelper {
  final FlutterSecureStorage storage;

  PreferenceHelperImpl(this.storage);

  static const dataKey = "Key";

  @override
  Future<PostModel?> getData() async {
    final result =await storage.read(key: dataKey);
    if (result != null) {
      return PostModel.fromJson(jsonDecode(result));
    } else {
      return null;
    }
  }
  
  @override
  Future<bool?> setData(String? postData) async {
    try {
      await storage.write(key: dataKey, value: postData);
      return true;
    } catch (e) {
      return false;
    }
  }
}
