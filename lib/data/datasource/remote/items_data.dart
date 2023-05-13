import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/link_api.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData({required String id}) async {
    var response = await crud.postData(AppLink.items, {
      'id': id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
