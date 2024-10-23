import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_shop_version02/common%20widget/CommonIcon.dart';
import 'package:pc_shop_version02/controller/getX%20controller/product_Info.dart';
import 'package:pc_shop_version02/view/screen/notification/notification.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    ProductInfoController controller=Get.put(ProductInfoController());
    return Scaffold(backgroundColor: const Color(0xffFFFFFF),

      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: SizedBox(
            height: 32,
            width: 114,
            child: Image.asset("images/pcmart.jpg")),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CommonIconButton(onTap: (){
              Get.to(()=>const NotificationShow());
            }),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Requested Order",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
             SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child:
              Card(
                color: Color(0xff9a0000),
              ),
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child:
              Card(
                color: CupertinoColors.systemGrey4,
              ),
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child:
              Card(
                color: CupertinoColors.systemGrey4,
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child:
              Card(
                color: CupertinoColors.systemGrey4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
