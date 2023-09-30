import "package:ecommercecourse/core/class/crud.dart";
import 'package:ecommercecourse/link_api.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite({required String itemsid, required String usersid}) async {
    var response = await crud.postData(AppLink.favoriteAdd, {
      "itemsid": itemsid,
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite({required String itemsid, required String usersid}) async {
    var response = await crud.postData(AppLink.favoriteRemove, {
      "itemsid": itemsid,
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
