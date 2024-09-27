
import 'package:pc_shop_version02/local%20storage/local_storage.dart';

class LogOutApi {
  static Future<bool>logoutApi() async {
    await LocalStorage().deleteData();
      return true;
  }
}
