import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingWidget extends GetView<OnBoardingControllerImp> {
  const OnBoardingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChange(value);
        },
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) => Column(
          children: [
            const SizedBox(height: 50),
            Text(onBoardingData[index].title!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColor.black)),
            const SizedBox(height: 50),
            Image.asset(onBoardingData[index].image!,
                width: 200, height: 230, fit: BoxFit.fill),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Text(
                onBoardingData[index].description!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    height: 2,
                    color: AppColor.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
