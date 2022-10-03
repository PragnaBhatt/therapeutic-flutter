import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/queue/get_queue.dart';
import 'package:therapeutic/app/commons/utils/dialogs.dart';
import 'package:therapeutic/app/modules/notes/models/notes_model.dart'
    as noteModel;
import 'package:therapeutic/app/modules/notes/models/update_note_model.dart';

import '../controllers/notes_controller.dart';
import '../models/create_note_model.dart';

class AddNoteWidget extends GetView<NotesController> {
  String note;
  String noteId;
  String forProduct;

  AddNoteWidget(
      {required this.note, required this.noteId, required this.forProduct});

  @override
  Widget build(BuildContext context) {
    TextEditingController ctrl = new TextEditingController(text: note);
    return
       Padding(
         padding: EdgeInsets.only(
             bottom: MediaQuery.of(context).viewInsets.bottom),         child: Container(
          child: Column(

            mainAxisSize: MainAxisSize.min,
              children: [
            TextFormField(
              maxLines: 10,
              minLines: 10,
              controller: ctrl,
            ),
            ElevatedButton(
                onPressed: () {
                  if (noteId.compareTo("-1") != 0) {
                    controller
                        .updateNote(
                      noteId,
                      forProduct,
                      ctrl.text,
                    )
                        .then((UpdateNoteModel value) {
                      print(
                          "ID::: ${controller.allNotes.indexOf(value.note!.sId)}");
// controller.allNotes.value.

                      Get.back();
                    });
                  } else {
                    controller
                        .createNote(
                      forProduct,
                      ctrl.text,
                    )
                        .then((CreateNoteModel value) {
                      CommonDialogs.showToast(ctx: context, msg: value!.message!);
                      if (value.status == 1) {
                        // controller.allNotes.add(
                        //     noteModel.Note(description: value!.note!.description!,byUser: value!.note!.byUser!,createdAt: value!.note!.createdAt!,forProduct: value!.note!.forProduct!,iV: value!.note!.iV!,sId: value!.note!.sId!,updatedAt: value!.note!.updatedAt!));
                        //   controller.allNotes.add(value!.note! as noteModel.NoteModel);
                        //  AllNote
                        controller.allNotes.value.add(noteModel.AllNote(
                            description: value!.note!.description!,
                            createdAt: value!.note!.createdAt!,
                            forProduct: noteModel.ForProduct.fromJson(
                                json.decode(value!.note!.forProduct.toString())),
                            byUser: noteModel.ByUser.fromJson(
                                json.decode(value!.note!.byUser.toString())),
                            iV: value!.note!.iV!,
                            sId: value!.note!.sId!,
                            updatedAt: value!.note!.updatedAt!));

                      } else {}

                      Get.back();
                    });
                  }
                },
                child: Text(noteId.compareTo("-1") == 0 ? "Add Note" : "Update"))
          ]),
    ),
       );
  }
}
