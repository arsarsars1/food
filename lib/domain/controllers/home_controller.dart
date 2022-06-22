import 'dart:collection';

import 'package:food/export.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSave = false.obs;
  RxString selectedCategory = "Beef".obs;
  RxList<FoodModel> foodList = <FoodModel>[].obs;
  CartController cartController = Get.put(CartController());
  FavController favController = Get.put(FavController());

  @override
  void onInit() async {
    fetchData(selectedCategory.value);
    super.onInit();
  }

  void updateCategory(String text) {
    selectedCategory(text);
    fetchData(text);
  }

  void fetchData(String category) async {
    isLoading(true);

    try {
      foodList.clear();
      await ApiRequest(
        requestUrl: Config.byCategory + category,
      ).getRequest().then((value) async {
        if (value != null &&
            await value.data != null &&
            value.data["meals"] != null) {
          var list = List<FoodModel>.from(
              value.data["meals"].map((x) => FoodModel.fromJson(x)));
          foodList.assignAll(LinkedHashSet<FoodModel>.from(list).toList());
          isLoading(false);
        } else {
          isLoading(false);
        }
      });
    } catch (e) {
      foodList.clear();
      Utilities.debugPrintCustom("fetchData $e");
      isLoading(false);
    }
  }

  List<String> category = [
    "Beef",
    "Breakfast",
    "Chicken",
    "Dessert",
    "Goat",
    "Lamb",
    "Miscellaneous",
    "Pasta",
    "Seafood",
    "Starter",
    "Vegan",
    "Vegetarian",
  ];
}
