import 'package:ecommercecourse/controller/favorite/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/class/translate_database.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/link_api.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomListItems({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return InkWell(
      onTap: () => controller.goProductDetails(itemsModel),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${translateDatabase(arabic: itemsModel.itemsNameAr!, english: itemsModel.itemsName!)}",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              //rating and text widget row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rating 3.5",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColor.primaryColor,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 22,
                    child: Row(
                      children: [
                        ...List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                ))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "${itemsModel.itemsPrice} \$",
                    style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  GetBuilder<FavoriteController>(
                    builder: (controller) => IconButton(
                        onPressed: () {
                          controller.setFavorite(
                              "${itemsModel.itemsId}", '0', itemsModel);
                        },
                        icon: Icon(
                          controller.isFavorite["${itemsModel.itemsId}"] == '1'
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              controller.isFavorite["${itemsModel.itemsId}"] ==
                                      '1'
                                  ? AppColor.primaryColor
                                  : null,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
