import 'package:food/export.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var selectedCategory = "Beef".obs;

  @override
  void onInit() {
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
      // playList.clear();
      await ApiRequest(
        requestUrl: Config.byCategory + category,
      ).getRequest().then((value) async {
        if (value != null && await value.data != null) {
          // playList.assignAll(List<PlayListModel>.from(
          //     value.data.map((x) => PlayListModel.fromJson(x))));
          isLoading(false);
        } else {
          isLoading(false);
        }
      });
    } catch (e) {
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
