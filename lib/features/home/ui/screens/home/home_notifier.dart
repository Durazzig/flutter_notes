import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/features/home/domain/entities/note_entity.dart';
import 'package:flutter_notes/features/shared/firebase_auth_provider.dart';

class HomeNotifier extends ChangeNotifier {
  Stream<List<NoteEntity>> getUserNotes() {
    final userId = FirebaseAuthProvider().auth.currentUser!.uid;
    final snapshots = FirebaseFirestore.instance
        .collection("notes")
        .where("user_id", isEqualTo: userId)
        .snapshots();
    return snapshots.map(
      (event) {
        return event.docs.map(
          (e) {
            final note = NoteEntity.fromJson(
              e.data(),
            );
            note.id = e.id;
            return note;
          },
        ).toList();
      },
    );
  }
}
