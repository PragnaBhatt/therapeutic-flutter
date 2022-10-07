import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:therapeutic/app/constants/color_constants.dart';
import 'package:therapeutic/app/modules/home/views/widgets/item_widget.dart';
import 'package:therapeutic/app/modules/home/views/widgets/type_widget.dart';

import '../../../../config/config.dart';

class HomeWidget extends StatelessWidget {
  AsyncSnapshot<List<dynamic>> snapData;

  HomeWidget({required this.snapData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
          child: snapData.hasData
              ? Column(
                  children: [
                    Container(
                      height: 264,
                      child: GridView.builder(
                          itemCount: snapData.data![0].length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing:6,
                              mainAxisSpacing: 6),
                          itemBuilder: (ctx, pos) {
                            return TypeWidget(type: snapData.data![0][pos]!);
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 180,
                      child: GridView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 5 / 6,
                              crossAxisSpacing: 4,

                              mainAxisSpacing: 4,
                              crossAxisCount: 1),
                          itemBuilder: (ctx, position) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: GridTile(
                                // child: Text(snapData.data![0][position]!.name),
                                child: Image.network(
                                  '${Config.baseUrl}images/1.jpg',
// height: double.infinity,
//                 width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                footer: Container(
                                  color: ColorConstants.color_black.withOpacity(0.5),
                                  height: 32,
                                    child: Text(
                                  snapData.data![1][position+4]!.name,
                                  textAlign: TextAlign.center
                                      ,
                                )),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //  Text("Top"),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                       // itemCount: snapData.data![1].length,
                        itemCount: 5,
                        itemBuilder: (context, pos) {
                          return ItemWidget(
                            data: snapData.data![1][pos],
                            pos: pos,
                          );
                        })
                  ],
                )
              : Text("NO ANY DATA AVAILABLE....")),
    );
  }
}
