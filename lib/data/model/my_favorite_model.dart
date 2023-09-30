class MyFavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  int? favoriteItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCat;
  int? usersId;

  MyFavoriteModel({
    this.favoriteId,
    this.favoriteUsersid,
    this.favoriteItemsid,
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCat,
    this.usersId,
  });

  factory MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    return MyFavoriteModel(
      favoriteId: json['favorite_id'] as int?,
      favoriteUsersid: json['favorite_usersid'] as int?,
      favoriteItemsid: json['favorite_itemsid'] as int?,
      itemsId: json['items_id'] as int?,
      itemsName: json['items_name'] as String?,
      itemsNameAr: json['items_name_ar'] as String?,
      itemsDesc: json['items_desc'] as String?,
      itemsDescAr: json['items_desc_ar'] as String?,
      itemsImage: json['items_image'] as String?,
      itemsCount: json['items_count'] as int?,
      itemsActive: json['items_active'] as int?,
      itemsPrice: json['items_price'] as int?,
      itemsDiscount: json['items_discount'] as int?,
      itemsDate: json['items_date'] as String?,
      itemsCat: json['items_cat'] as int?,
      usersId: json['users_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'favorite_id': favoriteId,
        'favorite_usersid': favoriteUsersid,
        'favorite_itemsid': favoriteItemsid,
        'items_id': itemsId,
        'items_name': itemsName,
        'items_name_ar': itemsNameAr,
        'items_desc': itemsDesc,
        'items_desc_ar': itemsDescAr,
        'items_image': itemsImage,
        'items_count': itemsCount,
        'items_active': itemsActive,
        'items_price': itemsPrice,
        'items_discount': itemsDiscount,
        'items_date': itemsDate,
        'items_cat': itemsCat,
        'users_id': usersId,
      };
}
