import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';
import 'package:no_smoking_app/views/global/rounded_bordered_text_field.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/profile_fragment/profile_fragment_view_model.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get View Model
    ProfileFragmentViewModel viewModel = Get.find();
    HomePageViewModel homePageViewModel = Get.find();

    // App Bar
    final appBar = AppBar(
      backgroundColor: AppColors.darkGreen,
      centerTitle: true,
      title: const Text(
        'Profile',
        style: AppTextStyles.whiteS6W4,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => viewModel.goBack(homePageViewModel),
      ),
    );

    return FirebaseAuth.instance.currentUser != null
        ? Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    appBar,
                    const SizedBox(height: 32.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                            child: Text(
                              'Full Name',
                              style: AppTextStyles.darkGreenS2W7,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: RoundedBorderedTextField(
                              hint: 'Your Full Name',
                              controller: viewModel.fullNameController,
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              readOnly: true,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                            child: Text(
                              'Phone Number',
                              style: AppTextStyles.darkGreenS2W7,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: RoundedBorderedTextField(
                              hint: 'Your Phone Number',
                              controller: viewModel.phoneNoController,
                              keyboardType: TextInputType.phone,
                              readOnly: true,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                            child: Text(
                              'E-mail',
                              style: AppTextStyles.darkGreenS2W7,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: RoundedBorderedTextField(
                              hint: 'Enter Your Email Address',
                              controller: viewModel.emailController,
                              keyboardType: TextInputType.emailAddress,
                              readOnly: true,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                            child: Text(
                              'Department',
                              style: AppTextStyles.darkGreenS2W7,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: RoundedBorderedTextField(
                              hint: 'Your Department',
                              controller: viewModel.departmentController,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              readOnly: true,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                            child: Text(
                              'Designation',
                              style: AppTextStyles.darkGreenS2W7,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: RoundedBorderedTextField(
                              hint: 'Your Designation',
                              controller: viewModel.designationController,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              readOnly: true,
                            ),
                          ),
                          const SizedBox(height: 32.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  ],
                ),
              ),
            ],
          )
        : Column(
            children: [
              appBar,
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () => viewModel.goToSignInPage(),
                    child: const Text(
                      'Please login to see your profile.',
                      style: AppTextStyles.darkGreenS5W4,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
