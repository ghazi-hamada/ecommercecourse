import 'dart:developer';

import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/function/handlingData_controller.dart';
import 'package:ecommercecourse/core/services/servises.dart';
import 'package:ecommercecourse/data/datasource/remote/favorite_data.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  Map<String, dynamic> isFavorite = {};
  FavoriteData favoriteData = FavoriteData(Get.find());

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  setFavorite(id, val, ItemsModel itemsModel) {
    if (isFavorite["${itemsModel.itemsId}"] == '1') {
      removeFavorite("${itemsModel.itemsId!}");
      isFavorite[id.toString()] = '0';
    } else if (isFavorite["${itemsModel.itemsId}"] == '0') {
      addFavorite("${itemsModel.itemsId!}");
      isFavorite[id.toString()] = '1';
    }
    update();
  }

  addFavorite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.addFavorite(
      itemsid: itemsid,
      usersid: myServices.sharedPreferences.getString('id')!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      log("response $response");
      if (response['status'] == "success") {
        Get.rawSnackbar(
          message: "Add Favorite Success",
          duration: const Duration(seconds: 1),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.removeFavorite(
      itemsid: itemsid,
      usersid: myServices.sharedPreferences.getString('id')!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      log("response $response");
      if (response['status'] == "success") {
        Get.rawSnackbar(
          message: "Remove Favorite Success",
          duration: const Duration(seconds: 1),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
