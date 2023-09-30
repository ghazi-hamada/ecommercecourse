import 'package:ecommercecourse/controller/favorite/myFavorite_controller.dart';
import 'package:ecommercecourse/core/class/handling_data_view.dart';
import 'package:ecommercecourse/view/widget/home/custum_appbar.dart';
import 'package:ecommercecourse/view/widget/myfavorite/custom_list_favorite_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GetBuilder<MyFavoriteController>(
        builder: (controller) => ListView(
          children: [
            CustumAppbar(
                titleAppBar: "", onTapIconNoti: () {}, onTapIconFav: () {}),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CustomListFavoriteItems(
                        itemsModel: controller.data[index]);
                  },
                ))
          ],
        ),
      ),
    ));
  }
}
//MyFavoriteModel
