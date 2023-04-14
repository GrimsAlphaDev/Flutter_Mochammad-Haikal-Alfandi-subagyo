import 'package:app_section_27/model/api/food_api.dart';
import 'package:app_section_27/model/food_model.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'food_test.mocks.dart';

@GenerateMocks([FoodApi])
void main() {
  group('FoodsApi', () {
    FoodApi foodsApi = MockFoodApi();
    test('get all foods return data', () async {
      when(foodsApi.fetchFood()).thenAnswer(
        (_) async => <FoodModel>[
          FoodModel(id: 4, name: 'Nasi Goreng'),
        ],
      );
      var foods = await FoodApi().fetchFood();
      expect(foods.isNotEmpty, true);
    });
  });
}
