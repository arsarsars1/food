import 'package:flutter/material.dart';
import 'package:food/export.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                text: "Cart",
                fontSize: 30,
                textAlign: TextAlign.left,
              ),
            ),
            controller.cartController.cartList.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.cartController.cartList.length,
                    padding: const EdgeInsets.only(right: 25),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return HomeWidget(
                        onTap: () => setState(() {}),
                        isCart: true,
                        foodModel: controller.cartController.cartList[index],
                      );
                    },
                  )
                : Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: const TitleText(
                      text: "No Cart item found",
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
