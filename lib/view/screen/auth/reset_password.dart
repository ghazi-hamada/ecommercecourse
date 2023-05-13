import 'package:ecommercecourse/controller/forgetPassword/resetPassword_conttroller.dart';
import 'package:ecommercecourse/core/class/handling_data_view.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/function/validinput.dart';
import 'package:ecommercecourse/view/screen/pages_navbar/auth/TextFormField.dart';
import 'package:ecommercecourse/view/widget/onBoarding/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingDataViewRequesst(
            statusRequest: controller.statusRequest,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formstate,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "30".tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          "32".tr,
                          style: const TextStyle(
                              fontSize: 20, fontFamily: "PT_Sans"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 50),

                      //password
                      FUNTextFormField(
                        obsText: true,
                        controller: controller.password,
                        labeltext: "31".tr,
                        icon: const Icon(Icons.lock_outline),
                        hinttext: "31".tr,
                        valid: (newPassword) =>
                            validinput(newPassword!, 6, 30, "password"),
                      ),
                      //confirm password
                      FUNTextFormField(
                        obsText: true,
                        controller: controller.confirmPassword,
                        labeltext: "33".tr,
                        icon: const Icon(Icons.lock_outline),
                        hinttext: "33".tr,
                        valid: (newPassword) =>
                            validinput(newPassword!, 6, 30, "password"),
                      ),

                      CustomButton(
                        text: "35".tr,
                        onPress: () => controller.successResetPasssword(),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
