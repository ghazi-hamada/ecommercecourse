import 'package:ecommercecourse/controller/productDetails_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

Row CaunterAndPrice(
    BuildContext context, ProductDetailsControllerImpl controller) {
  return Row(
    children: [
      Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add, size: 20)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            margin: const EdgeInsets.only(bottom: 2),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.black, width: 1),
                borderRadius: BorderRadius.circular(3)),
            child: Text(
              "1",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColor.primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove, size: 20))
        ],
      ),
      const Spacer(),
      Text(
        "\$${controller.itemsModel.itemsPrice}",
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: AppColor.primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      )
    ],
  );
}
