import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/link_api.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData({required}) async {
    // return await crud.readData('test');
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}
