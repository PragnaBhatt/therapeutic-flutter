import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:therapeutic/app/modules/home/controllers/home_controller.dart';
import 'package:therapeutic/app/modules/models/product_model.dart'
as productModel;
import '../../../config/config.dart';
import '../../../routes/app_pages.dart';
import '../controllers/search_controller.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txeController = TextEditingController();
  final Debouncer onSearchDebouncer =
  new Debouncer(delay: new Duration(milliseconds: 500));
  HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<productModel.Data>> productData =
    controller.fetchFoodProducts("", txeController.text, 150);
    return Column(
      children: [
        TextField(
          onChanged: (search) {
            if (search.isNotEmpty) {
              controller.fetchFoodProducts("", txeController.text);
            } else {}
            setState(() {});
          },
          controller: txeController,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  txeController.text = "";

                  setState(() {});
                },
              ),
              hintText: 'Search...',
              border: InputBorder.none),
        ),
        Expanded(
          child: FutureBuilder(
              future: productData,
              builder: (context, snapData) {
                if (snapData.hasError) {
                  const Text("Something went wrong!");
                }

                if (snapData.connectionState == ConnectionState.waiting) {
                  CircularProgressIndicator();
                }
                if (!snapData.hasData||   snapData.data!.isEmpty||snapData.data!.length<=0) {
                  Center(child: Text("no data found for ${txeController.text}",style: TextStyle(color: Colors.yellow),));
                }
                return ListView.builder(
                    itemCount: snapData.data!.length,
                    itemBuilder: (ctx, pos) {
                      return InkWell(
                        onTap: (){

                          Get.toNamed(Routes.PRODUCT_DETAIL, arguments:snapData.data![pos]!.sId!);

                        },
                        child: Card(
                          elevation: 2,
                          child: ListTile(

                              leading: Image.network(
                                height: 40,
                                width: 40,
                                '${Config.baseUrlImages}${snapData.data![pos]!
                                    .image}${Config.imagesExtenstion}',
// height: double.infinity,
//                 width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              title: Text(snapData!.data![pos].name!),


                     subtitle: Text(snapData!.data![pos].type!),
                          ),
                        ),
                      );
                      });
              }),
        )
      ],
    );
  }
}
