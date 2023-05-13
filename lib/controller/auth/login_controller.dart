import 'package:ecommercecourse/app_routes.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/function/handlingData_controller.dart';
import 'package:ecommercecourse/core/services/servises.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/login_api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  showPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());
  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.kSignup);
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(
        email: email.text,
        password: password.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          await sharedData(response);

          Get.offNamed(AppRoutes.knavbarButton);
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  Future<void> sharedData(response) async {
    await myServices.sharedPreferences
        .setString("id", response['data']['users_id'].toString());

    await myServices.sharedPreferences
        .setString("username", response['data']['users_name']);

    await myServices.sharedPreferences
        .setString("email", response['data']['users_email']);

    await myServices.sharedPreferences
        .setString("phone", response['data']['users_phone']);

    await myServices.sharedPreferences.setString("step", "2");
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.kForgetPassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("==================================== $value");
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }
}
