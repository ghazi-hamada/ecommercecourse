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

  List subItems = [
    {"name": "red", "id": 1, "active": '1'},
    {"name": "white", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '0'},
  ];
  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
