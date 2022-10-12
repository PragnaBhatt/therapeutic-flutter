import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:therapeutic/app/modules/home/controllers/home_controller.dart';
import 'package:therapeutic/app/modules/home/views/widgets/product_list_widget.dart';
import 'package:therapeutic/app/modules/models/product_model.dart'
    as productModel;

class ProductListView extends GetView<HomeController> {
  ProductListView();

  // String categoryName;
  // ProductListView( this.categoryName);
  @override
  Widget build(BuildContext context) {
    String catname = Get.arguments;
    Future<List<productModel.Data>> productData =
        controller.fetchFoodProducts(catname,"");

    return Scaffold(
        appBar: AppBar(
          title: Text(catname),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
              future: productData,
              builder: (context, productSnapData) {
                if (productSnapData.hasError) {
                  return Text(productSnapData.error.toString());
                } else if (productSnapData.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: const CircularProgressIndicator());
                } else if (productSnapData.hasData) {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          crossAxisCount: 3),
                      itemCount: productSnapData.data!.length,
                      itemBuilder: (ctx, pos) {
                        // return Text(productSnapData.data![pos].name!);
                        return ProductListWidget(productSnapData.data![pos]);
                      });
                } else {
                  return Text("no data found");
                }
              }),
        ));
  }
}
