import 'package:flutter/material.dart';
import 'package:flutter_notes/features/auth/ui/screens/sign_in/sign_in_notifier.dart';
import 'package:flutter_notes/features/auth/ui/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_notes/features/shared/firebase_auth_provider.dart';
import 'package:flutter_notes/ui/widgets/alerts.dart';
import 'package:provider/provider.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Alerts.showAlert(
          context: context,
          title: "Sign Out",
          body: const Column(
            children: [
              Text(
                "Are you sure you want to sign out",
              ),
            ],
          ),
          primaryButtonText: "Sign Out",
          onPrimaryButtonPressed: () {
            signOut(context);
          },
        );
      },
      icon: const Icon(Icons.logout),
    );
  }

  void signOut(BuildContext context) {
    final firebaseProvider = FirebaseAuthProvider();
    final navigator = Navigator.of(context);

    firebaseProvider.signOut();
    navigator.pop();
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => SignInNotifier(),
          child: const SignInScreen(),
        ),
      ),
      (Route<dynamic> route) => false,
    );
  }
}
