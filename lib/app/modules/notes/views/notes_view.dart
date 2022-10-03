import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:therapeutic/app/commons/utils/dialogs.dart';
import 'package:therapeutic/app/commons/widgets/empty_failure_nointernet_widgetdart.dart';
import 'package:therapeutic/app/constants/color_constants.dart';
import 'package:therapeutic/app/modules/notes/models/delete_note_model.dart';
import 'package:therapeutic/app/modules/notes/widgets/add_notes_widget.dart';

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
    RxList<notesModel.AllNote> allNotes = controller.allNotes;
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
        body: Obx((() {
      return allNotes.isEmpty
          ? EmptyFailureNoInternetWidget.NoData()
          : Container(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: GridView.builder(
                  itemCount: allNotes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Card(
                          elevation: 2,
// color: ColorConstants.brown_shade2,
                          color: Color((math.Random().nextDouble() * 0xFFdb87b4)
                                  .toInt())
                              .withOpacity(0.1),

                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 4, top: 16),
                            child: ListTile(
                              title: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    checkDate(allNotes[index].updatedAt!),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: SizeConstants.FONT_SIZE_12),
                                  ),
                                  const CircleAvatar(
                                      radius: 30,
                                      backgroundColor:
                                          ColorConstants.colorCanvas,
                                      child: Icon(
                                        Icons.bookmark_add,
                                        color: ColorConstants.colorPrimaryDark,
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
                                child: Text(allNotes[index].description!,
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6.0)),
                                  child: InkWell(
                                    onTap: () {
                                      // CommonDialogs.showGetDialog(
                                      //     msg: value.message!);

                                      CommonDialogs.showMsgDialog2(
                                          ctx: context,
                                          msg:
                                              "Are you sure to remove note from ${allNotes[index].forProduct!.name!} ?",
                                          onOkClick: () {
                                            Get.back();

                                            controller
                                                .deleteNote(
                                                    allNotes[index].sId!)
                                                .then((DeleteNoteModel dn) {
                                              if (dn.status == 1) {
                                                allNotes.removeAt(index);
                                              }
                                              CommonDialogs.showToast(
                                                  ctx: context,
                                                  msg: dn.message!);
                                            });
                                          },
                                          onCancelClick: () {
                                            Get.back();
                                          },
                                          isDismissible: false);
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.0)),
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (ctx) {
                                            return AddNoteWidget(
                                              note:
                                                  allNotes[index].description!,
                                              noteId: allNotes[index].sId!,
                                              forProduct: allNotes[index]
                                                  .forProduct!
                                                  .sId!,
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
                      ],
                    );
                  },
                ),
              ),
            );
    })));
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
