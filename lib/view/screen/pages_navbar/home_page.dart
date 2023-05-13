import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/class/handling_data_view.dart';
import 'package:ecommercecourse/view/widget/home/custom_card_home.dart';
import 'package:ecommercecourse/view/widget/home/custom_title_home.dart';
import 'package:ecommercecourse/view/widget/home/custum_appbar.dart';
import 'package:ecommercecourse/view/widget/home/list_categorise_home.dart';
import 'package:ecommercecourse/view/widget/home/list_items_home.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              //textformfiled and icon nafiction in row
              CustumAppbar(
                onTapIcon: () {},
                titleAppBar: "Search",
              ),
              // contianer for offers
              const customCardHome(
                title: "A summer surprise",
                body: "Cashback 20%",
              ),
              // listview for categories
              const CustomTitleHome(title: "Categories"),
              const ListCategoriesHome(),
              // title for product
              const CustomTitleHome(title: "Product for you"),
              const SizedBox(height: 10),
              // listview for product
              const ListItemsHome(),
              // title for product
              const CustomTitleHome(title: "Offer for you"),
              // listview for product
              const ListItemsHome(),
            ],
          ),
        ),
      ),
    );
  }
}
