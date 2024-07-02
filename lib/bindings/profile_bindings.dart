import 'package:get/get.dart';
import 'package:learn_flutter_getx_getconnect/controllers/profile_controller.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}