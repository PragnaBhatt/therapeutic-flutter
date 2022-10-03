import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:therapeutic/app/commons/utils/dialogs.dart';
import 'package:therapeutic/app/modules/notes/models/notes_model.dart'
    as notesModel;
import 'package:therapeutic/app/modules/notes/models/update_note_model.dart';

import '../../../config/config.dart';
import '../models/create_note_model.dart';
import '../models/delete_note_model.dart';

class NotesProvider extends GetConnect {
  String urlToAppend = "food/note/";

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<notesModel.AllNote>> getAllNotes() async {
    var headers = {'Authorization': Config.token};
    return await http
        .get(Uri.parse(Config.baseUrl + urlToAppend + "getAllNotes"),
            headers: headers)
        .then((value) {
      print("notes response... ${value.body}");
      print("${json.encode(value.body)}");
      var jsonData = json.decode(value.body);
      print("${jsonData['status']}");
      int status = jsonData['status'];
      if (value.statusCode == 200) {
        print("value.statusCode ${value.statusCode}");
        notesModel.NotesModel notes = notesModel.NotesModel.fromJson(jsonData);
        print(notes.message);
        // allNotes.value=notes!.allNote!;
        return notes.allNote!;
      } else {
        CommonDialogs.showGetMessage(msg: jsonData['message']);
        throw new Exception();
      }
    });
  }

  Future<DeleteNoteModel> deleteNote(String noteId) async {
    var headers = {'Authorization': Config.token};
    return await http
        .delete(
            Uri.parse(Config.baseUrl + urlToAppend + "deleteNote/" + noteId),
            headers: headers)
        .then((value) {
      print("deleteNote response... ${value.body}");
      print("${json.encode(value.body)}");
      var jsonData = json.decode(value.body);
      print("${jsonData['status']}");
      int status = jsonData['status'];
      if (value.statusCode == 200) {
        print("value.statusCode ${value.statusCode}");
        DeleteNoteModel note = DeleteNoteModel.fromJson(jsonData);
        print(note.message);
        return note;
      } else {
        CommonDialogs.showGetMessage(msg: jsonData['message']);
        throw new Exception(jsonData['message']);
      }
    });
  }

  Future<UpdateNoteModel> updateNote(
      String noteId, String forProduct, String description) async {
    var headers = {'Authorization': Config.token};
    //  request.bodyFields = {'id': prodId};
    return await http
        .patch(Uri.parse(Config.baseUrl + urlToAppend + "updateNote/" + noteId),
            headers: headers,body: {"forProduct":forProduct,"description":description})
        .then((value) {
      print("updateNote response... ${value.body}");
      print("${json.encode(value.body)}");
      var jsonData = json.decode(value.body);
      print("${jsonData['status']}");
      int status = jsonData['status'];
      if (value.statusCode == 200) {
        print("value.statusCode ${value.statusCode}");
        UpdateNoteModel note = UpdateNoteModel.fromJson(jsonData);
        print(note.message);
        return note;
      } else {
        CommonDialogs.showGetMessage(msg: jsonData['message']);
        throw new Exception(jsonData['message']);
      }
    });
  }

  Future<CreateNoteModel> createNote(
      String forProduct, String description) async {
    var headers = {'Authorization': Config.token};
    //  request.bodyFields = {'id': prodId};
    return await http
        .post(Uri.parse(Config.baseUrl + urlToAppend + "createNote/" ),
        headers: headers,body: {"forProduct":forProduct,"description":description})
        .then((value) {
      print("createNote response... ${value.body}");
      print("${json.encode(value.body)}");
      var jsonData = json.decode(value.body);
      print("${jsonData['status']}");
      int status = jsonData['status'];
      if (value.statusCode == 201) {
        print("value.statusCode ${value.statusCode}");
        CreateNoteModel note = CreateNoteModel.fromJson(jsonData);
        print(note.message);
        return note;
      } else {
        CommonDialogs.showGetMessage(msg: jsonData['message']);
        throw new Exception(jsonData['message']);
      }
    });
  }
}
