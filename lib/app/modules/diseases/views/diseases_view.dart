import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:therapeutic/app/commons/utils/dialogs.dart';

import '../../../routes/app_pages.dart';
import '../controllers/diseases_controller.dart';
import '../models/diseases_model.dart' as diseases;

class DiseasesView extends StatefulWidget {
  DiseasesView({Key? key}) : super(key: key);

  @override
  State<DiseasesView> createState() => _DiseasesViewState();
}

class _DiseasesViewState extends State<DiseasesView> {
  late DiseasesController controller;
  late Future<List<diseases.Data>> data;
  late List<diseases.Data> allData;
  late List<diseases.Data> filteredData;
  TextEditingController txeController = TextEditingController();

  @override
  void initState() {
    controller = Get.find<DiseasesController>();
    data = controller.getDiseases("").then((value) {
      return filteredData = allData = value;
    });

    super.initState();
  }
@override
  void dispose() {

  txeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Column(
                  children: [
                    Center(
                      child: TextField(
                        onChanged: (search) {
                          if (search.isNotEmpty) {
                            filteredData = RxList();
                            for (int i = 0; i < allData.length; i++) {
                              if (allData[i]
                                  .name!
                                  .toLowerCase()
                                  .contains(search.toLowerCase())) {
                                filteredData.add(allData[i]);
                              }
                            }
                          } else {
                            filteredData = allData;
                          }
                          setState(() {});
                        },
                        controller: txeController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                txeController.text = "";
                                filteredData = allData;
                                setState(() {});
                              },
                            ),
                            hintText: 'Search...',
                            border: InputBorder.none),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: filteredData.length,
                          itemBuilder: (ctx, pos) {
                            return Card(
                              elevation: 2,
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.DISEASES_FOOD,
                                      arguments: filteredData[pos].name!);
                                },
                                child: ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${filteredData[pos].name!}   (${filteredData[pos].total})"),
                                  ),
                                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                );
              }
            }),
      ),
    );
  }
}
