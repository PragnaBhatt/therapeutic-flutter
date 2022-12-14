import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:therapeutic/app/constants/color_constants.dart';
import 'package:therapeutic/app/modules/diseases/views/diseases_view.dart';
import 'package:therapeutic/app/modules/home/type_model.dart' as type;
import 'package:therapeutic/app/modules/home/views/widgets/home_widget.dart';
import 'package:therapeutic/app/modules/home/views/widgets/tab_widget.dart';
import '../../../config/theme/theme_service.dart';
import '../../notes/views/notes_view.dart';
import '../../profile/views/profile_view.dart';
import '../../search/views/search_view.dart';
import '../controllers/home_controller.dart';
import 'package:therapeutic/app/modules/models/product_model.dart'
    as productModel;
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future<List<type.Data>> typeData = controller.getTypeData();
    Future<List<productModel.Data>> productData =
        controller.fetchFoodProducts("","", 20);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: true,
          elevation: 4,
          actions: [ ElevatedButton(
             /* style: ElevatedButton.styleFrom(
               // backgroundColor: context.theme.backgroundColor,
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                textStyle: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),*/
              onPressed:ThemeService().switchTheme,
              child: const Text('Change Theme'))],
        ),

        bottomNavigationBar:const  Card(
          elevation: 4,
          //color: ColorConstants.color_primary_with_40_opacity,
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
                      // return Text("error");
                      return Text(snapData.error.toString());
                    }
                    return HomeWidget(
                      snapData: snapData,
                    );
                  }),
             // Text("1"),
              SearchView(),
              NotesView(),

              DiseasesView(),
              ProfileView(),
            ],
          ),
        ),
      ),
    );
  }
}
