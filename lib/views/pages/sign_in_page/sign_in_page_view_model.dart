import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/data/repositories/local_repository.dart';
import 'package:no_smoking_app/data/repositories/user_repository.dart';
import 'package:no_smoking_app/views/pages/register_page/register_page.dart';

class SignInPageViewModel extends GetxController {
  final LocalRepository _localRepository = Get.find();
  final UsersRepository _usersRepository = Get.find();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _loading = false;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    update();
  }

  void signIn() async {
    try {
      loading = true;
      var userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        var appUser = await _usersRepository.getCurrentUserProfile();
        if (appUser != null) {
          _localRepository.saveUser(appUser);
          Get.back();
        } else {
          FirebaseAuth.instance.signOut();
          Get.snackbar(
            'User does not exist',
            'The email is not correct.',
            duration: const Duration(seconds: 2),
          );
        }
      }
      loading = false;
    } on FirebaseAuthException catch (e) {
      loading = false;
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'User does not exist',
          'The email is not correct.',
          duration: const Duration(seconds: 2),
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Wrong Password',
          'The password is not correct.',
          duration: const Duration(seconds: 2),
        );
      } else if (e.message == 'Given String is empty or null') {
        Get.snackbar(
          'Missing Email/Password',
          'Email and password are required.',
          duration: const Duration(seconds: 2),
        );
      } else if (e.message != null && e.message!.contains('unusual activity')) {
        Get.snackbar(
          'Too many unsuccessful attempts',
          'You have unsuccessfully tried to login too many times. Please try again later.',
          duration: const Duration(seconds: 2),
        );
      } else {
        Get.snackbar(
          'Error',
          'Please check your network connection.',
          duration: const Duration(seconds: 2),
        );
      }
    }
  }

  goToRegisterPage() {
    Get.to(() => const RegisterPage());
  }
}
