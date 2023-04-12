import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ImageApi {
  final Dio dio = Dio();

  Future fetchImageCustom({required String seed}) async {
    try {
      final response = await dio
          .get('https://api.dicebear.com/6.x/pixel-art/svg?seed=$seed');

      debugPrint(response.data.toString());

      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future fetchImage() async {
    try {
      final response =
          await dio.get('https://api.dicebear.com/6.x/lorelei/svg');

      debugPrint(response.data.toString());

      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
