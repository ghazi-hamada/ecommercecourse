import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:ecommercecourse/core/function/aleretexitapp.dart';
import 'package:ecommercecourse/view/widget/home/custom_bottom_NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarButton extends StatelessWidget {
  const NavbarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreenControllerImp());
    return GetBuilder<HomescreenControllerImp>(
        builder: (controller) => WillPopScope(
              onWillPop: aleretexitapp,
              child: Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.shopping_cart),
                ),
                bottomNavigationBar: const CustomButtonNavbar(),
                body:
                    controller.data['pages'].elementAt(controller.currentIndex),
              ),
            ));
  }
}
