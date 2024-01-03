import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/features/auth/ui/screens/sign_in/sign_in_notifier.dart';
import 'package:flutter_notes/features/home/ui/screens/home/home_notifier.dart';
import 'package:flutter_notes/features/home/ui/screens/home/home_screen.dart';
import 'package:flutter_notes/features/shared/firebase_auth_provider.dart';
import 'package:provider/provider.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.signInNotifier,
  });

  final SignInNotifier signInNotifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Consumer<SignInNotifier>(
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
            onPressed: () => signIn(context),
            child: notifier.loadingStatus == LoadingState.loading
                ? const CircularProgressIndicator()
                : Text(
                    "Sign In",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
          );
        },
      ),
    );
  }

  void signIn(BuildContext context) async {
    final firebaseProvider = FirebaseAuthProvider();
    final navigator = Navigator.of(context);

    signInNotifier.isLoading();

    User? user = await firebaseProvider.signInWithEmailAndPassword(
      email: signInNotifier.emailController.text,
      password: signInNotifier.passwordController.text,
    );

    signInNotifier.isLoading();

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
