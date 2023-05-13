import 'package:ecommercecourse/app_routes.dart';
import 'package:ecommercecourse/core/localization/change_local.dart';
import 'package:ecommercecourse/view/widget/language/custum_button_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: deprecated_member_use
            Text("lang".tr, style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 20),
            CustumButtonLang(
                text: "lanA".tr,
                function: () {
                  controller.changeLang("ar");
                  Get.toNamed(AppRoutes.kOnboarding);
                }),
            CustumButtonLang(
                text: "lanE".tr,
                function: () {
                  controller.changeLang("en");
                  Get.toNamed(AppRoutes.kOnboarding);
                }),
          ],
        ),
      ),
    );
  }
}
