import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/features/auth/ui/screens/sign_in/sign_in_notifier.dart';
import 'package:flutter_notes/features/auth/ui/screens/sign_up/sign_up_notifier.dart';
import 'package:flutter_notes/features/home/ui/screens/home/home_notifier.dart';
import 'package:flutter_notes/features/home/ui/screens/home/home_screen.dart';
import 'package:flutter_notes/features/shared/firebase_auth_provider.dart';
import 'package:provider/provider.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.signUpNotifier,
  });

  final SignUpNotifier signUpNotifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Consumer<SignUpNotifier>(
        builder: (context, notifier, child) {
          return ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            onPressed: () => signUp(context),
            child: notifier.loadingStatus == LoadingState.loading
                ? const CircularProgressIndicator()
                : Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
          );
        },
      ),
    );
  }

  void signUp(BuildContext context) async {
    final firebaseProvider = FirebaseAuthProvider();
    final navigator = Navigator.of(context);

    signUpNotifier.isLoading();

    User? user = await firebaseProvider.signUpWithEmailAndPassword(
      email: signUpNotifier.emailController.text,
      password: signUpNotifier.passwordController.text,
    );

    signUpNotifier.isLoading();

    if (user != null) {
      navigator.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => HomeNotifier(),
            child: const HomeScreen(),
          ),
        ),
        (Route<dynamic> route) => false,
      );
    }
  }
}
