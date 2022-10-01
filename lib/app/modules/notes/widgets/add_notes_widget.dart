import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/queue/get_queue.dart';
import 'package:therapeutic/app/modules/notes/models/update_note_model.dart';

import '../controllers/notes_controller.dart';

class AddNoteWidget extends GetView<NotesController> {
  String note;
  String noteId;
  String forProduct;

  AddNoteWidget(
      {required this.note, required this.noteId, required this.forProduct});

  @override
  Widget build(BuildContext context) {
    TextEditingController ctrl = new TextEditingController(text: note);
    return Container(
      child: Column(children: [
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

                  // Get.back();
                });
              } else {
                //  controller.updateNote(noteId, forProduct  , ctrl.text,);
              }
            },
            child: Text(noteId.compareTo("-1") == 0 ? "Add Note" : "Update"))
      ]),
    );
  }
}
