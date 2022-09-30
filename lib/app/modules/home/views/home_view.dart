import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:therapeutic/app/modules/home/type_model.dart' as type;
import 'package:therapeutic/app/modules/home/views/widgets/home_widget.dart';
import 'package:therapeutic/app/modules/home/views/widgets/tab_widget.dart';
import '../../notes/views/notes_view.dart';
import '../controllers/home_controller.dart';
import 'package:therapeutic/app/modules/models/product_model.dart'
    as productModel;
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future<List<type.Data>> typeData = controller.getTypeData();
    Future<List<productModel.Data>> productData =
        controller.fetchFoodProducts("", 20);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: true,
        ),
        bottomNavigationBar: Card(
          elevation: 4,
          child: TabWidget(),
        ),
        body: SafeArea(

          child: TabBarView(
            children: [
              FutureBuilder(
                  // future: typeData,
                  future: Future.wait([typeData, productData]),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapData) {
                    // print(snapData.data[0].i);
                    if (snapData.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapData.hasError) {
                      return Text("error");
                    }
                    return HomeWidget(
                      snapData: snapData,
                    );
                  }),
             // Text("1"),
              NotesView(),
              Text("2"),
              Text("3"),
            ],
          ),
        ),
      ),
    );
  }
}
