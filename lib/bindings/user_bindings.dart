import 'package:get/get.dart';
import 'package:learn_flutter_getx_getconnect/controllers/user_controller.dart';

class UserBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}