import 'package:ecommercecourse/app_routes.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/verify_code_signup.dart';
import 'package:get/get.dart';

abstract class SuccessSignupController extends GetxController {
  gotologin();
}

class SuccessSignupControllerImp extends SuccessSignupController {
  VerifyCodeSignupData verifyCodeSignupData = VerifyCodeSignupData(Get.find());
  String? email;

  @override
  gotologin() {
    Get.offAllNamed(AppRoutes.kLogin);
  }
}
