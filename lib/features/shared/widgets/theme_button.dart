import 'package:flutter/material.dart';
import 'package:flutter_notes/features/shared/theme.dart';
import 'package:flutter_notes/features/shared/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<ThemeProvider>().changeTheme();
      },
      icon: context.watch<ThemeProvider>().themeData == lightMode
          ? const Icon(Icons.dark_mode)
          : const Icon(Icons.light_mode),
    );
  }
}
