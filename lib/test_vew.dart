import 'package:ecommercecourse/controller/test_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestVew extends StatelessWidget {
  const TestVew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: Column(
        children: const [],
      ),
    );
  }
}
