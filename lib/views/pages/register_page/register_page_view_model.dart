import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/data/models/app_user.dart';
import 'package:no_smoking_app/data/repositories/user_repository.dart';
import 'package:no_smoking_app/utils/snack_bar_utils.dart';

class RegisterPageViewModel extends GetxController {
  final UsersRepository _userRepository = Get.find();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();

  bool _loading = false;

  TextEditingController get fullNameController => _fullNameController;

  TextEditingController get phoneNoController => _phoneNoController;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get departmentController => _departmentController;

  TextEditingController get designationController => _designationController;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    update();
  }

  void register() async {
    loading = true;
    if (validateForm()) {
      if (!(await registerFirebaseAuthUser())) {
        loading = false;
        return;
      }
      if (!(await registerFirestoreUser())) {
        loading = false;
        return;
      }
      goBack();
      SnackBarUtils.showShortSnackBar(
        title: 'Registration Successful',
        message: 'The user has been registered successfully.',
      );
    }
    loading = false;
  }

  Future<bool> registerFirebaseAuthUser() async {
    try {
      var userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackBarUtils.showShortSnackBar(
          title: 'Weak Password',
          message: 'The password is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        SnackBarUtils.showShortSnackBar(
          title: 'Account Already Exists',
          message: 'The account already exists for this email.',
        );
      } else if (e.message == 'Given String is empty or null') {
        SnackBarUtils.showShortSnackBar(
          title: 'Missing Email/Password',
          message: 'Email and password are required.',
        );
      } else if (e.message != null && e.message!.contains('unusual activity')) {
        SnackBarUtils.showShortSnackBar(
          title: 'Too Many Attempts',
          message: 'Please try again later.',
        );
      } else {
        SnackBarUtils.showShortSnackBar(
          title: 'Error',
          message: 'Please check your network connection.',
        );
      }
      return false;
    }
  }

  Future<bool> registerFirestoreUser() async {
    try {
      var isRegistrationSuccessful = await _userRepository.register(
        AppUser(
          fullName: _fullNameController.text,
          phone: _phoneNoController.text,
          email: _emailController.text,
          department: _departmentController.text,
          designation: _designationController.text,
        ),
      );
      if (!isRegistrationSuccessful) {
        SnackBarUtils.showShortSnackBar(
          title: 'Error',
          message: 'User registration failed.',
        );
        return false;
      } else {
        return true;
      }
    } on Exception catch (e) {
      debugPrint('Error: RegisterPageViewModel.registerFirestoreUser: ');
      debugPrint(e.toString());
      return false;
    }
  }

  bool validateForm() {
    return _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _phoneNoController.text.isNotEmpty &&
        _fullNameController.text.isNotEmpty &&
        _departmentController.text.isNotEmpty &&
        _designationController.text.isNotEmpty;
  }

  goBack() {
    Get.back();
  }
}
