import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../routes/app_pages.dart';
import '../controllers/diseases_controller.dart';
import '../models/diseases_food_model.dart' as food;

class DiseasesFoodListView extends GetView<DiseasesController> {
  DiseasesFoodListView({Key? key}) : super(key: key);
  String name = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Future<List<food.Data>> data = controller.getFoodForDiseases(name);

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());

              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (ctx, pos) {
                      return Card(
                        elevation: 2,
                        child: InkWell(
                          onTap: () {
                            // Get.toNamed(Routes.DISEASES_FOOD,
                            //     arguments: snapshot.data![pos].name!);

                            /* Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {
                              "name": snapshot.data![pos].diseases
                            });*/
                            print(
                                "id..... ${snapshot.data![pos].results![0]!.sId}");
                            // Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {
                            //   "id": snapshot.data![pos].results![0]!.sId
                            // });
                            Get.toNamed(Routes.PRODUCT_DETAIL,
                                arguments:
                                    snapshot.data![pos].results![0]!.sId);
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    '${Config.baseUrlImages}${snapshot.data![pos].image}${Config.imagesExtenstion}',
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  )),
                              Expanded(
                                child: ListTile(
                                  title:
                                      Text("${snapshot.data![pos].food!}   "),
                                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
            }),
      ),
    );
  }
}
