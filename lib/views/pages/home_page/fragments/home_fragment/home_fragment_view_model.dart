import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/data/models/app_user.dart';
import 'package:no_smoking_app/data/repositories/local_repository.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';
import 'package:no_smoking_app/views/pages/laws_and_rules_page/laws_and_rules_page.dart';
import 'package:no_smoking_app/views/pages/register_page/register_page.dart';
import 'package:no_smoking_app/views/pages/statistics_page/statistics_page.dart';

class HomeFragmentViewModel extends GetxController{
  final LocalRepository _localRepository = Get.find();

  final TextEditingController searchController = TextEditingController();

  Future<AppUser?> getUser() {
    return _localRepository.getUser();
  }

  void goToAddComplaint(HomePageViewModel homePageViewModel) {
    homePageViewModel.currentFragmentIndex = 5;
  }

  void goToRegisterPage() {
    Get.to(() => const RegisterPage());
  }

  void goToLawsAndRulesPage() {
    Get.to(() => const LawsAndRulesPage());
  }

  void goToStatisticsPage() {
    Get.to(() => const StatisticsPage());
  }

}