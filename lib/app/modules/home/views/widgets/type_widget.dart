import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:therapeutic/app/constants/color_constants.dart';
import 'package:therapeutic/app/modules/home/type_model.dart' as typeModel;
import 'package:therapeutic/app/modules/home/views/product_list_view.dart';
import 'package:therapeutic/app/routes/app_pages.dart';

import '../../../../config/config.dart';

class TypeWidget extends StatelessWidget {
  typeModel.Data type;

  // String  type;
  TypeWidget({super.key, required this.type});

  // TypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("URL... ${Config.baseUrl}images/1.jpg");
    return InkWell(
        onTap: () {
          Get.toNamed(Routes.PRODUCT_LIST, arguments: type.name);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: GridTile(
            child: Image.network(
              '${Config.baseUrl}images/1.jpg',
// height: double.infinity,
//                 width: double.infinity,
              fit: BoxFit.cover,
            ),
            footer: Container(
              height: 32,
              color: ColorConstants.color_black.withOpacity(0.5),
              child: Text(
                "${type.name} (${type.total.toString()})",  maxLines: 2,
                  textAlign: TextAlign.center
              ),
            ),
          ),
        )

        /*Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image.network(
          //   'https://flutterawesome.com/content/images/2021/07/Accessories.jpg',
          //   height: 70,
          //   width: 70,
          //   fit: BoxFit.cover,
          // ),
      ClipRRect(
      borderRadius: BorderRadius.circular(4),
       child:   Image.network(
            Config.baseUrlImages + type!.image! + Config.imagesExtenstion,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          )),
          SizedBox(height: 4,),
          Text(
           // " (${type.total.toString()})",
             "${type.name} (${type.total.toString()})",
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),*/
        );
  }
}
