import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapeutic/app/constants/size_constants.dart';
import 'package:therapeutic/app/modules/home/controllers/home_controller.dart';

import '../../../constants/color_constants.dart';
import '../../models/product_detail_model.dart';
import 'package:flutter_html/flutter_html.dart';

class ProductDetailView extends GetView<HomeController> {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String prodId = Get.arguments;
    Future<ProductDetailModel> data = controller.fetchFoodProductDetail(prodId);
    RxString dataToDisplay = "".obs;
    RxInt activeIndex = 100.obs;
    return Scaffold(
      appBar: AppBar(
        title: Text("Get.arguments!!"),
      ),
      body: FutureBuilder(
          future: data,
          builder: (context, prodDetailSnap) {
            if (prodDetailSnap.hasError) {
              return Text(prodDetailSnap.error.toString());
            } else if (prodDetailSnap.connectionState ==
                ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
            } else if (prodDetailSnap.hasData) {
              dataToDisplay.value = prodDetailSnap.data!.data!.description!;
              activeIndex.value = 0;
              return SingleChildScrollView(
                  child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://png.pngtree.com/png-vector/20210929/ourmid/pngtree-404-not-found-mdern-transparent-background-png-image_3963794.png",
                            height: 250,
                            width: 250,
                          ),
                          Text(
                            prodDetailSnap.data!.data!.name!,
                            style:
                                TextStyle(fontSize: SizeConstants.FONT_SIZE_16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  dataToDisplay.value =
                                      prodDetailSnap.data!.data!.description!;

                                  activeIndex.value = 0;
                                },
                                child: Chip(
                                    elevation: 1,
                                    backgroundColor: activeIndex.value == 0
                                        ? ColorConstants.greeen
                                        : ColorConstants.colorPrimary,
                                    label: Text("Description",
                                        style: TextStyle(color: Colors.white))),
                              ),
                              InkWell(
                                onTap: () {
                                  activeIndex.value = 1;
                                  dataToDisplay.value = prodDetailSnap
                                      .data!.data!.nutritionalBenefits!;
                                },
                                child: Chip(
                                    elevation: 1,
                                    backgroundColor: activeIndex.value == 1
                                        ? ColorConstants.greeen
                                        : ColorConstants.colorPrimary,
                                    label: Text("NutritionalBenefits",
                                        style: TextStyle(color: Colors.white))),
                              ),
                              InkWell(
                                onTap: () {
                                  activeIndex.value = 2;
                                  dataToDisplay.value = prodDetailSnap
                                      .data!.data!.healthBenefits!;
                                },
                                child: Chip(
                                    elevation: 1,
                                    backgroundColor: activeIndex.value == 2
                                        ? ColorConstants.greeen
                                        : ColorConstants.colorPrimary,
                                    label: Text("HealthBenefits",
                                        style: TextStyle(color: Colors.white))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  activeIndex.value = 3;
                                  dataToDisplay.value = prodDetailSnap
                                      .data!.data!.consumptionTips!;
                                },
                                child: Chip(
                                    elevation: 1,
                                    backgroundColor: activeIndex.value == 3
                                        ? ColorConstants.greeen
                                        : ColorConstants.colorPrimary,
                                    label: Text("ConsumptionTips",
                                        style: TextStyle(color: Colors.white))),
                              ),
                              InkWell(
                                onTap: () {
                                  activeIndex.value = 4;
                                  dataToDisplay.value =
                                      prodDetailSnap.data!.data!.caution!;
                                },
                                child: Chip(
                                    elevation: 1,
                                    backgroundColor: activeIndex.value == 4
                                        ? ColorConstants.greeen
                                        : ColorConstants.colorPrimary,
                                    label: Text("Caution",
                                        style: TextStyle(color: Colors.white))),
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[

                                TextButton.icon(onPressed: (){}, icon:  Icon(
                                  Icons.note_alt_outlined,
                                  color: ColorConstants.colorPrimary1,
                                ), label:  Text(
                                  "Add Note",
                                  style: TextStyle(color: ColorConstants.colorPrimary1, fontSize: SizeConstants.FONT_SIZE),
                                ))

                               ,
                               /* SizedBox(
                                  width: 10,
                                ),*/

                                TextButton.icon(


                                    onPressed: (){}, icon:  Icon(
                                  Icons.star_border,
                                  color: ColorConstants.colorPrimary1,
                                ), label:  Text(

                                  "Add to Favorite",

                                  style: TextStyle(color: ColorConstants.colorPrimary1, fontSize: SizeConstants.FONT_SIZE),
                                ))

                              ]),
                          Html(
                            data: dataToDisplay.value,
                            style: {
                              "body": Style(
                                fontSize: FontSize(SizeConstants.FONT_SIZE),
                                fontWeight: FontWeight.normal,
                              ),
                            },
                          ),
                        ],
                      );
                    })),
              ));
            } else {
              return Text("no data found");
            }
          }),
    );
  }
}
