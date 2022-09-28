import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:therapeutic/app/constants/color_constants.dart';
import 'package:therapeutic/app/modules/models/product_model.dart'
    as productModel;

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
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(data!.type!),

          subtitle: Column(
           // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

          //    Text(data!.name!,style: TextStyle(color: Colors.black,),textAlign: TextAlign.right,),

              Html(data: str, shrinkWrap: true),

              Container(
                child: Text(data!.name!,style: TextStyle(color: Colors.black,backgroundColor: Colors.deepOrange),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0,bottom: 8.0),
                child: Divider(height: 1,color: ColorConstants.color_black,),
              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.note_alt_outlined,color: Colors.black,),
                    Text("Add Note",style: TextStyle(color: Colors.black),),
                SizedBox(width: 10,),
                    Icon(Icons.star_border,color: Colors.black,),
                    Text("Add to Favorite",style: TextStyle(color: Colors.black),),
                SizedBox(width: 10,),

                Icon(Icons.remove_red_eye,color: Colors.black,),
                Text(" ${data!.noOfViews!.toString()}",style: TextStyle(color: Colors.black),)
              ])
            ],
          ),
          leading: Icon(
            Icons.account_tree_sharp,
            color: Colors.deepOrange,
            size: 40,
          ),
        ),
      ),
    );
  }
}
