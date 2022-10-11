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

class AddNoteWidget extends StatefulWidget {
  String note;
  String noteId;
  String forProduct;
  TextEditingController ctrl;
  late int noteIndex;
  NotesController controller = Get.find<NotesController>();

  AddNoteWidget(
      {required this.note,
      required this.noteId,
      required this.forProduct,
      required this.ctrl}) {
    noteIndex = controller.allNotes.indexWhere((element) {
      return element.sId.toString().compareTo(noteId) == 0;
    });
  }

  @override
  State<AddNoteWidget> createState() => _AddNoteWidgetState();
}

// NotesController noteController= NotesController();
late TextEditingController ctrlLocal;

class _AddNoteWidgetState extends State<AddNoteWidget> {
  @override
  void initState() {
    print("init state of note add!!!!!");
    // widget. controller= noteController = NotesController();
    // widget. controller = NotesController();
    ctrlLocal = widget.ctrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // noteController = NotesController();
    print("on build of notes add view ...!!!!!");
    widget.ctrl.selection = TextSelection.fromPosition(
        TextPosition(offset: widget.ctrl.text.length));
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextFormField(
            maxLines: 10,
            minLines: 10,
            //  controller: widget.ctrl,
            controller: ctrlLocal,
          ),
          ElevatedButton(
              onPressed: () {
                if (widget.noteId.compareTo("-1") != 0) {
                  widget.controller
                      .updateNote(
                    widget.noteId,
                    widget.forProduct,
                    ctrlLocal.text,
                  )
                      .then((UpdateNoteModel value) {
                    print(
                        "ID::: ${widget.controller.allNotes.indexOf(value.note!.sId)}");
// controller.allNotes.value.

                    widget.controller.allNotes.removeAt(widget.noteIndex);
                    //    widget.controller.allNotes.removeAt(widget.noteIndex);
                    widget.controller.allNotes.add(noteModel.AllNote(
                        description: value.note!.description!,
                        createdAt: value.note!.createdAt!,
                        byUser: noteModel.ByUser.fromJson(
                            value.note!.byUser!.toJson()),
                        forProduct: noteModel.ForProduct.fromJson(
                            value.note!.forProduct!.toJson()),
                        iV: value.note!.iV!,
                        sId: value.note!.sId!,
                        updatedAt: value.note!.updatedAt!));
                    Get.back();
                  });
                } else {
                  widget.controller
                      .createNote(
                    widget.forProduct,
                    ctrlLocal.text,
                  )
                      .then((CreateNoteModel value) {
                    CommonDialogs.showToast(ctx: context, msg: value!.message!);
                    if (value.status == 1) {

                      widget.controller.allNotes.add(noteModel.AllNote(
                          description: value.note!.description!,
                          createdAt: value.note!.createdAt!,
                          byUser: noteModel.ByUser.fromJson(
                              value.note!.byUser!.toJson()),
                          forProduct: noteModel.ForProduct.fromJson(
                              value.note!.forProduct!.toJson()),
                          iV: value.note!.iV!,
                          sId: value.note!.sId!,
                          updatedAt: value.note!.updatedAt!));
                      print("values.... ${widget.controller.allNotes.length}");
                    } else {}

                    Get.back();
                  });
                }
              },
              child: Text(
                  widget.noteId.compareTo("-1") == 0 ? "Add Note" : "Update"))
        ]),
      ),
    );
  }
}
