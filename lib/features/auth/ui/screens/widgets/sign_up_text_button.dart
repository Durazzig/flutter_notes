import 'package:flutter/material.dart';
import 'package:flutter_notes/features/auth/ui/screens/sign_up/sign_up_notifier.dart';
import 'package:flutter_notes/features/auth/ui/screens/sign_up/sign_up_screen.dart';
import 'package:provider/provider.dart';

class SignUpTextButton extends StatelessWidget {
  const SignUpTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => SignUpNotifier(),
              child: const SignUpScreen(),
            ),
          ),
        );
      },
      child: const Text("Sign up"),
    );
  }
}
