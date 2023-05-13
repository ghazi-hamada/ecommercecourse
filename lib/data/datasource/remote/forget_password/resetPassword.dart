import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/link_api.dart';

// sign up class to get data from api
class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postdata({
    required String password,
    required String email,
  }) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "email": email,
      "password": password,
    });
    return Future.value(response.fold((l) => l, (r) => r));
  }
}
