import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/link_api.dart';

// sign up class to get data from api
class VerfiyCodeForgetPassword {
  Crud crud;
  VerfiyCodeForgetPassword(this.crud);
  postdata({
    required String email,
    required String verifycode,
  }) async {
    var response = await crud.postData(AppLink.verfiyCodeForgetPassword, {
      "email": email,
      "verifycode": verifycode,
    });
    return Future.value(response.fold((l) => l, (r) => r));
  }
}
