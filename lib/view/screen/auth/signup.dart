import 'package:ecommercecourse/controller/auth/singup_controller.dart';
import 'package:ecommercecourse/core/class/handling_data_view.dart';
import 'package:ecommercecourse/core/function/aleretexitapp.dart';
import 'package:ecommercecourse/core/function/validinput.dart';
import 'package:ecommercecourse/view/widget/auth/TextFormField.dart';
import 'package:ecommercecourse/view/widget/auth/goToLoginOrSignup.dart';
import 'package:ecommercecourse/view/widget/onBoarding/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommercecourse/core/constant/color.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SingupControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text('15'.tr,
              style: Theme.of(context)
                  .textTheme
                  // ignore: deprecated_member_use
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: WillPopScope(
          onWillPop: aleretexitapp,
          child: GetBuilder<SingupControllerImp>(
            builder: (controller) => HandlingDataViewRequesst(
                statusRequest: controller.statusRequest,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formstate,
                      child: Column(
                        children: <Widget>[
                          //title page as logo
                          Text(
                            "23".tr,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 7),

                          //body page as logo
                          Text(
                            "24".tr,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 85),

                          //name
                          FUNTextFormField(
                            controller: controller.name,
                            labeltext: "25".tr,
                            icon: const Icon(Icons.person_outline),
                            hinttext: "26".tr,
                            valid: (value) {
                              return validinput(value!, 8, 50, 'name');
                            },
                          ),

                          //email
                          FUNTextFormField(
                              keyboard_Type: TextInputType.emailAddress,
                              controller: controller.email,
                              labeltext: "9".tr,
                              icon: const Icon(Icons.email_outlined),
                              hinttext: "10".tr,
                              valid: (email) =>
                                  validinput(email!, 10, 50, "email")),

                          // phone
                          FUNTextFormField(
                            keyboard_Type: TextInputType.number,
                            controller: controller.phone,
                            labeltext: "27".tr,
                            icon: const Icon(Icons.phone_android_outlined),
                            hinttext: "28".tr,
                            valid: (phone) =>
                                validinput(phone!, 9, 15, "phone"),
                          ),

                          //password
                          FUNTextFormField(
                            obsText: controller.isShowPassword,
                            onTapIcon: () {
                              controller.showPassword();
                            },
                            controller: controller.password,
                            labeltext: "11".tr,
                            icon: Icon(
                              controller.isShowPassword
                                  ? Icons.lock_outline
                                  : Icons.lock_open_outlined,
                            ),
                            hinttext: "12".tr,
                            valid: (password) =>
                                validinput(password!, 6, 30, "password"),
                          ),

                          //Button Sign up
                          CustomButton(
                            text: "15".tr,
                            onPress: () => controller.singup(),
                          ),

                          const SizedBox(height: 30),
                          //if you have Account
                          TextSingUpAndIn(
                            body: "29".tr,
                            action: "14".tr,
                            onPressAction: () => controller.goTologin(),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ));
  }
}
