import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/link_api.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    // return await crud.readData('test');
    var response = await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
