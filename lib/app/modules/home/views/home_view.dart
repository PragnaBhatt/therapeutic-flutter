import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:therapeutic/app/modules/home/type_model.dart' as type;
import 'package:therapeutic/app/modules/home/views/widgets/type_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future< List<type.Data>> typeData=   controller.getTypeData();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: typeData,
        builder: (context,snapData) {
          // print(snapData.data[0].i);

          if (snapData.hasError) {
            return Text("error");
          }
        else  if (snapData.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

            return
            snapData!.data!.length>0?

            Column(children: [
              SizedBox(height: 10,),
              Container(

                height: 200,
                child: GridView.builder(
                    itemCount: snapData.data!.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(

                        crossAxisCount: 4,crossAxisSpacing: 2,mainAxisSpacing: 2),
                    itemBuilder: (ctx, pos) {

                      return TypeWidget(type:snapData.data![pos]!);
                    }),
              )
            ])
          :


           Container();

        }
      ),
    );
  }
}
