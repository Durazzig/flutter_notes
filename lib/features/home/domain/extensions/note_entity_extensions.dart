import 'package:flutter/material.dart';
import 'package:flutter_notes/features/home/domain/entities/note_entity.dart';
import 'package:flutter_notes/ui/colors.dart';

extension NoteEntityExtensions on NoteEntity {
  Color getLightModeNoteColor() {
    try {
      return AppColors.lightModeColors[colorId];
    } catch (e) {
      return Colors.white;
    }
  }

  Color getDarkModeNoteColor() {
    try {
      return AppColors.darkModeColors[colorId];
    } catch (e) {
      return Colors.white;
    }
  }
}
