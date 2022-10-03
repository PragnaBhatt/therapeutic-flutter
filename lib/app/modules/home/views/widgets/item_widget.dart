import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:therapeutic/app/constants/color_constants.dart';
import 'package:therapeutic/app/modules/models/product_model.dart'
    as productModel;
import 'package:therapeutic/app/modules/notes/controllers/notes_controller.dart';
import 'package:therapeutic/app/modules/notes/providers/notes_provider.dart';
import 'package:therapeutic/app/routes/app_pages.dart';

import '../../../notes/widgets/add_notes_widget.dart'; //odel;

class ItemWidget extends StatelessWidget {
  productModel.Data data;
  int pos;

  ItemWidget({required this.data, required this.pos});

  NotesController notesController = NotesController();

  @override
  Widget build(BuildContext context) {
    String str = data!.description!;
    str = str.substring(0, 430) + "...Read more";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (() {
          Get.toNamed(Routes.PRODUCT_DETAIL, arguments: data!.sId!);
        }),
        child: Card(
          // elevation: 1,
          child: ListTile(
            title: Text(data!.name!),
            subtitle: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Html(
                  data: str,
                  shrinkWrap: false,
                ),
                InkWell(
                  onTap: (() {
                    Get.toNamed(Routes.PRODUCT_LIST, arguments: data!.type!);
                  }),
                  child: Chip(
                      elevation: 1,
                      backgroundColor: ColorConstants.colorPrimaryDark,
                      label: Text(data!.type!,
                          style: TextStyle(color: Colors.white))),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                  child: Divider(
                    height: 1,
                    color: ColorConstants.color_white,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              elevation: 4,
                              context: context,
                              builder: (ctx) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: AddNoteWidget(
                                    // note: data!.noteOfUser!.isNotEmpty ? data.noteOfUser![0].description:"" );
                                    note: data!.noteOfUser!.length == 0
                                        ? ""
                                        : data!.noteOfUser![0].description!,
                                    noteId: data!.noteOfUser!.length == 0
                                        ? "-1"
                                        : data!.noteOfUser![0].sId!,
                                    forProduct: data!.sId!,
                                  ),
                                );
                              });
                        },
                        child: Obx(() {
                          print(
                              "notesController.allNotes ${notesController.allNotes.length}");
                          return Icon(
                            Icons.note_alt_outlined,
                            color: data!.noteOfUser!.length == 0 ||
                                    notesController.allNotes.lastIndexWhere(
                                            (element) =>
                                                element.forProduct!.sId ==
                                                data!.sId) ==
                                        -1
                                ? ColorConstants.colorPrimary1
                                : ColorConstants.greeen,
                          );
                        }),
                      ),
                      // Text(
                      //   "Add Note",
                      //   style: TextStyle(color: Colors.black),
                      // ),
                      SizedBox(
                        width: 4,
                      ),

                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.star_border),
                          label: Text("Add to Favorite",
                              style: TextStyle(color: Colors.white))),

                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.remove_red_eye,
                        color: ColorConstants.colorIconColor,
                      ),
                      Text(
                        " ${data!.noOfViews!.toString()}",
                        //   style: TextStyle(color: Colors.black),
                      )
                    ])
              ],
            ),
            leading: Icon(
              Icons.account_tree_sharp,
              color: ColorConstants.colorPrimaryDark,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
