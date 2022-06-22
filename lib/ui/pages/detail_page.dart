import 'package:flutter/material.dart';
import 'package:food/export.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  final FoodModel foodModel;
  final GestureTapCallback onTap;
  const DetailPage({Key? key, required this.foodModel, required this.onTap})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = false;
  bool isCart = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              DisplayImage(
                url: widget.foodModel.strMealThumb,
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              AppBar(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: ButtonWidget(
                      radius: 15, child: BackButton(color: ColorsCustom.black)),
                ),
                backgroundColor: ColorsCustom.transparent,
                shadowColor: ColorsCustom.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonWidget(
                          onTap: () async {
                            setState(() => isLoading = true);
                            await Get.find<HomeController>()
                                .favController
                                .saveFav(widget.foodModel);
                            setState(() => isLoading = false);
                            widget.onTap();
                          },
                          radius: 10,
                          color: ColorsCustom.grey,
                          child: isLoading
                              ? const Loading()
                              : Icon(Get.find<HomeController>()
                                      .favController
                                      .isFav(widget.foodModel)
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          TitleText(
            text: widget.foodModel.strMeal,
            fontSize: 20,
          ),
          const SizedBox(height: 40),
          ButtonWidget(
            onTap: () async {
              setState(() => isCart = true);
              await Get.find<HomeController>()
                  .cartController
                  .saveCart(widget.foodModel);
              setState(() => isCart = false);
              widget.onTap();
            },
            radius: 10,
            color: ColorsCustom.grey,
            child: isCart
                ? const Loading()
                : Icon(
                    Get.find<HomeController>()
                            .cartController
                            .isCart(widget.foodModel)
                        ? Icons.shopping_basket
                        : Icons.shopping_basket_outlined,
                    size: 40,
                  ),
          ),
        ],
      ),
    );
  }
}
