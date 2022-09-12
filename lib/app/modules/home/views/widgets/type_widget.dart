import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:therapeutic/app/modules/home/type_model.dart';

class TypeWidget extends StatelessWidget {
  Type type;
  TypeWidget({super.key,required this.type});
  // TypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(type.data![0].sId!)],
    );
  }
}
