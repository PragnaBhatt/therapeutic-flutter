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
    str = str.substring(0, 120) + "...Read more";
    // print("image....." +
    //     Config.baseUrlImages +
    //     data!.image! +
    //     Config.imagesExtenstion);

    print(
        "note.... ${controller.allNotes.lastIndexWhere((element) => element.forProduct!.sId == data.sId)}");
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: SizedBox(
          height: 160,
          child: Card(
            elevation: 2,
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      "${Config.baseUrl}images/1.jpg",
                      height: 160,
                      width: 160,
                      fit: BoxFit.cover,
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6, top: 6, bottom: 6),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                            right: 0,
                            child:   InkWell(
                              onTap: (){ showModalBottomSheet(
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
                                  });},
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
                                    return isNoteVAialbale = element
                                        .forProduct!.sId!
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
                                  color: !isNoteVAialbale
                                      ? ColorConstants.colorPrimary1
                                      : ColorConstants.greeen,
                                );
                              }),
                            )
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${data.name!}"),
                            SizedBox(
                              height: 4,
                            ),
                            Divider(
                              height: 1,
                              color: ColorConstants.offWhite,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Html(
                              data: str,
                              shrinkWrap: false,
                            ),
                            /*InkWell(
                              onTap: (() {
                                Get.toNamed(Routes.PRODUCT_LIST,
                                    arguments: data.type!);
                              }),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Chip(
                                      elevation: 1,
                                      backgroundColor:
                                          ColorConstants.colorPrimaryDark,
                                      label: Text(data!.type!,
                                          style: TextStyle(color: Colors.white))),

                                ],
                              ),
                            ),*/
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
