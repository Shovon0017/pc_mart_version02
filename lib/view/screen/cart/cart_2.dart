import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pc_shop_version02/common%20widget/common_button.dart';
import 'package:pc_shop_version02/common%20widget/custom_order_shimmer_loading.dart';
import 'package:pc_shop_version02/controller/getX%20controller/cart.dart';
import 'package:pc_shop_version02/view/screen/OrderInfo/OrderInfo.dart';
import 'package:pc_shop_version02/view/screen/cart/widget/increment_decrement.dart';
import 'package:pc_shop_version02/view/screen/cart/widget/no_cart_data_found.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    Size size = MediaQuery.sizeOf(context);
    cartController.getCartProductList();
    return Scaffold(
      appBar: AppBar(title: Text("shopping_cart".tr)),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Obx(
                () => cartController.isLoading.isTrue
                ? const CustomOrderShimmer()
                : cartController.cartProductList.isEmpty
                ? const NoCartProductFoundWidget()
                : Column(
              children: [
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
                                "${cartController.cartProductList.length}"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: size.height / 1.8,
                  child: Obx(
                        () => ListView.builder(
                        padding: const EdgeInsets.only(bottom: 10),
                        shrinkWrap: true,
                        itemCount: cartController.cartProductList.length,
                        itemBuilder: (_, index) {
                          var data = cartController.cartProductList[index];
                          double salePrice = 0.0;
                          if (data.discountPrice != 0) {
                            if (data.discountType == 0) {
                              salePrice = (data.salePrice! - double.parse(data.discountPrice.toString()));
                            } else if (data.discountType == 1) {
                              salePrice = (data.salePrice! - (double.parse(data.discountPrice.toString()) / 100) * data.salePrice!);
                            } else {
                              salePrice = 0.00;
                            }
                          } else {
                            salePrice = double.parse(data.salePrice.toString());
                          }
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            cartController.priceList[index] = salePrice * data.quantity!;
                            cartController.totalPrice.value = 0.00;
                            for (int i = 0; i < cartController.priceList.length; i++) {
                              cartController.totalPrice.value += cartController.priceList[i];
                            }
                          });
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            surfaceTintColor: Colors.transparent,
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.withOpacity(.3), strokeAlign: BorderSide.strokeAlignOutside),
                            ),
                            child: Row(
                              children: [

                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "${cartController.cartProductList[index].productName?.en}",style: TextStyle(fontSize: 15,overflow: TextOverflow.ellipsis),),
                                        Row(
                                          children: [
                                             Text(
                                              "Price : ",style: TextStyle(
                                               fontSize: 12,
                                             ),
                                            ),
                                            Text(
                                           "$salePrice ৳",style: TextStyle(
                                              fontSize: 12,
                                            ),

                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Obx(()=> Text(
                                              "${cartController.qty.value * salePrice} ৳",style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.red,
                                            ),

                                            ),),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () async {
                                                cartController.cartProductList.removeAt(index);
                                              },
                                              child: const Icon(Icons.delete_forever, color: Colors.red),
                                            ),
                                            const SizedBox(width: 10)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      IncrementDecrementButton(
                                          iconData: Icons.add,
                                          onTap: () async {
                                            cartController.qty.value ++;
                                          }),
                                      Obx(
                                            () => Text(
                                         "${cartController.qty.value}",style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),

                                        ),
                                      ),
                                      IncrementDecrementButton(
                                          iconData: Icons.remove,
                                          onTap: () async {
                                            if (cartController.qty.value > 1) {
                                              cartController.qty.value --;
                                            } else {
                                              await EasyLoading.showError("Minimum quantity should be 1");
                                            }
                                          }),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
            () => cartController.cartProductList.isEmpty
            ? const SizedBox()
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              color: const Color(0xffFFEDE5),
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     "total_amount".tr,style: TextStyle(
                      fontSize: 18,
                      color: Color(0xffFFEDE5),
                    ),

                    ),
                    Obx(
                          () => Text(
                       "= ${cartController.totalPrice.obs} ৳",style: TextStyle(
                            fontSize: 18,
                            color:Color(0xffFFEDE5),
                          ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            CommonButton(
              onTap: () async {
                Map<String, dynamic> data = await cartController.orderService();
                log("$data");
                Get.to(() =>  OrderInfo(), arguments: data);
              }, buttonName: "checkout",
            ),
            const SizedBox(height: 70)
          ],
        ),
      ),
    );
  }
}
