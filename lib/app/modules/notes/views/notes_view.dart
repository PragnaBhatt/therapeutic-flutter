import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:therapeutic/app/commons/utils/dialogs.dart';
import 'package:therapeutic/app/constants/color_constants.dart';

import '../../../constants/size_constants.dart';
import '../controllers/notes_controller.dart';
import 'package:therapeutic/app/modules/notes/models/notes_model.dart'
    as notesModel;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math' as math;

class NotesView extends GetView<NotesController> {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<notesModel.AllNote>> notesFuture = controller.getNotes();

    return Scaffold(
//       floatingActionButton: FloatingActionButton(onPressed: (){
//
// // BottomSheet(onClosing: (){}, builder: (_){return Text("");});
// showModalBottomSheet(context: context, builder: (ctx){return Container();});
//
//       },child: CircleAvatar(
//           radius: 30,
//           backgroundColor: ColorConstants.colorCanvas,
//           child: Icon(Icons.bookmark_add,color: ColorConstants.colorPrimaryDark,size: 30,))),
      body: FutureBuilder(
          future: notesFuture,
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapShot.hasError) {
              return Center(
                child: Text(
                  '${snapShot.error.toString()}',
                  style: TextStyle(fontSize: 20),
                ),
              );
            } else {
              return


                Container(
                // decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.topRight,
                //       end: Alignment.bottomLeft,
                //       stops: [
                //         0.1,
                //         0.4,
                //         0.6,
                //         0.9,
                //       ],
                //       colors: [
                //         Colors.yellow.withOpacity(0.1),
                //         Colors.red.withOpacity(0.1),
                //         Colors.indigo.withOpacity(0.1),
                //         Colors.teal.withOpacity(0.1),
                //       ],
                //     )),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GridView.custom(
                    gridDelegate: SliverWovenGridDelegate.count(
                      crossAxisCount: 2,
                      // mainAxisSpacing: 1,
                      // crossAxisSpacing: 1,
                      pattern: [
                        WovenGridTile(
                          5 / 7,
                          crossAxisRatio: 1,
                          alignment: AlignmentDirectional.center,
                        ),
                        WovenGridTile(
                          6 / 7,
                          crossAxisRatio: 1,
                          alignment: AlignmentDirectional.center,
                        ),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      childCount: snapShot.data!.length,
                      (context, index) => Container(
                          decoration: const BoxDecoration(
                            //   color: ColorConstants.colorPrimary1,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Card(
                                // shadowColor: Colors.primaries[math.Random()
                                //     .nextInt(Colors.accents.length)]
                                //     .withOpacity(0.10),
                                elevation: 2,
// color: ColorConstants.brown_shade2,
                                color: Color((math.Random().nextDouble() *
                                            0xFFdb87b4)
                                        .toInt())
                                    .withOpacity(0.1),
                                //color: index/3==0?  Color((index * 0xFFFFFFF).toInt()).withOpacity(0.5):Color((index * 0xFFdee8f0).toInt()).withOpacity(0.1),
                                // color: Colors.primaries[math.Random()
                                //         .nextInt(Colors.accents.length)]
                                //    .withOpacity(0.10),
                                child:
                                    /* Container(
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          stops: [
                                            0.1,
                                            0.4,
                                            0.7,
                                            0.8,
                                          ],
                                          colors: [
                                            ColorConstants.colorBlueLight.withOpacity(0.3),
                                            ColorConstants.colorPrimary1.withOpacity(0.2),
                                            ColorConstants.colorBlueLight.withOpacity(0.4),
                                            ColorConstants. colorPrimary1.withOpacity(0.7),
                                          ],
                                        )),
                                    child:*/

                                    Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4, right: 4, top: 16),
                                  child: ListTile(
                                    title: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          checkDate(
                                              snapShot.data![index].updatedAt!),
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConstants.FONT_SIZE_12),
                                        ),
                                        CircleAvatar(
                                            radius: 30,
                                            backgroundColor:
                                                ColorConstants.colorCanvas,
                                            child: Icon(
                                              Icons.bookmark_add,
                                              color: ColorConstants
                                                  .colorPrimaryDark,
                                              size: 30,
                                            ))
                                      ],
                                    ),
                                    // header: Icon(Icons.fastfood_sharp,size: 40),
                                    // footer: Row(children: [ElevatedButton.icon(onPressed: (){}, icon:Icon( Icons.delete), label: Text("Delete"))],),

                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, right: 4, top: 4, bottom: 4),
                                      //center
                                      child: Text(
                                          snapShot.data![index].description!,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: ColorConstants.color_white
                                                  .withOpacity(1),
                                              fontSize: SizeConstants.FONT_SIZE,
                                              wordSpacing: 3.0)),
                                    ),
                                  ),
                                ),
                              ),
                              //),
                              Positioned(
                                top: -4,
                                right: -4,
                                child:

                                    //  Icon(Icons.ac_unit,size: 60,color: ColorConstants.colorIconColor,)
                                    Card(
                                  elevation: 4,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6.0)),
                                        child: InkWell(
                                          onTap: () {
                                            controller
                                                .deleteNote(
                                                    snapShot.data![index].sId!)
                                                .then((value) {

                                              CommonDialogs.showGetDialog(
                                                  msg: value.message!);
                                            });
                                            snapShot.data!.removeAt(index);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            size: 24,
                                            color: ColorConstants.colorPrimary,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6.0)),
                                        child: InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (ctx) {
                                                  TextEditingController ctrl =
                                                      new TextEditingController(
                                                          text: snapShot
                                                              .data![index]
                                                              .description!);
                                                  return Container(
                                                    child: Column(children: [
                                                      TextFormField(
                                                        maxLines: 10,
                                                        minLines: 10,
                                                        controller: ctrl,
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () {},
                                                          child: Text("Update"))
                                                    ]),
                                                  );
                                                });
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            size: 24,
                                            color: ColorConstants.colorPrimary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              /* Positioned(
                                top: -4,
                                left: -4,
                                child:

                                //  Icon(Icons.ac_unit,size: 60,color: ColorConstants.colorIconColor,)
                                Card(
                                  elevation: 1,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(6.0)),

                                      child:
                                      //Icon(Icons.bookmark_add_outlined,size: 30,color: ColorConstants.colorPrimary,)
                                      Image.network(

                                        //color: Colors.yellow,
                                        fit: BoxFit.fitHeight,
                                        "https://images.unsplash.com/photo-1495615080073-6b89c9839ce0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3F1YXJlfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                                        height: 60,
                                        width: 60,
                                      ),
                                  ),
                                ),
                              )*/
                            ],
                          )),
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }

  String checkDate(String date) {
    String timeToDisplay = "";
    // DateTime dob = DateTime.parse('1967-10-12');
    DateTime dob = DateTime.parse(date);
    Duration dur = DateTime.now().difference(dob);
    int differenceInYears = (dur.inDays / 365).floor();
    int differenceInDays = (dur.inDays).floor();
    int differenceInMonths = (dur.inDays / 30).floor();

    if (differenceInDays == 0) {
      timeToDisplay = "today";
    } else if (differenceInDays <= 7) {
      timeToDisplay = (differenceInDays.toString() + " days ago ");
    } else if (differenceInDays > 7 && differenceInMonths < 30) {
      timeToDisplay = (differenceInDays.toString() + " days ago ");
    } else {
      timeToDisplay = (differenceInMonths.toString() + " months ago ");
    }
    return "edited : " + timeToDisplay + "";
  }
}
