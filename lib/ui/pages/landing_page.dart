import 'package:flutter/material.dart';
import 'package:food/export.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  ValueNotifier<int> indexValue = ValueNotifier(0);
  late TabController controller;
  int value = 0;
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    indexValue.addListener(() {
      controller.animateTo(indexValue.value);
      value = indexValue.value;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: const [
          HomePage(),
          FavouritePage(),
          CartPage(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: controller,
          labelColor: ColorsCustom.black,
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.grey,
          isScrollable: false,
          indicatorSize: TabBarIndicatorSize.label,
          onTap: (int page) {
            controller.animateTo(page);
            value = page;
            WidgetsBinding.instance
                .addPostFrameCallback((timeStamp) => setState(() {}));
          },
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: "Favourite",
            ),
            Tab(
              icon: Icon(Icons.shopping_basket),
              text: "Cart",
            ),
          ],
        ),
      ),
    );
  }
}
