import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:therapeutic/app/modules/models/product_model.dart'
    as productModel;

class ItemWidget extends StatelessWidget {
  productModel.Data data;
  int pos;

  ItemWidget({required this.data, required this.pos});

  @override
  Widget build(BuildContext context) {
    String str = data!.description!;
    str = str.substring(0, 400) + "...";
    return Card(
      elevation: 1,
      child: ListTile(
        title: Text(data!.name!),
        subtitle: Column(
          children: [
            Html(data: str, shrinkWrap: true),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

              Icon(Icons.remove_red_eye,color: Colors.black,),
              Text(data!.noOfViews!.toString(),style: TextStyle(color: Colors.black),)
            ])
          ],
        ),
        leading: Icon(
          Icons.ac_unit,
          size: 40,
        ),
      ),
    );
  }
}
