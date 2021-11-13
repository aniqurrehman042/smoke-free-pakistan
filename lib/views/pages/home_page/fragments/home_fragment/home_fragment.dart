import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/data/models/app_user.dart';
import 'package:no_smoking_app/theme/app_assets.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';
import 'package:no_smoking_app/views/global/image_page_view_with_dot_indicator.dart';
import 'package:no_smoking_app/views/global/search_text_field.dart';

import '../../home_page_view_model.dart';
import 'home_fragment_view_model.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get Screen Sizes
    var screenWidth = Get.width;

    // Get View Model
    HomePageViewModel homePageViewModel = Get.find();
    HomeFragmentViewModel viewModel = Get.find();

    // Page View Image Aspect Ratio
    const pageViewImgAspectRatio = 0.3252;

    return ListView(
      children: [
        const SizedBox(height: 32.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, authUserSnapshot) {
                        return FutureBuilder<AppUser?>(
                            future: viewModel.getUser(),
                            builder: (context, appUserSnapshot) {
                              var username = authUserSnapshot.hasData
                                  ? (appUserSnapshot.data?.fullName ?? 'User')
                                  : 'User';
                              return Text(
                                'Hello ' + username + ',',
                                style: AppTextStyles.blackS8W6,
                              );
                            });
                      }),
                  const Text(
                    'Welcome To Smoke Free Pakistan App!',
                    style: AppTextStyles.blackS4W4,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => homePageViewModel.openDrawer(),
                child: const Icon(
                  Icons.toc_outlined,
                  size: 48.0,
                  color: AppColors.darkGray,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SearchTextField(controller: viewModel.searchController),
        ),
        const SizedBox(height: 16.0),
        ImagePageViewWithDotIndicator(
          height: (screenWidth - 48.0) * pageViewImgAspectRatio + 44.0,
          scrollImages: const [
            AppAssets.stopSmoking,
            AppAssets.stopSmoking,
            AppAssets.stopSmoking,
            AppAssets.stopSmoking,
          ],
        ),
        const SizedBox(height: 16.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Quick Actions',
            style: AppTextStyles.blackS4W4,
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () => viewModel.goToAddComplaint(homePageViewModel),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.reportViolationType,
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          '• File Complaint',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.blackS1W4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () => viewModel.goToRegisterPage(),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.userComplaintForm,
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          '• Create Account',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.blackS1W4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () => viewModel.goToLawsAndRulesPage(),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.lawsAndRules,
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          '• Laws and Rules',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.blackS1W4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () => viewModel.goToStatisticsPage(),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.statsPages,
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          '• Statistics pages',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.blackS1W4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Slogans and Cautions about topic',
            style: AppTextStyles.blackS4W4,
          ),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(0X11),
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ),
                  ]),
                  child: Image.asset(
                    AppAssets.icNoSmoking,
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(0X11),
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ),
                  ]),
                  child: Image.asset(
                    AppAssets.icNoCigarettes,
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(0X11),
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ),
                  ]),
                  child: Image.asset(
                    AppAssets.icSmokingDamagesLungs,
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(0X11),
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ),
                  ]),
                  child: Image.asset(
                    AppAssets.icSmokingHazards,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
