import 'package:ecommercecourse/app_routes.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/function/handlingData_controller.dart';
import 'package:ecommercecourse/data/datasource/remote/forget_password/checkEmail.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:online_store_project/core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey();
  //
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  @override
  checkEmail() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postdata(email: email.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoutes.kVerfiyCode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "ُWarning", middleText: "Email Not Exists");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
