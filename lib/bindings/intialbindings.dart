import 'package:ecommercecourse/core/class/crud.dart';
import 'package:get/get.dart';

class Intialbindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
