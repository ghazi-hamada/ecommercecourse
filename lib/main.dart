import 'package:ecommercecourse/app_routes.dart';
import 'package:ecommercecourse/bindings/intialbindings.dart';
import 'package:ecommercecourse/core/localization/change_local.dart';
import 'package:ecommercecourse/core/localization/translation.dart';
import 'package:ecommercecourse/core/services/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocaleController());
    return GetMaterialApp(
      locale: controller.language!,
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce Course',
      translations: MyTranslations(),
      theme: controller.appTheme,
      initialBinding: Intialbindings(),
      getPages: AppRoutes.getPages,
    );
  }
}
