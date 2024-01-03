import 'package:flutter/material.dart';
import 'package:flutter_notes/features/home/ui/screens/add_note/add_note_notifier.dart';
import 'package:flutter_notes/ui/widgets/alerts.dart';
import 'package:provider/provider.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<AddNoteNotifier>();
    final navigator = Navigator.of(context);
    return IconButton(
      onPressed: () {
        Alerts.showAlert(
          context: context,
          title: "Delete Note",
          body: const Column(
            children: [
              Text(
                "Are you sure you want to delete this note",
              ),
            ],
          ),
          primaryButtonText: "Delete",
          onPrimaryButtonPressed: () {
            notifier.deleteNote();
            navigator.pop();
            navigator.pop();
          },
          secondaryButtonText: "Cancel",
          onSecondaryButtonPressed: () {
            navigator.pop();
          },
        );
      },
      icon: const Icon(Icons.delete_outline),
    );
  }
}
