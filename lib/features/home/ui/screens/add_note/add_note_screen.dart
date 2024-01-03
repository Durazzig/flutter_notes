import 'package:flutter/material.dart';
import 'package:flutter_notes/features/home/domain/entities/note_entity.dart';
import 'package:flutter_notes/features/home/ui/screens/add_note/add_note_notifier.dart';
import 'package:flutter_notes/features/home/ui/widgets/content_textfield.dart';
import 'package:flutter_notes/features/home/ui/widgets/delete_button.dart';
import 'package:flutter_notes/features/home/ui/widgets/title_textfield.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key, required this.isUpdate, this.note});
  final bool isUpdate;
  final NoteEntity? note;

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return ChangeNotifierProvider(
      create: (context) => AddNoteNotifier(),
      child: Builder(builder: (context) {
        final addNoteNotifier = context.watch<AddNoteNotifier>();
        if (isUpdate) addNoteNotifier.init(note);
        return Scaffold(
          appBar: AppBar(
            actions: [
              if (isUpdate) const DeleteButton(),
            ],
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleTextField(controller: addNoteNotifier.titleController),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ContentTextField(
                      controller: addNoteNotifier.contentController,
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (isUpdate) {
                addNoteNotifier.updateNote();
              } else {
                addNoteNotifier.addNote();
              }
              navigator.pop();
            },
            child: addNoteNotifier.addingNoteLoader
                ? const CircularProgressIndicator()
                : const Icon(Icons.save),
          ),
        );
      }),
    );
  }
}
