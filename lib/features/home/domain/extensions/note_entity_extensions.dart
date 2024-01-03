import 'package:flutter/material.dart';
import 'package:flutter_notes/features/home/domain/entities/note_entity.dart';

extension NoteEntityExtensions on NoteEntity {
  Color getLightModeNoteColor() {
    switch (colorId) {
      case 1:
        return Colors.yellowAccent;
      case 2:
        return Colors.lightBlue;
      case 3:
        return Colors.grey;
      case 4:
        return Colors.greenAccent;
      case 5:
        return Colors.blueAccent;
      case 6:
        return Colors.pinkAccent;
      case 7:
        return Colors.tealAccent;
      default:
        return Colors.yellow;
    }
  }

  Color getDarkModeNoteColor() {
    switch (colorId) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.lightBlue;
      case 3:
        return Colors.grey;
      case 4:
        return Colors.greenAccent;
      case 5:
        return Colors.blue;
      case 6:
        return Colors.pinkAccent;
      case 7:
        return Colors.tealAccent;
      default:
        return Colors.yellow;
    }
  }
}
