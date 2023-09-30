import 'package:ecommercecourse/app_routes.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/function/handlingData_controller.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/signup_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SingupController extends GetxController {
  Future<dynamic> singup();
  goTologin();
  showPassword();
}

class SingupControllerImp extends SingupController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPassword = true;

  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());

  List data = [];

  @override
  Future<dynamic> singup() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(
        name.text,
        password.text,
        email.text,
        phone.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoutes.kVerfiyCodesignup,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "Phone Number Or Email Already Exists");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goTologin() {
    Get.offNamed(AppRoutes.kLogin);
  }

  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
