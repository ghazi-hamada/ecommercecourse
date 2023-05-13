import 'package:ecommercecourse/app_routes.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/function/handlingData_controller.dart';
import 'package:ecommercecourse/data/datasource/remote/forget_password/resetPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class resetPasswordController extends GetxController {
  successResetPasssword();
}

class ResetPasswordControllerImp extends resetPasswordController {
  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController password;
  late TextEditingController confirmPassword;

  String? email;
  final GlobalKey<FormState> formstate = GlobalKey();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  @override
  successResetPasssword() async {
    if (password.text != confirmPassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(
          email: email!, password: password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.kSuccessResetPassword);
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Password Reset Failed");
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
