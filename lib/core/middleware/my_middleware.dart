import 'package:ecommercecourse/app_routes.dart';
import 'package:ecommercecourse/core/services/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == "2") {
      return const RouteSettings(name: AppRoutes.knavbarButton);
    }
    if (myServices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: AppRoutes.kLogin);
    }
    return null;
  }
}
