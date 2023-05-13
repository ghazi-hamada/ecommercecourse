import 'package:ecommercecourse/app_routes.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/function/handlingData_controller.dart';
import 'package:ecommercecourse/data/datasource/remote/items_data.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  //functions
  initialData();
  changeIndex(int index, String id);
  getItems(String categoriesid);
  changLike();
  goProductDetails(ItemsModel itemsModel);
  //parameters
  bool isLike = false;
  List categories = [];
  List items = [];
  String? categoriesid;
  int? index;
  ItemsData itemsDate = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
}

class ItemsControllerImp extends ItemsController {
  @override
  initialData() {
    categories = Get.arguments['categories'];
    index = Get.arguments['index'];
    categoriesid = Get.arguments['categories_id'];
    getItems(categoriesid!);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  changeIndex(int index, String id) {
    this.index = index;
    categoriesid = id;
    items.clear();
    getItems(categoriesid!);
    update();
  }

  @override
  getItems(categoriesid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsDate.getData(id: categoriesid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  changLike() {
    isLike = !isLike;
    update();
  }

  @override
  goProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.kProductDetails,
        arguments: {'itemsmodel': itemsModel});
  }
}
