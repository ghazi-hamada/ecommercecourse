import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/screen/pages_navbar/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomescreenController extends GetxController {
  changePage(int index);
  changeColor(int index);
}

class HomescreenControllerImp extends HomescreenController {
  int currentIndex = 0;

  Map data = {
    'pages': [
      const HomePage(),
      const Center(
        child: Text('favorite'),
      ),
      const Center(
        child: Text('person'),
      ),
      const Center(
        child: Text('settings'),
      ),
    ],
    'icons': [
      Icons.home,
      Icons.favorite,
      Icons.person,
      Icons.settings,
    ],
    'text': [
      '51'.tr,
      '52'.tr,
      '53'.tr,
      '54'.tr,
    ]
  };

  @override
  changePage(int index) {
    currentIndex = index;
    update();
  }

  @override
  Color changeColor(int index) =>
      currentIndex == index ? AppColor.primaryColor : Colors.black;
}
