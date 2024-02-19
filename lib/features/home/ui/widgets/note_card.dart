import 'package:flutter/material.dart';
import 'package:flutter_notes/features/home/domain/entities/note_entity.dart';
import 'package:flutter_notes/features/home/domain/extensions/note_entity_extensions.dart';
import 'package:flutter_notes/features/home/ui/screens/add_note/add_note_notifier.dart';
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
            builder: (context) => ChangeNotifierProvider(
              create: (context) => AddNoteNotifier(),
              child: AddNoteScreen(
                isUpdate: true,
                note: note,
              ),
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
            border: Border.all(
                color: note.colorId == 0
                    ? Theme.of(context).colorScheme.secondary
                    : context.read<ThemeProvider>().themeData == lightMode
                        ? note.getLightModeNoteColor()
                        : note.getDarkModeNoteColor())),
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Text(
              note.content,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
