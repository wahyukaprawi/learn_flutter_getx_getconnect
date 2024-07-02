import 'package:get/get.dart';
import 'package:learn_flutter_getx_getconnect/controllers/add_controller.dart';

class AddBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AddController());
  }
}