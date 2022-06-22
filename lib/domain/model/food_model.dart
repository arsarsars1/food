import 'dart:convert';

// final foodModel = foodModelFromJson(jsonString);

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

// class FoodModel {
//   FoodModel({
//     this.meals,
//   });
//
//   List<Meal>? meals;
//
//   factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
//         meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
//       );
// }

class FoodModel {
  FoodModel({
    required this.strMeal,
    required this.strMealThumb,
  });

  String strMeal;
  String strMealThumb;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        strMeal: json["strMeal"] ?? "",
        strMealThumb: json["strMealThumb"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
      };
}
