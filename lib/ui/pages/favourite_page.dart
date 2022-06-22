import 'package:flutter/material.dart';
import 'package:food/export.dart';
import 'package:get/get.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 18.0, bottom: 8),
              child: TitleText(
                text: "Favourite",
                fontSize: 30,
                textAlign: TextAlign.left,
              ),
            ),
            controller.favController.favList.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.favController.favList.length,
                    padding: const EdgeInsets.only(right: 25),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return HomeWidget(
                        onTap: () => setState(() {}),
                        foodModel: controller.favController.favList[index],
                      );
                    },
                  )
                : Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: const TitleText(
                      text: "No favourite item found",
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
