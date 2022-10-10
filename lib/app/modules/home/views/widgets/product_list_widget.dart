import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapeutic/app/modules/models/product_model.dart'
    as productModel;
import 'package:therapeutic/app/routes/app_pages.dart';

import '../../../../config/config.dart';
import '../../../../constants/color_constants.dart';

class ProductListWidget extends StatelessWidget {
  // const ProductListWidget({Key? key}) : super(key: key);
  productModel.Data productData;

  ProductListWidget(this.productData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAIL, arguments: productData.sId!);
        // Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"id": productData.sId!});
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.0),
        child: GridTile(
          child: Image.network(
            '${Config.baseUrlImages}${productData!.image}${Config.imagesExtenstion}',
            fit: BoxFit.cover,
          ),
          footer: Container(
              height: 32,
              color: ColorConstants.color_black.withOpacity(0.5),
              // child: Text(productData.name!,style: TextStyle(color: Colors.black))),
              child: Text(productData.name!,
                  maxLines: 2, textAlign: TextAlign.center)),
        ),
      ),
    );
  }
}
