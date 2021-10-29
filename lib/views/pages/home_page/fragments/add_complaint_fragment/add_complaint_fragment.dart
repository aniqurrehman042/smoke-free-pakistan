import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/data/models/app_user.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';
import 'package:no_smoking_app/views/global/circular_loader.dart';
import 'package:no_smoking_app/views/global/number_box.dart';
import 'package:no_smoking_app/views/global/rounded_bordered_text_field.dart';
import 'package:no_smoking_app/views/global/rounded_button.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/add_complaint_fragment/add_complaint_fragment_view_model.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';

class AddComplaintFragment extends StatelessWidget {
  const AddComplaintFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Save screen size
    var screenHeight = Get.height;
    var screenWidth = Get.width;

    // Get View Model
    AddComplaintFragmentViewModel viewModel = Get.find();
    HomePageViewModel homePageViewModel = Get.find();

    return Stack(
      children: [
        Column(
          children: [
            AppBar(
              backgroundColor: AppColors.darkGreen,
              centerTitle: true,
              title: const Text(
                'Complain Form',
                style: AppTextStyles.whiteS6W4,
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => viewModel.goBack(homePageViewModel),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 56.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        'Full Name',
                        style: AppTextStyles.darkGreenS2W7,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: RoundedBorderedTextField(
                        hint: 'Your Full Name',
                        controller: viewModel.fullNameController,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 56.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        'Department',
                        style: AppTextStyles.darkGreenS2W7,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: RoundedBorderedTextField(
                        hint: 'Name of Your Department',
                        controller: viewModel.departmentController,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 56.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        'Designation',
                        style: AppTextStyles.darkGreenS2W7,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: RoundedBorderedTextField(
                        hint: 'Your Designation',
                        controller: viewModel.designationController,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 56.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        'Email ID',
                        style: AppTextStyles.darkGreenS2W7,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: RoundedBorderedTextField(
                        hint: 'Enter Your Email Address',
                        controller: viewModel.emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 56.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        'Phone Number',
                        style: AppTextStyles.darkGreenS2W7,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: RoundedBorderedTextField(
                        hint: 'Your Phone Number',
                        controller: viewModel.phoneNoController,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 56.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        'Complain Title',
                        style: AppTextStyles.darkGreenS2W7,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: RoundedBorderedTextField(
                        hint: 'Enter Complain Title',
                        controller: viewModel.complainTitleController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 56.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        'Complain Description',
                        style: AppTextStyles.darkGreenS2W7,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: RoundedBorderedTextField(
                        hint: 'Enter Complain Description',
                        controller: viewModel.complainDescriptionController,
                        keyboardType: TextInputType.text,
                        isTextArea: true,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    GetBuilder<AddComplaintFragmentViewModel>(
                      builder: (viewModel) => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Attach Pictures',
                                    style: AppTextStyles.darkGreenS2W7,
                                  ),
                                  Text(
                                    '(Min 1, Max 5)',
                                    style: AppTextStyles.darkGreenS1W4,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8.0),
                              viewModel.images[0].path.isEmpty
                                  ? NumberBox(
                                      number: '1',
                                      onTap: () =>
                                          viewModel.showCameraGalleryDialog(0),
                                    )
                                  : _getSelectableImage(
                                      index: 0,
                                      viewModel: viewModel,
                                    ),
                              const SizedBox(width: 8.0),
                              viewModel.images[1].path.isEmpty
                                  ? NumberBox(
                                      number: '2',
                                      onTap: () =>
                                          viewModel.showCameraGalleryDialog(1),
                                    )
                                  : _getSelectableImage(
                                      index: 1,
                                      viewModel: viewModel,
                                    ),
                              const SizedBox(width: 8.0),
                              viewModel.images[2].path.isEmpty
                                  ? NumberBox(
                                      number: '3',
                                      onTap: () =>
                                          viewModel.showCameraGalleryDialog(2),
                                    )
                                  : _getSelectableImage(
                                      index: 2,
                                      viewModel: viewModel,
                                    ),
                              const SizedBox(width: 8.0),
                              viewModel.images[3].path.isEmpty
                                  ? NumberBox(
                                      number: '4',
                                      onTap: () =>
                                          viewModel.showCameraGalleryDialog(3),
                                    )
                                  : _getSelectableImage(
                                      index: 3,
                                      viewModel: viewModel,
                                    ),
                              const SizedBox(width: 8.0),
                              viewModel.images[4].path.isEmpty
                                  ? NumberBox(
                                      number: '5',
                                      onTap: () =>
                                          viewModel.showCameraGalleryDialog(4),
                                    )
                                  : _getSelectableImage(
                                      index: 4,
                                      viewModel: viewModel,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 72.0),
                      child: RoundedButton(
                        text: 'Submit',
                        onTap: () =>
                            viewModel.handleSubmitComplaint(homePageViewModel),
                        isCircular: true,
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  ],
                ),
              ),
            ),
          ],
        ),
        GetBuilder<AddComplaintFragmentViewModel>(
          builder: (viewModel) => viewModel.loading
              ? CircularLoader(
                  width: screenWidth,
                  height: screenHeight,
                )
              : const SizedBox(),
        ),
      ],
    );
  }

  Widget _getSelectableImage({
    required int index,
    required AddComplaintFragmentViewModel viewModel,
  }) {
    return GestureDetector(
      onTap: () => viewModel.showCameraGalleryDialog(index),
      child: Image.file(
        File(viewModel.images[index].path),
        width: 40.0,
        height: 40.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
