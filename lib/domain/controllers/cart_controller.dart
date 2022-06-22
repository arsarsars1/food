import 'package:food/export.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxBool isSave = false.obs;
  RxList<FoodModel> cartList = <FoodModel>[].obs;
  LocalStorage localStorage = LocalStorage();

  @override
  void onInit() async {
    getSaveList(localStorage.cart);
    super.onInit();
  }

  Future<void> getSaveList(String key) async {
    isSave(true);
    cartList.assignAll(await localStorage.cartList);

    isSave(false);
  }

  Future<void> saveCart(FoodModel foodModel) async {
    if (isCart(foodModel)) {
      cartList.removeWhere((element) =>
          element.strMealThumb.toLowerCase() ==
              foodModel.strMealThumb.toLowerCase() &&
          element.strMeal.toLowerCase() == foodModel.strMeal.toLowerCase());
      await localStorage.saveFav(localStorage.cart, cartList);
    } else {
      cartList.add(foodModel);
      await localStorage.saveFav(localStorage.cart, cartList);
    }
  }

  bool isCart(FoodModel foodModel) {
    if (cartList.isNotEmpty) {
      return cartList.any((element) =>
          element.strMealThumb.toLowerCase() ==
              foodModel.strMealThumb.toLowerCase() &&
          element.strMeal.toLowerCase() == foodModel.strMeal.toLowerCase());
    } else {
      return false;
    }
  }
}
