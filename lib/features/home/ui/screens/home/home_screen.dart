import 'package:flutter/material.dart';
import 'package:flutter_notes/features/home/domain/entities/note_entity.dart';
import 'package:flutter_notes/features/home/ui/screens/add_note/add_note_screen.dart';
import 'package:flutter_notes/features/home/ui/screens/home/home_notifier.dart';
import 'package:flutter_notes/features/home/ui/widgets/note_card.dart';
import 'package:flutter_notes/features/home/ui/widgets/sign_out_button.dart';
import 'package:flutter_notes/features/shared/widgets/theme_button.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeNotifier homeNotifier;

  @override
  void initState() {
    super.initState();
    homeNotifier = context.read<HomeNotifier>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title:
            const Align(alignment: Alignment.centerLeft, child: Text("Home")),
        actions: const [
          ThemeButton(),
          SignOutButton(),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: StreamBuilder<List<NoteEntity>>(
            stream: homeNotifier.getUserNotes(),
            builder: (context, AsyncSnapshot<List<NoteEntity>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasData) {
                final notes = snapshot.data!;

                if (notes.isEmpty) {
                  return const Center(
                    child: Text("You have no avaialble notes"),
                  );
                }

                return MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return NoteCard(
                      note: note,
                    );
                  },
                );
              }

              return const Center(
                child: Text("You have no avaialble notes"),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final navigator = Navigator.of(context);
          navigator.push(
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(
                isUpdate: false,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
