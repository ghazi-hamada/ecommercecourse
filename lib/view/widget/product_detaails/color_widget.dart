import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

Container colorWidget({
  required String active,
  required String text,
}) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    alignment: Alignment.center,
    height: 60,
    width: 100,
    decoration: BoxDecoration(
      color: active == '1' ? AppColor.fourthColler : Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColor.fourthColler.withOpacity(0.3)),
    ),
    child: Text(
      text,
      style: TextStyle(
          color: active == '1' ? Colors.white : AppColor.fourthColler,
          fontSize: 16,
          fontWeight: FontWeight.bold),
    ),
  );
}
