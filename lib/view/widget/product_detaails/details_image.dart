import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/productDetails_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Stack DetailsImage(ProductDetailsControllerImpl controller) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 200,
        decoration: const BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      Positioned(
        top: 50,
        right: Get.width / 20,
        left: Get.width / 20,
        child: Hero(
          tag: controller.itemsModel.itemsId.toString(),
          child: CachedNetworkImage(
            imageUrl:
                "${AppLink.imageItems}/${controller.itemsModel.itemsImage!}",
            height: 250,
            fit: BoxFit.fill,
            width: Get.width,
          ),
        ),
      ),
    ],
  );
}
