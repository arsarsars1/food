import 'package:food/export.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage {
  String fav = "fav";
  String cart = "cart";
  GetStorage getStorage = GetStorage();

  Future<void> saveFav(String key, List<FoodModel> food) async {
    await getStorage.write(key, food);
  }

  Future<void> clearFav(String key) async {
    await getStorage.remove(key);
  }

  bool containFav(String key) {
    return getStorage.hasData(key);
  }

  Future<List<FoodModel>> get favList async {
    try {
      if (containFav(fav)) {
        List<dynamic> list = await getStorage.read(fav);
        return list.map((x) => FoodModel.fromJson(x)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<FoodModel>> get cartList async {
    try {
      if (containFav(cart)) {
        List<dynamic> list = await getStorage.read(cart);
        return list.map((x) => FoodModel.fromJson(x)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
