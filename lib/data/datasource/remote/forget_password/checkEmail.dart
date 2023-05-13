import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/link_api.dart';

// sign up class to get data from api
class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata({
    required String email,
  }) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email,
    });
    return Future.value(response.fold((l) => l, (r) => r));
  }
}
