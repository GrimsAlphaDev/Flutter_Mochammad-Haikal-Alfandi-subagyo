import 'package:app_section_27/model/food_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FoodApi {
  final Dio dio = Dio();

  late List<FoodModel> foods;

  Future fetchFood() async {
    try {
      final response = await dio.get(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods');

      foods = (response.data as List)
          .map((item) => FoodModel.fromJson(item))
          .toList();

      return foods;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
