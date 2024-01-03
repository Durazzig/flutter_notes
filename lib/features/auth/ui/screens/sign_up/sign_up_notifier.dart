import 'package:flutter/material.dart';
import 'package:flutter_notes/features/auth/ui/screens/sign_in/sign_in_notifier.dart';

class SignUpNotifier extends ChangeNotifier {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  LoadingState loadingStatus = LoadingState.loaded;

  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void isLoading() {
    loadingStatus = loadingStatus == LoadingState.loaded
        ? LoadingState.loading
        : LoadingState.loaded;
    notifyListeners();
  }
}
