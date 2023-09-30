import 'package:ecommercecourse/app_routes.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/function/handlingData_controller.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/verify_code_signup.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
abstract class verifyCodeSignUpController extends GetxController {
  checkCode();
  goTOsuccessSignup(String verifyCode);
}

// ignore: camel_case_types
class verifyCodeSignUpControllerImp extends verifyCodeSignUpController {
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeSignupData verifyCodeSignupData = VerifyCodeSignupData(Get.find());
  String? email;

  @override
  goTOsuccessSignup(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignupData.postdata(
      email: email!,
      verifyCode: verifyCode,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.kSuccessSignup);
      } else {
        Get.defaultDialog(
            title: "ُWarning",
            middleText: "The code is wrong, please try again");
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

// ghazihamada7@gmail.com
  @override
  checkCode() {
    // TODO: implement checkCode
    throw UnimplementedError();
  }
}
