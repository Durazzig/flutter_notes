import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_notes/features/shared/fn_error.dart';
import 'package:multiple_result/multiple_result.dart';

class FirebaseAuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;

  Future<Result<User, FNError>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Success(credential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return const Error(
            FNError(msg: 'The email address is already in use.'));
      } else {
        return Error(FNError(msg: 'An error occurred: ${e.code}'));
      }
    }
  }

  Future<Result<User, FNError>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Success(credential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        return const Error(FNError(msg: 'Invalid email or password.'));
      } else {
        return Error(FNError(msg: 'An error occurred: ${e.code}'));
      }
    }
  }

  void signOut() {
    _auth.signOut();
  }
}
