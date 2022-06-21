import 'package:flutter/material.dart';
import 'package:food/export.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Obx(
          () => ListView(
            padding: const EdgeInsets.only(left: 25),
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 18.0, bottom: 8),
                child: TitleText(
                  text: "Restaurant",
                  fontSize: 30,
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                children: const [
                  ButtonWidget(
                    text: "25-30 min",
                    color: ColorsCustom.grey,
                    textColor: ColorsCustom.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8),
                    child: TitleText(
                      text: "2.4 km",
                      fontSize: 16,
                      color: ColorsCustom.grey,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  TitleText(
                    text: "Restaurant",
                    fontSize: 14,
                    color: ColorsCustom.grey,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 40,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.category.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ButtonWidget(
                            text: controller.category[index],
                            isSelected: controller.selectedCategory.value ==
                                controller.category[index],
                            onTap: () {
                              controller
                                  .updateCategory(controller.category[index]);
                            },
                          ));
                    }),
              ),
              const SizedBox(height: 8),
              controller.isLoading.value
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Loading()]))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      padding: const EdgeInsets.only(right: 25),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return HomeWidget(
                            category: controller.selectedCategory.value);
                      })
            ],
          ),
        ),
      ),
    );
  }
}
