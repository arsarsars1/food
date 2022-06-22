import 'package:flutter/material.dart';
import 'package:food/export.dart';
import 'package:food/ui/pages/detail_page.dart';
import 'package:get/get.dart';

class HomeWidget extends StatefulWidget {
  final String? category;
  final FoodModel foodModel;
  final bool isCart;
  final GestureTapCallback? onTap;
  const HomeWidget(
      {Key? key,
      this.category,
      required this.foodModel,
      this.onTap,
      this.isCart = false})
      : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          Get.to(
              () => DetailPage(
                    foodModel: widget.foodModel,
                    onTap: () => setState(() {}),
                  ),
              curve: Curves.bounceInOut,
              transition: Transition.leftToRightWithFade);
        },
        borderRadius: BorderRadius.circular(10),
        child: ButtonWidget(
            margin: const EdgeInsets.only(bottom: 4, top: 4),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              DisplayImage(
                url: widget.foodModel.strMealThumb,
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
                            TitleText(
                              text: widget.foodModel.strMeal,
                              fontSize: 16,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: (widget.category != null)
                                  ? TitleText(
                                      text: widget.category,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    )
                                  : const SizedBox(),
                            ),
                            const TitleText(
                                text: "\$10",
                                fontSize: 18,
                                fontWeight: FontWeight.w300)
                          ]))),
              ButtonWidget(
                  onTap: () async {
                    await save();
                  },
                  radius: 100,
                  color: ColorsCustom.grey,
                  child: isLoading
                      ? const Loading()
                      : Icon(widget.isCart
                          ? Get.find<HomeController>()
                                  .cartController
                                  .isCart(widget.foodModel)
                              ? Icons.shopping_basket
                              : Icons.shopping_basket_outlined
                          : Get.find<HomeController>()
                                  .favController
                                  .isFav(widget.foodModel)
                              ? Icons.favorite
                              : Icons.favorite_border))
            ])));
  }

  Future<void> save() async {
    if (widget.isCart) {
      setState(() => isLoading = true);
      await Get.find<HomeController>()
          .cartController
          .saveCart(widget.foodModel);
      setState(() => isLoading = false);
      if (widget.onTap != null) {
        widget.onTap!();
      }
    } else {
      setState(() => isLoading = true);
      await Get.find<HomeController>().favController.saveFav(widget.foodModel);
      setState(() => isLoading = false);
      if (widget.onTap != null) {
        widget.onTap!();
      }
    }
  }
}
