// lib/cart_controller.dart
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pc_shop_version02/Model/add_to_cart_model.dart';
class AddToCartController extends GetxController {
  var cart = <AddToCartProduct>[].obs;
  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _loadCart();
  }

  void addToCart(AddToCartProduct product) {
    cart.add(product);
    _saveCart();
    Get.snackbar('Success', '${product.productName} added to cart!');
  }

  void removeFromCart(AddToCartProduct product) {
    cart.remove(product);
    _saveCart();
    Get.snackbar('Removed', '${product.productName} removed from cart!');
  }

  void _saveCart() {
    storage.write('cart', cart.map((product) => product.toJson()).toList());
  }

  void _loadCart() {
    var savedCart = storage.read('cart') ?? [];
    cart.value = List<AddToCartProduct>.from(savedCart.map((item) => AddToCartProduct.fromJson(item)));
  }
}
