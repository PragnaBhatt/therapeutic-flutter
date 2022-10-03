import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapeutic/app/modules/models/product_model.dart'
    as productModel;
import 'package:therapeutic/app/routes/app_pages.dart';

class ProductListWidget extends StatelessWidget {
  // const ProductListWidget({Key? key}) : super(key: key);
  productModel.Data productData;

  ProductListWidget(this.productData);

  @override
  Widget build(BuildContext context) {
    return InkWell(

        onTap: (){Get.toNamed(Routes.PRODUCT_DETAIL,arguments: productData.sId!);},

      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.0),
        child: GridTileBar(
          backgroundColor: Colors.green,
          title: Image.network(
              "https://png.pngtree.com/png-vector/20210929/ourmid/pngtree-404-not-found-mdern-transparent-background-png-image_3963794.png"),
          subtitle: Container(
              color: Colors.black12,
              // child: Text(productData.name!,style: TextStyle(color: Colors.black))),
              child: Text(productData.name!,
                  style: TextStyle(color: Colors.black))),
        ),
      ),
    );
  }
}
