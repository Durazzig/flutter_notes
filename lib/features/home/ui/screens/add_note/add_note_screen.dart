import 'package:flutter/material.dart';
import 'package:flutter_notes/features/home/domain/entities/note_entity.dart';
import 'package:flutter_notes/features/home/ui/screens/add_note/add_note_notifier.dart';
import 'package:flutter_notes/features/home/ui/widgets/content_textfield.dart';
import 'package:flutter_notes/features/home/ui/widgets/delete_button.dart';
import 'package:flutter_notes/features/home/ui/widgets/title_textfield.dart';
import 'package:flutter_notes/features/shared/theme.dart';
import 'package:flutter_notes/features/shared/theme_provider.dart';
import 'package:flutter_notes/ui/colors.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key, required this.isUpdate, this.note});
  final bool isUpdate;
  final NoteEntity? note;

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  late AddNoteNotifier addNoteNotifier;

  @override
  void initState() {
    super.initState();
    addNoteNotifier = context.read<AddNoteNotifier>();
    if (widget.isUpdate) addNoteNotifier.init(widget.note);
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Consumer<AddNoteNotifier>(builder: (context, notifier, child) {
      return Scaffold(
        backgroundColor: getBackgroundColor(context),
        appBar: AppBar(
          backgroundColor: getBackgroundColor(context),
          actions: [
            if (widget.isUpdate) const DeleteButton(),
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
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'firstButton',
              key: const Key("color"),
              onPressed: () async {
                _showColorPickerModal(context);
              },
              child: const Icon(Icons.palette),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              heroTag: 'add',
              onPressed: () async {
                if (widget.isUpdate) {
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
          ],
        ),
      );
    });
  }

  void _showColorPickerModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Pick a color',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: AppColors.darkModeColors.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: GestureDetector(
                              onTap: () {
                                final navigator = Navigator.of(context);
                                navigator.pop();
                                addNoteNotifier.updateNoteColor(index);
                              },
                              child: Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: AppColors.darkModeColors[index],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  getBackgroundColor(BuildContext context) {
    if (addNoteNotifier.noteColor != null) {
      return context.read<ThemeProvider>().themeData == lightMode
          ? AppColors.lightModeColors[addNoteNotifier.noteColor!]
          : AppColors.darkModeColors[addNoteNotifier.noteColor!];
    }
    return Theme.of(context).colorScheme.background;
  }
}
