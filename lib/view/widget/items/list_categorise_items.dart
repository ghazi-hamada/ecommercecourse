import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/class/translate_database.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/categories_model.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ItemsControllerImp());
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
                  onPress: () {
                    //controller.changeIndex(index);
                  },
                  categoriesModel:
                      CategoriesModel.fromJson(controller.categories[index])),
            );
          }),
    );
  }
}

class _Categorise extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final int index;
  final void Function() onPress;
  const _Categorise({
    Key? key,
    required this.index,
    required this.categoriesModel,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItemsControllerImp());
    return InkWell(
      onTap: () => controller.changeIndex(
          index, categoriesModel.categoriesId.toString()),
      child: Column(
        children: [
          const SizedBox(height: 5),
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.only(
                  bottom: 5, right: 10, left: 10, top: 10),
              decoration: index != controller.index
                  ? null
                  : const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColor.primaryColor,
                          width: 3,
                        ),
                      ),
                    ),
              child: Text(
                "${translateDatabase(arabic: categoriesModel.categoriesNameAr!, english: categoriesModel.categoriesName!)}",
                style: TextStyle(
                    fontSize: 20,
                    color: index == controller.index
                        ? AppColor.primaryColor
                        : AppColor.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
