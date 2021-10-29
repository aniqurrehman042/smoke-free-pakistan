import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/data/models/complaint.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';
import 'package:no_smoking_app/views/global/image_page_view_with_dot_indicator.dart';
import 'package:no_smoking_app/views/global/rounded_bordered_text_field.dart';
import 'package:no_smoking_app/views/pages/home_page/complaint_detail_page/complaint_detail_view_model.dart';

class ComplaintDetailPage extends StatelessWidget {
  const ComplaintDetailPage({
    Key? key,
    required this.complaint,
  }) : super(key: key);

  final Complaint complaint;

  @override
  Widget build(BuildContext context) {
    // Get View Model
    ComplaintDetailViewModel viewModel = Get.find();

    // Get screen dimensions
    var screenHeight = Get.height;

    viewModel.initData(complaint);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.darkGreen,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        centerTitle: true,
        title: const Text(
          'Complaint Detail',
          style: AppTextStyles.whiteS6W4,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => viewModel.goBack(),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32.0),
                ImagePageViewWithDotIndicator(
                  scrollImages: complaint.imageUrls,
                  height: screenHeight * 0.3,
                  isNetwork: true,
                ),
                const SizedBox(height: 16),
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
                    controller: viewModel.fullNameController,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    readOnly: true,
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
                    controller: viewModel.departmentController,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    readOnly: true,
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
                    controller: viewModel.designationController,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    readOnly: true,
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
                    controller: viewModel.emailController,
                    keyboardType: TextInputType.emailAddress,
                    readOnly: true,
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
                    controller: viewModel.phoneNoController,
                    keyboardType: TextInputType.phone,
                    readOnly: true,
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
                    controller: viewModel.complainTitleController,
                    keyboardType: TextInputType.text,
                    readOnly: true,
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
                    controller: viewModel.complainDescriptionController,
                    keyboardType: TextInputType.text,
                    isTextArea: true,
                    readOnly: true,
                  ),
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
