import 'package:flutter/material.dart';
import 'package:flutter_notes/features/home/domain/entities/note_entity.dart';
import 'package:flutter_notes/features/home/domain/extensions/note_entity_extensions.dart';
import 'package:flutter_notes/features/home/ui/screens/add_note/add_note_screen.dart';
import 'package:flutter_notes/features/shared/theme.dart';
import 'package:flutter_notes/features/shared/theme_provider.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
  });

  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final navigator = Navigator.of(context);
        navigator.push(
          MaterialPageRoute(
            builder: (context) => AddNoteScreen(
              isUpdate: true,
              note: note,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.read<ThemeProvider>().themeData == lightMode
              ? note.getLightModeNoteColor()
              : note.getDarkModeNoteColor(),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              note.content,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
