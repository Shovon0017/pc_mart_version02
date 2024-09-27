import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pc_shop_version02/Model/CartProductShow.dart';
import 'package:pc_shop_version02/common%20widget/CommonSnackbar.dart';
import 'package:pc_shop_version02/database/AddtoCartdata.dart';
import 'package:pc_shop_version02/local%20storage/local_storage.dart';

class CartProductListService {
  static Future<List<ProductCart>?> cartProductListService() async {
    try {
        CartProductListModel data = CartProductListModel.fromJson(jsonDecode(jsonEncode(AddToCartData.addToCartData)));
        return data.productCart;
    } catch (e) {
      debugPrint("Error : $e");
    }
    CommonSnackBarMessage.errorMessage(text: "Something went wrong..!!");
    return [];
  }
}