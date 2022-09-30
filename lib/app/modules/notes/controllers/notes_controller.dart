import 'package:get/get.dart';
import 'package:therapeutic/app/modules/notes/providers/notes_provider.dart';
import 'package:therapeutic/app/modules/notes/models/notes_model.dart'
    as notesModel;

import '../models/delete_note_model.dart';

class NotesController extends GetxController {
  //TODO: Implement NotesController
  NotesProvider? notesProvide;
  late RxList<notesModel.AllNote> allNotes;

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

    allNotes.value=notesProvide!.getAllNotes() as List<notesModel.AllNote>;
    return notesProvide!.getAllNotes();
  }

  Future<DeleteNoteModel> deleteNote(String noteId) {
    return notesProvide!.deleteNote(noteId);
  }
}
