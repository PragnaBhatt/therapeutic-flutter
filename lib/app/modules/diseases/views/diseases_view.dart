import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:therapeutic/app/commons/utils/dialogs.dart';

import '../../../routes/app_pages.dart';
import '../controllers/diseases_controller.dart';
import '../models/diseases_model.dart' as diseases;

class DiseasesView extends GetView<DiseasesController> {
  const DiseasesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<diseases.Data>> data = controller.getDiseases("");
    return Scaffold(
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
                            Get.toNamed(Routes.DISEASES_FOOD,
                                arguments: snapshot.data![pos].name!);
                          },
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "${snapshot.data![pos].name!}   (${snapshot.data![pos].total})"),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_sharp),
                          ),
                        ),
                      );
                    });
            }),
      ),
    );
  }
}
