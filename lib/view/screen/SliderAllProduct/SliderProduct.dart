import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_shop_version02/common%20widget/CommonIcon.dart';
import 'package:pc_shop_version02/common%20widget/common_text.dart';
import 'package:pc_shop_version02/common%20widget/search_field.dart';
import 'package:pc_shop_version02/controller/getX%20controller/ProductListController.dart';
import 'package:pc_shop_version02/view/screen/notification/notification.dart';
import 'package:pc_shop_version02/view/screen/product_info/product_info.dart';

class SliderProductScreen extends StatelessWidget {
  const SliderProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: SizedBox(
            height: 40, width: 150, child: Image.asset("images/pcmart.jpg")),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CommonIconButton(onTap: () {
              Get.to(() => const NotificationShow());
            }),
          )
        ],
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchField(
                  onChanged: (String text) {
                    log("===== onChanged : $text ==================");
                    controller.searchFunction(searchText: text);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Obx(() => controller.isLoading.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : controller.productList.isEmpty
                  ? const Center(
                  child: CommonText(title: "Empty Product List"))
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      physics: const PageScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.productList.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => ProductInfo(
                                id: index,
                                productData:
                                controller.productList[index]));
                          },
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            child: SizedBox(
                              height: 220,
                              width:
                              MediaQuery.sizeOf(context).width /
                                  2.2,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image(
                                          image: AssetImage(
                                              "${controller.productList[index].image}"))),
                                  CommonText(
                                      title:
                                      "ID : ${controller.productList[index].productId}"),
                                  CommonText(
                                      title:
                                      "Name : ${controller.productList[index].nameEn}"),
                                  CommonText(
                                      title:
                                      "Price : ${controller.productList[index].regPrice}Tk"),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
