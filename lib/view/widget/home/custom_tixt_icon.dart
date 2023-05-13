import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final int index;
  const CustomTextIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreenControllerImp>(
      builder: (controller) => MaterialButton(
        onPressed: () => controller.changePage(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: controller.changeColor(index)),
            Text(text, style: TextStyle(color: controller.changeColor(index)))
          ],
        ),
      ),
    );
  }
}
