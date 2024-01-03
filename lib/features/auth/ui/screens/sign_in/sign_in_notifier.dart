import 'package:flutter/material.dart';

enum LoadingState { loading, loaded }

class SignInNotifier extends ChangeNotifier {
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
