import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 3),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: AppColor.secoundColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
