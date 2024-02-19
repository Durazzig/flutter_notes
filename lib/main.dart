import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/features/auth/ui/screens/sign_in/sign_in_notifier.dart';
import 'package:flutter_notes/features/auth/ui/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_notes/features/shared/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final themeProvider = ThemeProvider();
  Future.delayed(const Duration(milliseconds: 100), () {
    runApp(
      ChangeNotifierProvider(
        create: (context) => themeProvider,
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Notes App',
      theme: context.watch<ThemeProvider>().themeData,
      home: ChangeNotifierProvider(
        create: (context) => SignInNotifier(),
        child: const SignInScreen(),
      ),
    );
  }
}
