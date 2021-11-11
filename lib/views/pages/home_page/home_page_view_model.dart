import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/views/global/add_complaint_bottom_sheet.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/add_complaint_fragment/add_complaint_fragment.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/complaints_fragment/complaints_fragment.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/home_fragment/home_fragment.dart';
import 'package:no_smoking_app/views/pages/laws_and_rules_page/laws_and_rules_page.dart';
import 'package:no_smoking_app/views/pages/register_page/register_page.dart';
import 'package:no_smoking_app/views/pages/sign_in_page/sign_in_page.dart';
import 'package:no_smoking_app/views/pages/statistics_page/statistics_page.dart';

import 'fragments/complaint_type_fragment/complaint_type_fragment.dart';
import 'fragments/violation_type_fragment/violation_type_fragment.dart';
import 'fragments/notifications_fragment/notifications_fragment.dart';
import 'fragments/profile_fragment/profile_fragment.dart';

class HomePageViewModel extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final List<Widget> fragments = [
    const HomeFragment(),
    const NotificationsFragment(),
    const SizedBox(),
    const ComplaintsFragment(),
    const ProfileFragment(),
    const AddComplaintFragment(),
    const ViolationTypeFragment(),
    const ComplaintTypeFragment(),
  ];

  int _currentFragmentIndex = 0;

  int get currentFragmentIndex => _currentFragmentIndex;

  set currentFragmentIndex(int value) {
    _currentFragmentIndex = value;
    update();
  }

  int getSelectedBottomNavBarIndex() {
    return _currentFragmentIndex < 5 ? _currentFragmentIndex : 0;
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    update();
  }

  void goToSignInPage() {
    Get.back();
    Get.to(() => const SignInPage());
  }

  void goToLawsAndRulesPage() {
    Get.back();
    Get.to(() => const LawsAndRulesPage());
  }

  void goToStatisticsPage() {
    Get.back();
    Get.to(() => const StatisticsPage());
  }

  void goToHomeFragment() {
    Get.back();
    currentFragmentIndex = 0;
  }

  void goToNotificationsFragment() {
    Get.back();
    currentFragmentIndex = 1;
  }

  void goToComplaintsFragment() {
    Get.back();
    currentFragmentIndex = 3;
  }

  void goToProfileFragment() {
    Get.back();
    currentFragmentIndex = 4;
  }

  void goToRegisterPage() {
    Get.back();
    Get.to(() => const RegisterPage());
  }

  void goToUserComplaintFormFragment() {
    Get.back();
    currentFragmentIndex = 5;
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void bottomNavBarItemTap(int index) {
    if (index != 2) {
      currentFragmentIndex = index;
    }
  }

  void showAddComplaintMenu() {
    Get.bottomSheet(
      const AddComplaintBottomSheet(),
    );
  }

  Future<bool> onBackPressed() async {
    switch (_currentFragmentIndex) {
      case 0:
        return true;
      case 1:
      case 3:
      case 4:
      case 5:
      case 6:
        currentFragmentIndex = 0;
        break;
    }
    return false;
  }
}
