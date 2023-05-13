import 'package:ecommercecourse/controller/forgetPassword/forgetpassword_controller.dart';
import 'package:ecommercecourse/core/class/handling_data_view.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/screen/pages_navbar/auth/TextFormField.dart';
import 'package:ecommercecourse/view/widget/onBoarding/custom_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('17'.tr, style: const TextStyle(color: AppColor.grey)),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataViewRequesst(
            statusRequest: controller.statusRequest,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //title page as logo
                    Text(
                      "18".tr,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 7),

                    //body page as logo
                    Text(
                      "19".tr,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    //email
                    Form(
                      key: controller.formstate,
                      child: FUNTextFormField(
                        obsText: false,
                        controller: controller.email,
                        labeltext: "9".tr,
                        icon: const Icon(Icons.email_outlined),
                        hinttext: "10".tr,
                        valid: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid Email'
                                : null,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //button
                    CustomButton(
                      text: "18".tr,
                      onPress: () {
                        controller.checkEmail();
                      },
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
