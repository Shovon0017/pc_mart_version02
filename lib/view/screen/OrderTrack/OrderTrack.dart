import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_shop_version02/common%20widget/CommonIcon.dart';
import 'package:pc_shop_version02/common%20widget/common_button.dart';
import 'package:pc_shop_version02/controller/getX%20controller/product_Info.dart';
import 'package:pc_shop_version02/view/screen/navigation%20bar/navigation.dart';
import 'package:pc_shop_version02/view/screen/notification/notification.dart';

class OrderTrack extends StatefulWidget {
  const OrderTrack({super.key});

  @override
  State<OrderTrack> createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> {
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
            const Text("Order Track",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child:
              Card(
                color: CupertinoColors.systemGrey4,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Delivery Partner :",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: "BD-DEX",
                              style: TextStyle(fontSize: 20, color: Colors.black))
                        ])),
                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Tracking Number:",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: "DEX-BND-00000981234",
                              style: TextStyle(fontSize: 20, color: Color(0xff9a0000)))
                        ])),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child:
              Card(
                color: CupertinoColors.systemGrey4,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Receiver Name:",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: "User-001",
                              style: TextStyle(fontSize: 20, color: Colors.black))
                        ])),
                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Address:",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: "House 09,Road 5,Bheramara,Kushtia",
                              style: TextStyle(fontSize: 20, color: Colors.black,overflow: TextOverflow.ellipsis))
                        ])),
                  ],
                ),
              ),
            ),
            SizedBox(

              width: double.infinity,
              child:
              Card(
                color: CupertinoColors.systemGrey4,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("data"),
                        CircleAvatar(radius: 25),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
