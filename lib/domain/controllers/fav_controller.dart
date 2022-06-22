import 'package:food/export.dart';
import 'package:get/get.dart';

class FavController extends GetxController {
  RxBool isSave = false.obs;

  RxList<FoodModel> favList = <FoodModel>[].obs;
  LocalStorage localStorage = LocalStorage();

  @override
  void onInit() async {
    getSaveList(localStorage.fav);
    super.onInit();
  }

  Future<void> getSaveList(String key) async {
    isSave(true);
    favList.assignAll(await localStorage.favList);

    isSave(false);
  }

  Future<void> saveFav(FoodModel foodModel) async {
    if (isFav(foodModel)) {
      favList.removeWhere((element) =>
          element.strMealThumb.toLowerCase() ==
              foodModel.strMealThumb.toLowerCase() &&
          element.strMeal.toLowerCase() == foodModel.strMeal.toLowerCase());
      await localStorage.saveFav(localStorage.fav, favList);
    } else {
      favList.add(foodModel);
      await localStorage.saveFav(localStorage.fav, favList);
    }
  }

  bool isFav(FoodModel foodModel) {
    if (favList.isNotEmpty) {
      return favList.any((element) =>
          element.strMealThumb.toLowerCase() ==
              foodModel.strMealThumb.toLowerCase() &&
          element.strMeal.toLowerCase() == foodModel.strMeal.toLowerCase());
    } else {
      return false;
    }
  }
}
