import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/link_api.dart';

// sign up class to get data from api
class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(
    String username,
    String password,
    String email,
    String phone,
  ) async {
    var response = await crud.postData(AppLink.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return Future.value(response.fold((l) => l, (r) => r));
  }
}
