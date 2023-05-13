import 'package:ecommercecourse/controller/auth/login_controller.dart';
import 'package:ecommercecourse/core/class/handling_data_view.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/function/validinput.dart';
import 'package:ecommercecourse/view/widget/auth/TextFormField.dart';
import 'package:ecommercecourse/view/widget/auth/goToLoginOrSignup.dart';
import 'package:ecommercecourse/view/widget/onBoarding/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            'Sign In',
            style: TextStyle(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataViewRequesst(
              statusRequest: controller.statusRequest,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        //Image logo
                        Image.asset(AppImageAsset.logo, fit: BoxFit.fill),
                        //Email
                        FUNTextFormField(
                          controller: controller.email,
                          labeltext: "9".tr,
                          icon: const Icon(Icons.email_outlined),
                          hinttext: "10".tr,
                          valid: (email) =>
                              validinput(email!, 10, 100, 'email'),
                        ),
                        //Password
                        FUNTextFormField(
                          obsText: controller.isShowPassword,
                          onTapIcon: () => controller.showPassword(),
                          controller: controller.password,
                          labeltext: "11".tr,
                          icon: Icon(
                            controller.isShowPassword
                                ? Icons.lock_outline
                                : Icons.lock_open_outlined,
                          ),
                          hinttext: "12".tr,
                          valid: (password) =>
                              validinput(password!, 5, 30, 'password'),
                        ),
                        //Forget Password
                        InkWell(
                          onTap: () => controller.goToForgetPassword(),
                          child: Text(
                            "13".tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.w200,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        //Button
                        CustomButton(
                          text: "14".tr,
                          onPress: () {
                            controller.login();
                          },
                        ),
                        const SizedBox(height: 30),
                        TextSingUpAndIn(
                          body: "16".tr,
                          action: "15".tr,
                          onPressAction: () => controller.goToSignUp(),
                        )
                      ],
                    )),
              )),
        ));
  }
}
