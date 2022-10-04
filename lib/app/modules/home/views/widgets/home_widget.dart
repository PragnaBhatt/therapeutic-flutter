import 'package:flutter/material.dart';
import 'package:therapeutic/app/modules/home/views/widgets/item_widget.dart';
import 'package:therapeutic/app/modules/home/views/widgets/type_widget.dart';

class HomeWidget extends StatelessWidget {
  AsyncSnapshot<List<dynamic>> snapData;

  HomeWidget({required this.snapData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: snapData.hasData
            ? Column(
                children: [



                  Container(
                    height: 362,
                    child: GridView.builder(
                        itemCount: snapData.data![0].length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2),
                        itemBuilder: (ctx, pos) {
                          return TypeWidget(type: snapData.data![0][pos]!);
                        }),
                  ),
                //  Text("Top"),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapData.data![1].length,
                      itemBuilder: (context, pos) {
                        return  ItemWidget( data: snapData.data![1][pos],pos: pos,);
                      })
                ],
              )
            : Text("NO ANY DATA AVAILABLE...."));
  }
}
