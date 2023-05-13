import 'package:ecommercecourse/app_routes.dart';
import 'package:ecommercecourse/core/services/servises.dart';
import 'package:ecommercecourse/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChange(int index);
  skip();
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentIndex = 0;
  MyServices myServices = Get.find();
  late PageController pageController;
  @override
  onPageChange(int index) {
    currentIndex = index;
    update();
  }

  @override
  next() {
    currentIndex++;
    if (currentIndex > onBoardingData.length - 1) {
      myServices.sharedPreferences.setString('step', '1');
      print('object');
      Get.offAllNamed(AppRoutes.kLogin);
    } else {
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
    update();
  }

  @override
  skip() {}

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
