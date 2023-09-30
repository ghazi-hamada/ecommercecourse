import 'package:ecommercecourse/controller/productDetails_controller.dart';
import 'package:ecommercecourse/view/widget/product_detaails/bottomNavigationBar_widget.dart';
import 'package:ecommercecourse/view/widget/product_detaails/color_widget.dart';
import 'package:ecommercecourse/view/widget/product_detaails/details_image.dart';
import 'package:ecommercecourse/view/widget/product_detaails/title_body_details_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsControllerImpl());
    return Scaffold(
      bottomNavigationBar: bottomNavigationBarWidget(),
      body: ListView(
        children: [
          DetailsImage(controller),
          const SizedBox(height: 100),
          TitleBodyDetailsProduct(controller, context),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Get.width / 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Color",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ...List.generate(
                        controller.subItems.length,
                        (index) => colorWidget(
                              active: controller.subItems[index]['active'],
                              text: controller.subItems[index]['name'],
                            ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
