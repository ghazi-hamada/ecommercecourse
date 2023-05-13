import 'package:ecommercecourse/core/class/translate_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/categories_model.dart';
import 'package:ecommercecourse/link_api.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(left: 15),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 10),
              child: _Categorise(
                  index: index,
                  categoriesModel:
                      CategoriesModel.fromJson(controller.categories[index])),
            );
          }),
    );
  }
}

class _Categorise extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int index;
  const _Categorise({
    Key? key,
    required this.index,
    required this.categoriesModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.goToItems(
        categories: controller.categories,
        index: index,
        categoriesid: categoriesModel.categoriesId.toString(),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 65,
            width: 65,
            child:
                SvgPicture.network(categoryImage, color: AppColor.secoundColor),
          ),
          Text(
            "${translateDatabase(arabic: categoriesModel.categoriesNameAr!, english: categoriesModel.categoriesName!)}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }

  String get categoryImage =>
      "${AppLink.imagecategories}/${categoriesModel.categoriesImage}";
}
