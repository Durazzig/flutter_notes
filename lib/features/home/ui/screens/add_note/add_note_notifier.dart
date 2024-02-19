import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/features/home/domain/entities/note_entity.dart';
import 'package:flutter_notes/features/shared/firebase_auth_provider.dart';

class AddNoteNotifier extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  bool addingNoteLoader = false;
  late NoteEntity? note;
  int? noteColor;

  void init(NoteEntity? noteEntity) {
    if (noteEntity != null) {
      note = noteEntity;
      titleController.text = noteEntity.title;
      contentController.text = noteEntity.content;
      noteColor = noteEntity.colorId;
    }
  }

  void addNote() async {
    addingNoteLoader = true;
    notifyListeners();
    final userId = FirebaseAuthProvider().auth.currentUser!.uid;
    await FirebaseFirestore.instance.collection("notes").add({
      "user_id": userId,
      "title": titleController.text,
      "content": contentController.text,
      "created_at": DateTime.now().toString(),
      "color_id": noteColor ?? 0,
    });
  }

  void updateNote() async {
    addingNoteLoader = true;
    notifyListeners();
    await FirebaseFirestore.instance.collection("notes").doc(note!.id).update({
      "title": titleController.text,
      "content": contentController.text,
      "color_id": noteColor ?? 0,
    });
  }

  void deleteNote() async {
    await FirebaseFirestore.instance.collection("notes").doc(note!.id).delete();
  }

  void updateNoteColor(int colorId) {
    noteColor = colorId;
    notifyListeners();
  }
}
