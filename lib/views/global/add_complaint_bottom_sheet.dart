import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';
import 'package:no_smoking_app/views/pages/register_page/register_page.dart';

class AddComplaintBottomSheet extends StatelessWidget {
  const AddComplaintBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get Complaint Form View Model
    HomePageViewModel homePageViewModel = Get.find();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        _getBottomSheetButton(
          text: 'Add Complaint',
          onPressed: () {
            Get.back();
            homePageViewModel.currentFragmentIndex = 5;
          },
        ),
        if (FirebaseAuth.instance.currentUser == null)
          _getBottomSheetButton(
            text: 'Create Account',
            onPressed: () {
              Get.back();
              Get.to(() => const RegisterPage());
            },
          ),
        const SizedBox(height: 80.0),
      ],
    );
  }

  Widget _getBottomSheetButton({
    required String text,
    required void Function() onPressed,
  }) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: 200.0,
      child: Text(
        text,
        style: AppTextStyles.blackS4W4,
      ),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
