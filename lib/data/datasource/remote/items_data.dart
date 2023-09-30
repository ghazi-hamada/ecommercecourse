import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/link_api.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData({required String id, required String userId}) async {
    var response = await crud.postData(AppLink.items, {
      'id': id,
      'usersid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
