import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:ecommercecourse/view/widget/home/custom_tixt_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonNavbar extends GetView<HomescreenControllerImp> {
  const CustomButtonNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        children: [
          ...List.generate(
            controller.data['icons'].length + 1,
            (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CustomTextIcon(
                      text: controller.data['text'][i],
                      icon: controller.data['icons'][i],
                      index: i,
                    );
            },
          ),
        ],
      ),
    );
  }
}
