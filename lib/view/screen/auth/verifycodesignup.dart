import 'package:ecommercecourse/controller/auth/veriyfycodesignup_controller.dart';
import 'package:ecommercecourse/core/class/handling_data_view.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class VerifyCodeSignUp extends StatelessWidget {
  VerifyCodeSignUp({Key? key}) : super(key: key);
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    verifyCodeSignUpControllerImp controller =
        Get.put(verifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('22'.tr, style: const TextStyle(color: AppColor.grey)),
      ),
      body: GetBuilder<verifyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataViewRequesst(
            statusRequest: controller.statusRequest,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: SingleChildScrollView(
                child: Form(
                  key: formstate,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 30),
                      Text(
                        "20".tr,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          "21".tr,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 15),
                      OtpTextField(
                        fieldWidth: 50.00,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18.0)),
                        numberOfFields: 5,
                        borderColor: AppColor.primaryColor,
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          controller.goTOsuccessSignup(verificationCode);
                        }, // end onSubmit
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
