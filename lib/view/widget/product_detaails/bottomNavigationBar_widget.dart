import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container bottomNavigationBarWidget() {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width / 20, vertical: 20),
      height: 40,
      child: MaterialButton(
        onPressed: () {},
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "Add to cart",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ));
}
