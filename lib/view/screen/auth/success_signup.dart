import 'package:ecommercecourse/controller/auth/successSignup_Controller.dart';
import 'package:ecommercecourse/view/widget/onBoarding/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignupControllerImp controller =
        Get.put(SuccessSignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('39'.tr, style: const TextStyle(color: AppColor.grey)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(children: [
            const Icon(
              Icons.check_circle_outline,
              color: AppColor.primaryColor,
              size: 200,
            ),
            //
            Text(
              "40".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 25),
            ),
            Text(
              "41".tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            CustomButton(
              text: "42".tr,
              onPress: () {
                controller.gotologin();
              },
            ),
            const SizedBox(
              height: 30,
            )
          ]),
        ),
      ),
    );
  }
}
