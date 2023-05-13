import 'package:ecommercecourse/app_routes.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/function/handlingData_controller.dart';
import 'package:ecommercecourse/core/services/servises.dart';
import 'package:ecommercecourse/data/datasource/remote/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToItems({
    required List categories,
    required int index,
    required String categoriesid,
  });
}

class HomeControllerImp extends HomeController {
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());
   bool lang =false;
  // List data = [];
  List categories = [];
  List items = [];
  MyServices myServices = Get.find();
  String? username;
  String? id;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString('id');
   lang= myServices.sharedPreferences.getString("lang") == "ar";
    update();
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  @override
  goToItems({
    required List categories,
    required int index,
    required String categoriesid,
  }) {
    Get.toNamed(AppRoutes.kItems, arguments: {
      'categories': categories,
      'index': index,
      'categories_id': categoriesid
    });
  }
}
