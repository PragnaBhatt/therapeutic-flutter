import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:therapeutic/app/config/config.dart';
import 'package:therapeutic/app/constants/color_constants.dart';
import 'package:therapeutic/app/modules/models/product_model.dart'
    as productModel;
import 'package:therapeutic/app/modules/notes/controllers/notes_controller.dart';
import 'package:therapeutic/app/modules/notes/providers/notes_provider.dart';
import 'package:therapeutic/app/routes/app_pages.dart';

import '../../../notes/widgets/add_notes_widget.dart'; //odel;

// class ItemWidget extends StatelessWidget {
class ItemWidget extends GetView<NotesController> {
  productModel.Data data;
  int pos;

  ItemWidget({required this.data, required this.pos});

  // NotesController notesController = NotesController();

  @override
  Widget build(BuildContext context) {
    String str = data!.description!;
    str = str.substring(0, 430) + "...Read more";
    // print("image....." +
    //     Config.baseUrlImages +
    //     data!.image! +
    //     Config.imagesExtenstion);

    print(
        "note.... ${controller.allNotes.lastIndexWhere((element) => element.forProduct!.sId == data.sId)}");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (() {
          Get.toNamed(Routes.PRODUCT_DETAIL, arguments: data!.sId!);
        }),
        child: Card(
          // elevation: 1,
          child: ListTile(
            title: Text(data.name!),
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
                    Get.toNamed(Routes.PRODUCT_LIST, arguments: data.type!);
                  }),
                  child: Chip(
                      elevation: 1,
                      backgroundColor: ColorConstants.colorPrimaryDark,
                      label: Text(data!.type!,
                          style: TextStyle(color: Colors.white))),
                ),
                const Padding(
                  padding: EdgeInsets.only(
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
                               TextEditingController ctrl =
                                    TextEditingController(
                                        text: data.noteOfUser!.isEmpty
                                            ? ""
                                            : data.noteOfUser![0].description!);
                                return Padding(

                                  padding: MediaQuery.of(context).viewInsets,
                                  child: AddNoteWidget(
                                    // note: data!.noteOfUser!.isNotEmpty ? data.noteOfUser![0].description:"" );
                                    note: data.noteOfUser!.isEmpty
                                        ? ""
                                        : data.noteOfUser![0].description!,
                                    noteId: data.noteOfUser!.isEmpty
                                        ? "-1"
                                        : data.noteOfUser![0].sId!,
                                    forProduct: data.sId!,ctrl:ctrl ,
                                  ),
                                );
                              });
                        },
                        child: Obx(() {
                          print(
                              "notesController.allNotes ${controller.allNotes.length}");
                          print(
                              "note....in to observable>>> ${controller.allNotes.lastIndexWhere((element) => element.forProduct!.sId == data.sId)}");
                          // for (int i = 0; i < controller.allNotes.length; i++) {
                          //   print(
                          //       "ID OF PRODUCT...${controller.allNotes[i].forProduct!.sId}");

                          //   if (controller.allNotes[i].forProduct!.sId
                          //           .toString()
                          //           .compareTo(data.sId.toString()) ==
                          //       0) {
                          //     print("SAME****");
                          //   }
                          // }
                          bool isNoteVAialbale = false;
                          controller.allNotes.indexWhere(
                            (element) {
                              return isNoteVAialbale = element.forProduct!.sId!
                                      .toString()
                                      .compareTo(data.sId.toString()) ==
                                  0;
                            },
                          );
                          print(
                              'isNoteVAialbale ${isNoteVAialbale} for product ${data.name!}');
                          // return Icon(
                          //   Icons.note_alt_outlined,
                          //   color:
                          //       data.noteOfUser!.length == 0 || !isNoteVAialbale
                          //           ? ColorConstants.colorPrimary1
                          //           : ColorConstants.greeen,
                          // );


                          return Icon(
                            Icons.note_alt_outlined,
                            color:
                               !isNoteVAialbale
                                    ? ColorConstants.colorPrimary1
                                    : ColorConstants.greeen,
                          );
                        }),
                      ),
                      // Text(
                      //   "Add Note",
                      //   style: TextStyle(color: Colors.black),
                      // ),
                    const  SizedBox(
                        width: 4,
                      ),

                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.star_border),
                          label: const Text("Add to Favorite",
                              style: TextStyle(color: Colors.white))),

                      const SizedBox(
                        width: 4,
                      ),
                   const   Icon(
                        Icons.remove_red_eye,
                        color: ColorConstants.colorIconColor,
                      ),
                      Text(
                        " ${data.noOfViews!.toString()}",
                        //   style: TextStyle(color: Colors.black),
                      )
                    ])
              ],
            ),
            // leading: Icon(
            //   Icons.account_tree_sharp,
            //   color: ColorConstants.colorPrimaryDark,
            //   size: 40,
            // ),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  Config.baseUrlImages + data.image! + Config.imagesExtenstion,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ),
    );
  }
}
