import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/class/translate_database.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:ecommercecourse/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _Items(
              itemsModel: ItemsModel.fromJson(controller.items[index]));
        },
      ),
    );
  }
}

class _Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const _Items({
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    // custom card for items
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CachedNetworkImage(
            imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage}",
            fit: BoxFit.scaleDown,
            height: 100,
            width: 150,
            placeholder: (context, url) => const CircularProgressIndicator(
              color: Colors.white,
              value: 0.7,
              strokeWidth: 2.0,
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 110,
          width: 160,
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 110,
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  translateDatabase(
                      english: "${itemsModel.itemsName}",
                      arabic: "${itemsModel.itemsNameAr}"),
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
