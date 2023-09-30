import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/link_api.dart';

// sign up class to get data from api
class VerifyCodeSignupData {
  Crud crud;
  VerifyCodeSignupData(this.crud);
  postdata({
    required String email,
    required String verifyCode,
  }) async {
    var response = await crud.postData(AppLink.verfiycodeSignup, {
      "email": email,
      "verifycode": verifyCode,
    });
    return Future.value(response.fold((l) => l, (r) => r));
  }
}
