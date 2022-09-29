import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:therapeutic/app/constants/color_constants.dart';
import 'package:therapeutic/app/modules/models/product_model.dart'
    as productModel;
import 'package:therapeutic/app/routes/app_pages.dart';//odel;

class ItemWidget extends StatelessWidget {
  productModel.Data data;
  int pos;

  ItemWidget({required this.data, required this.pos});

  @override
  Widget build(BuildContext context) {
    String str = data!.description!;
    str = str.substring(0, 430) + "...";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ((){Get.toNamed(Routes.PRODUCT_DETAIL,arguments: data!.sId!);}),
        child: Card(
         // elevation: 1,
          child: ListTile(
            title: Text(data!.name!),
            subtitle: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Html(data: str, shrinkWrap: true),
                InkWell(
                  onTap: ((){Get.toNamed(Routes.PRODUCT_LIST,arguments: data!.type!);}),
                  child: Chip(

                    elevation: 1,
                      backgroundColor: ColorConstants. colorPrimaryDark,
                      label:
                          Text(data!.type!, style: TextStyle(color: Colors.white))),

                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                  child: Divider(
                    height: 1,
                    color: ColorConstants.color_black,
                  ),
                ),

                Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                  Icon(
                    Icons.note_alt_outlined,
                    color: Colors.black,
                  ),
                  Text(
                    "Add Note",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.star_border,
                    color: Colors.black,
                  ),
                  Text(
                    "Add to Favorite",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                  ),
                  Text(
                    " ${data!.noOfViews!.toString()}",
                    style: TextStyle(color: Colors.black),
                  )
                ])
              ],
            ),
            leading: Icon(
              Icons.account_tree_sharp,
              color: ColorConstants.colorPrimaryDark,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
