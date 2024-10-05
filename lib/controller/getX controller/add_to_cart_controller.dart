// lib/cart_controller.dart
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pc_shop_version02/Model/add_to_cart_model.dart';
import 'package:pc_shop_version02/Model/productInfoModel.dart';
import 'package:pc_shop_version02/Model/productListModel.dart';
class AddToCartController extends GetxController {
  var cart = <Products>[].obs;
  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _loadCart();
  }

  void addToCart(Products product) {
    cart.add(product);
    _saveCart();
    Get.snackbar('Success', '${product.nameEn} added to cart!');
  }

  void removeFromCart(Products product) {
    cart.remove(product);
    _saveCart();
    Get.snackbar('Removed', '${product.nameEn} removed from cart!');
  }

  void _saveCart() {
    storage.write('cart', cart.map((product) => product.toJson()).toList());
  }

  void _loadCart() {
    var savedCart = storage.read('cart') ?? [];
    cart.value = List<Products>.from(savedCart.map((item) => Products.fromJson(item)));
  }
}
