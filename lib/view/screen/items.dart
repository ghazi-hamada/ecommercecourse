import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/class/handling_data_view.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:ecommercecourse/view/widget/home/custum_appbar.dart';
import 'package:ecommercecourse/view/widget/items/custom_list_items.dart';
import 'package:ecommercecourse/view/widget/items/list_categorise_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<ItemsControllerImp>(
            builder: (controller) => ListView(
                  children: [
                    CustumAppbar(
                      onTapIcon: () {},
                      titleAppBar: "Search",
                    ),
                    const ListCategoriesItems(),
                    HandlingItems(
                      statusRequest: controller.statusRequest,
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.items.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.7),
                          itemBuilder: (context, index) {
                            return CustomListItems(
                                itemsModel: ItemsModel.fromJson(
                                    controller.items[index]));
                          }),
                    )
                  ],
                )),
      ),
    );
  }
}
