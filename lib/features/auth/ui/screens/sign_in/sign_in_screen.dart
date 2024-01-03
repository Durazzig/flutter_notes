import 'package:flutter/material.dart';
import 'package:flutter_notes/features/auth/ui/screens/sign_in/sign_in_notifier.dart';
import 'package:flutter_notes/features/auth/ui/screens/widgets/email_textfield.dart';
import 'package:flutter_notes/features/auth/ui/screens/widgets/password_textfield.dart';
import 'package:flutter_notes/features/auth/ui/screens/widgets/sign_in_button.dart';
import 'package:flutter_notes/features/auth/ui/screens/widgets/sign_in_label.dart';
import 'package:flutter_notes/features/auth/ui/screens/widgets/sign_up_text_button.dart';
import 'package:flutter_notes/features/shared/widgets/theme_button.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late SignInNotifier signInNotifier;

  @override
  void initState() {
    super.initState();
    signInNotifier = context.read<SignInNotifier>();
    signInNotifier.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const ThemeButton(),
            Expanded(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SignInLabel(),
                      const SizedBox(
                        height: 10,
                      ),
                      EmailTextField(
                          controller: signInNotifier.emailController),
                      const SizedBox(
                        height: 10,
                      ),
                      PasswordTextField(
                        controller: signInNotifier.passwordController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SignInButton(
                              signInNotifier: signInNotifier,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text("Dont have an account?"),
                          SignUpTextButton(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
