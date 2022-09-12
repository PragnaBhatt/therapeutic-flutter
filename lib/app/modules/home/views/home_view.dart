import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:therapeutic/app/modules/home/type_model.dart' as type;
import 'package:therapeutic/app/modules/home/views/widgets/type_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future< List<type.Type>> typeData=   controller.getTypeData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: typeData,
        builder: (context,snapData) {
          return Column(children: [
            GridView.builder(
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (ctx, pos) {
                  return TypeWidget(type: snapData.data![pos],);
                })
          ]);
        }
      ),
    );
  }
}
