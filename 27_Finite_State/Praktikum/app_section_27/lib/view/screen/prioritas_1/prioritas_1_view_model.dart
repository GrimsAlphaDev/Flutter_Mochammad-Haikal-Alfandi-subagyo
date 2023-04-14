import 'package:app_section_27/model/api/food_api.dart';
import 'package:app_section_27/model/food_model.dart';
import 'package:app_section_27/utils/state/finit_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Prioritas1ViewModel with ChangeNotifier {
  final FoodApi service = FoodApi();

  late List<FoodModel> foods;

  MyState myState = MyState.initial;

  Future fetchFood() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      foods = await service.fetchFood();

      debugPrint(foods.toString());

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }

      myState = MyState.failed;
      notifyListeners();
    }
  }
}
