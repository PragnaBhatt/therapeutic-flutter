import 'package:get/get.dart';
import 'package:therapeutic/app/modules/notes/models/create_note_model.dart';
import 'package:therapeutic/app/modules/notes/models/update_note_model.dart';
import 'package:therapeutic/app/modules/notes/providers/notes_provider.dart';
import 'package:therapeutic/app/modules/notes/models/notes_model.dart'
    as notesModel;

import '../models/delete_note_model.dart';

class NotesController extends GetxController {
  //TODO: Implement NotesController
  NotesProvider? notesProvide;
  RxList<notesModel.AllNote> allNotes = RxList();

  @override
  void onInit() {
    notesProvide = NotesProvider();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<notesModel.AllNote>> getNotes() {
    Future<List<notesModel.AllNote>> notes =
        notesProvide!.getAllNotes().then((value) => allNotes.value = value);

    return notes;
  }

  Future<DeleteNoteModel> deleteNote(String noteId) {
    Future<DeleteNoteModel> deleteNote;

    deleteNote = notesProvide!.deleteNote(noteId);

    //  deleteNote. then((value) {
    //     if (value.status == 1) {
    //       allNotes.value.removeWhere((element) => element.sId == noteId);
    //       print(allNotes.length);
    //     }
    //   });

    return deleteNote;
  }

  Future<UpdateNoteModel> updateNote(
      String noteId, String forProduct, String description) {
    Future<UpdateNoteModel> updateNote;
    updateNote = notesProvide!.updateNote(noteId, forProduct, description);
    return updateNote;
  }

  Future<CreateNoteModel> createNote(String forProduct, String description) {
    Future<CreateNoteModel> createNote;
    createNote = notesProvide!.createNote(forProduct, description);
    return createNote;
  }
}
