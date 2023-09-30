import "package:ecommercecourse/core/class/crud.dart";
import 'package:ecommercecourse/link_api.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getdata({required String usersid}) async {
    var response = await crud.postData(AppLink.favoriteView, {
      "id": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteFavoriteItem({required String favoriteId}) async {
    var response = await crud.postData(AppLink.deletefromfavorite, {
      "id": favoriteId,
    });
    return response.fold((l) => l, (r) => r);
  }

  
}
