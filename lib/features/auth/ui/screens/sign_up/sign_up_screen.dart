import 'package:flutter/material.dart';
import 'package:flutter_notes/features/auth/ui/screens/sign_up/sign_up_notifier.dart';
import 'package:flutter_notes/features/auth/ui/screens/widgets/sign_up_button.dart';
import 'package:flutter_notes/features/shared/widgets/theme_button.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpNotifier signUpNotifier;

  @override
  void initState() {
    super.initState();
    signUpNotifier = context.read<SignUpNotifier>();
    signUpNotifier.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: const [
          ThemeButton(),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create your account",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: signUpNotifier.emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: signUpNotifier.passwordController,
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: SignUpButton(signUpNotifier: signUpNotifier),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Sign in"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
