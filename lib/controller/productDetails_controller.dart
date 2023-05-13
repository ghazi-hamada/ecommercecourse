import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  intialData();
  
  late ItemsModel itemsModel;
}

class ProductDetailsControllerImpl extends ProductDetailsController {
  @override
  intialData() {
    itemsModel = Get.arguments['itemsmodel'];
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
