import 'package:collection/collection.dart';

class ItemsModel {
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
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  int? favorite;

  ItemsModel({
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
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDatetime,
    this.favorite,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
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
        categoriesId: json['categories_id'] as int?,
        categoriesName: json['categories_name'] as String?,
        categoriesNameAr: json['categories_name_ar'] as String?,
        categoriesImage: json['categories_image'] as String?,
        categoriesDatetime: json['categories_datetime'] as String?,
        favorite: json['favorite'] as int?,
      );

  Map<String, dynamic> toJson() => {
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
        'categories_id': categoriesId,
        'categories_name': categoriesName,
        'categories_name_ar': categoriesNameAr,
        'categories_image': categoriesImage,
        'categories_datetime': categoriesDatetime,
        'favorite': favorite,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ItemsModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      itemsId.hashCode ^
      itemsName.hashCode ^
      itemsNameAr.hashCode ^
      itemsDesc.hashCode ^
      itemsDescAr.hashCode ^
      itemsImage.hashCode ^
      itemsCount.hashCode ^
      itemsActive.hashCode ^
      itemsPrice.hashCode ^
      itemsDiscount.hashCode ^
      itemsDate.hashCode ^
      itemsCat.hashCode ^
      categoriesId.hashCode ^
      categoriesName.hashCode ^
      categoriesNameAr.hashCode ^
      categoriesImage.hashCode ^
      favorite.hashCode ^
      categoriesDatetime.hashCode;
}
