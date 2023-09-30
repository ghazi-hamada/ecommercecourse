import 'package:ecommercecourse/app_routes.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/function/handlingData_controller.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/verify_code_signup.dart';
import 'package:ecommercecourse/data/datasource/remote/forget_password/verfiyCodeForgetPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
abstract class verifyCodeController extends GetxController {
  checkCode();
  goTOResetPassword(String verificationCode);
}

// ignore: camel_case_types
class verifyCodeControllerImp extends verifyCodeController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  VerfiyCodeForgetPassword verfiyCodeForgetPassword =
      VerfiyCodeForgetPassword(Get.find());
  String? email;
  @override
  checkCode() {}

  @override
  goTOResetPassword(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeForgetPassword.postdata(
        email: email!, verifycode: verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRoutes.kResetpassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(title: "ُWarning", middleText: "Email Not Exists");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
