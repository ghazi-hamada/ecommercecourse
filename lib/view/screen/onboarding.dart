import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/view/widget/onBoarding/custom_button.dart';
import 'package:ecommercecourse/view/widget/onBoarding/onboarding_widget.dart';
import 'package:ecommercecourse/view/widget/onBoarding/point_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends GetView<OnBoardingControllerImp> {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // onboarding widget
            const OnBoardingWidget(),
            // point indicator
            const PointIndicator(),
            // custom button
            CustomButton(text: "next".tr, onPress: () => controller.next()),
          ],
        ),
      ),
    );
  }
}
