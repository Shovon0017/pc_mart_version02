

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_shop_version02/common%20widget/CommonIcon.dart';
import 'package:pc_shop_version02/view/screen/notification/notification.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body:Center(
        child: Column(
          children: [

          ],
        ),
      ) ,
    );
  }
}
