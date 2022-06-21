import 'package:flutter/material.dart';
import 'package:food/export.dart';

class HomeWidget extends StatelessWidget {
  final String category;
  const HomeWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      margin: const EdgeInsets.only(bottom: 4, top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const DisplayImage(
            url: "https://www.themealdb.com/images/media/meals/1548772327.jpg",
            height: 100,
            width: 100,
            radius: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleText(
                    text: "Baked salmon",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: TitleText(
                      text: category,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const TitleText(
                    text: "\$10",
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
            ),
          ),
          const ButtonWidget(
            radius: 100,
            color: ColorsCustom.grey,
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
    );
  }
}
