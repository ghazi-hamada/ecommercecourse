import 'package:collection/collection.dart';

class CategoriesModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;

  CategoriesModel({
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDatetime,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      categoriesId: json['categories_id'] as int?,
      categoriesName: json['categories_name'] as String?,
      categoriesNameAr: json['categories_name_ar'] as String?,
      categoriesImage: json['categories_image'] as String?,
      categoriesDatetime: json['categories_datetime'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'categories_id': categoriesId,
        'categories_name': categoriesName,
        'categories_name_ar': categoriesNameAr,
        'categories_image': categoriesImage,
        'categories_datetime': categoriesDatetime,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CategoriesModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      categoriesId.hashCode ^
      categoriesName.hashCode ^
      categoriesNameAr.hashCode ^
      categoriesImage.hashCode ^
      categoriesDatetime.hashCode;
}
