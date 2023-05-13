import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/productDetails_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsControllerImpl());
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                ),
                Positioned(
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imageItems}/${controller.itemsModel.itemsImage!}",
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
