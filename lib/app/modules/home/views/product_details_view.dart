import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapeutic/app/modules/home/controllers/home_controller.dart';

import '../../models/product_detail_model.dart';
import 'package:flutter_html/flutter_html.dart';

class ProductDetailView extends GetView<HomeController> {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String prodId = Get.arguments;
    Future<ProductDetailModel> data = controller.fetchFoodProductDetail(prodId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Get.arguments!!"),
      ),
      body: FutureBuilder(
          future: data,
          builder: (context, prodDetailSnap) {
            if (prodDetailSnap.hasError) {
              return Text(prodDetailSnap.error.toString());
            } else if (prodDetailSnap.connectionState ==
                ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
            } else if (prodDetailSnap.hasData) {
              return SingleChildScrollView(
                  child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://png.pngtree.com/png-vector/20210929/ourmid/pngtree-404-not-found-mdern-transparent-background-png-image_3963794.png",
                      height: 100,
                      width: 200,
                    ),
                    Text(prodDetailSnap.data!.data!.name!),
                    Html(data:prodDetailSnap.data!.data!.description! ),

                  ],
                ),
              ));
            } else {
              return Text("no data found");
            }
          }),
    );
  }
}
