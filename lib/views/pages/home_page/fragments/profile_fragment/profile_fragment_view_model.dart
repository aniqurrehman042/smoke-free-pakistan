import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/data/models/app_user.dart';
import 'package:no_smoking_app/data/repositories/local_repository.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';
import 'package:no_smoking_app/views/pages/sign_in_page/sign_in_page.dart';

class ProfileFragmentViewModel extends GetxController {
  final LocalRepository _localRepository = Get.find();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();

  int secondsSinceAuthChange = 0;

  ProfileFragmentViewModel() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        getLocalUser();
      }
    });
  }

  TextEditingController get fullNameController => _fullNameController;

  TextEditingController get phoneNoController => _phoneNoController;

  TextEditingController get emailController => _emailController;

  TextEditingController get departmentController => _departmentController;

  TextEditingController get designationController => _designationController;

  void goBack(HomePageViewModel homePageViewModel) {
    homePageViewModel.currentFragmentIndex = 0;
  }

  void goToSignInPage() {
    Get.to(() => const SignInPage());
  }

  void _initData(AppUser appUser) {
    _fullNameController.text = appUser.fullName;
    _phoneNoController.text = appUser.phone;
    _emailController.text = appUser.email;
    _departmentController.text = appUser.department;
    _designationController.text = appUser.designation;
  }

  void getLocalUser() {
    _localRepository.getUser().then((appUser) {
      if (appUser != null) {
        _initData(appUser);
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          secondsSinceAuthChange++;
          if (secondsSinceAuthChange < 30) {
            getLocalUser();
          }
        });
      }
    });
  }
}
