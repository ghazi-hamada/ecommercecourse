import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> aleretexitapp() {
  Get.defaultDialog(
      title: "",
      middleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
      middleText: "43".tr,
      actions: [
        MaterialButton(
          onPressed: () {
            exit(0);
          },
          child: const Text(
            "yes",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        MaterialButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel",
              style: TextStyle(fontWeight: FontWeight.w700)),
        ),
      ]);
  return Future.value(true);
}
