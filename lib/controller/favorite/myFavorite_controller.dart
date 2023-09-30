import 'dart:developer';

import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/function/handlingData_controller.dart';
import 'package:ecommercecourse/core/services/servises.dart';
import 'package:ecommercecourse/data/datasource/remote/my_favorite_data.dart';
import 'package:ecommercecourse/data/model/my_favorite_model.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.getdata(
      usersid: myServices.sharedPreferences.getString('id')!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      log("response $response");
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        log("response: $data");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  deleteFromFavorite(String favoriteId) {
    var response = favoriteData.deleteFavoriteItem(favoriteId: favoriteId);
    data.removeWhere((element) => element.favoriteId == int.parse(favoriteId));
    update();
    if (StatusRequest.success == statusRequest) {
      log("response $response");

      Get.rawSnackbar(
        message: "Remove Favorite Success",
        duration: const Duration(seconds: 1),
      );
    }
  }
}
