import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:therapeutic/app/modules/home/type_model.dart' as typeModel;

class TypeWidget extends StatelessWidget {
  typeModel.Data type;

  // String  type;
  TypeWidget({super.key, required this.type});

  // TypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Center(
        child: Container(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://flutterawesome.com/content/images/2021/07/Accessories.jpg',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4,),
              Text(
                "${type.name} (${type.total.toString()})",
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
