import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pc_shop_version02/common%20widget/CommonIcon.dart';
import 'package:pc_shop_version02/common%20widget/common_button.dart';
import 'package:pc_shop_version02/common%20widget/custom_order_shimmer_loading.dart';
import 'package:pc_shop_version02/controller/getX%20controller/add_to_cart_controller.dart';
import 'package:pc_shop_version02/controller/getX%20controller/cart.dart';
import 'package:pc_shop_version02/view/screen/OrderInfo/OrderInfo.dart';
import 'package:pc_shop_version02/view/screen/cart/widget/increment_decrement.dart';
import 'package:pc_shop_version02/view/screen/cart/widget/no_cart_data_found.dart';
import 'package:pc_shop_version02/view/screen/notification/notification.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    AddToCartController addToCartController=Get.put(AddToCartController());
    Size size = MediaQuery.sizeOf(context);
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
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Obx(
              () => addToCartController.cart.isEmpty
              ? const NoCartProductFoundWidget()
              : Column(
            children: [
              const Text(
                "Shopping Cart",
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: "Total Item :",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ])),
                      Obx(
                            () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10),
                          child: Text(
                              "${addToCartController.cart.length}"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: size.height / 1.8,
                child: Obx(() {
                  return ListView.builder(
                    itemCount: addToCartController.cart.length,
                    itemBuilder: (context, index) {
                      final hostel = addToCartController.cart[index];
                      return ListTile(
                        title: Text("${hostel.nameEn}"),
                        subtitle: Text('${hostel.regPrice} per night'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            addToCartController.removeFromCart(hostel);
                          },
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => addToCartController.cart.isEmpty
            ? const SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonButton(
                    buttonWidth: size.width / 2,
                    buttonName: "Check Out",
                    onTap: () async {
                      Get.to(() => const OrderInfo());
                    },
                  ),
                  const SizedBox(height: 150)
                ],
              ),
      ),
    );
  }
}
