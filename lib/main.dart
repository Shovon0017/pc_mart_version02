import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pc_shop_version02/view/screen/navigation%20bar/navigation.dart';
import 'package:pc_shop_version02/view/screen/requested_order/requested_order.dart';
import 'package:pc_shop_version02/view/screen/splash/splash.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      home: NavigationBarShow(),
        builder: EasyLoading.init(),
    );
  }
}
