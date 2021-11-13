import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';

import 'home_page_view_model.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get View Model
    HomePageViewModel viewModel = Get.find();

    return Drawer(
      child: SafeArea(
        child: Container(
          color: Colors.transparent,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // const SizedBox(
              //   height: 280.0,
              //   child: DrawerHeader(
              //     padding: EdgeInsets.zero,
              //     margin: EdgeInsets.zero,
              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //         image: AssetImage(AppAssets.logo),
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     child: SizedBox(),
              //   ),
              // ),
              Ink(
                color: AppColors.darkGreen,
                child: ListTile(
                  title: const Text(
                    'Home',
                    style: AppTextStyles.whiteS4W4,
                  ),
                  onTap: () => viewModel.goToHomeFragment(),
                ),
              ),
              Ink(
                color: AppColors.darkGreen,
                child: ListTile(
                  title: const Text(
                    'File Complaint',
                    style: AppTextStyles.whiteS4W4,
                  ),
                  onTap: () => viewModel.goToUserComplaintFormFragment(),
                ),
              ),
              Ink(
                color: AppColors.darkGreen,
                child: ListTile(
                  title: const Text(
                    'Create Account',
                    style: AppTextStyles.whiteS4W4,
                  ),
                  onTap: () => viewModel.goToRegisterPage(),
                ),
              ),
              Ink(
                color: AppColors.darkGreen,
                child: ListTile(
                  title: const Text(
                    'Laws And Rules',
                    style: AppTextStyles.whiteS4W4,
                  ),
                  onTap: () => viewModel.goToLawsAndRulesPage(),
                ),
              ),
              Ink(
                color: AppColors.darkGreen,
                child: ListTile(
                  title: const Text(
                    'Statistics Pages',
                    style: AppTextStyles.whiteS4W4,
                  ),
                  onTap: () => viewModel.goToStatisticsPage(),
                ),
              ),
              Ink(
                color: AppColors.darkGreen,
                child: ListTile(
                  title: const Text(
                    'Notifications',
                    style: AppTextStyles.whiteS4W4,
                  ),
                  onTap: () => viewModel.goToNotificationsFragment(),
                ),
              ),
              Ink(
                color: AppColors.darkGreen,
                child: ListTile(
                  title: const Text(
                    'Complaints',
                    style: AppTextStyles.whiteS4W4,
                  ),
                  onTap: () => viewModel.goToComplaintsFragment(),
                ),
              ),
              Ink(
                color: AppColors.darkGreen,
                child: ListTile(
                  title: const Text(
                    'Profile',
                    style: AppTextStyles.whiteS4W4,
                  ),
                  onTap: () => viewModel.goToProfileFragment(),
                ),
              ),
              GetBuilder<HomePageViewModel>(
                builder: (HomePageViewModel viewModel) => StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (_, asyncSnapshot) {
                    if (asyncSnapshot.connectionState ==
                        ConnectionState.active) {
                      return asyncSnapshot.hasData
                          ? Ink(
                              color: AppColors.darkGreen,
                              child: ListTile(
                                title: const Text(
                                  'Sign Out',
                                  style: AppTextStyles.whiteS4W4,
                                ),
                                onTap: () => viewModel.signOut(),
                              ),
                            )
                          : Ink(
                              color: AppColors.darkGreen,
                              child: ListTile(
                                title: const Text(
                                  'Sign In',
                                  style: AppTextStyles.whiteS4W4,
                                ),
                                onTap: () => viewModel.goToSignInPage(),
                              ),
                            );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
