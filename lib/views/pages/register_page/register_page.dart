import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';
import 'package:no_smoking_app/views/global/circular_loader.dart';
import 'package:no_smoking_app/views/global/rounded_bordered_text_field.dart';
import 'package:no_smoking_app/views/global/rounded_button.dart';
import 'package:no_smoking_app/views/pages/register_page/register_page_view_model.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Save screen size
    var screenHeight = Get.height;
    var screenWidth = Get.width;

    // Get View Model
    RegisterPageViewModel viewModel = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.darkGreen,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        centerTitle: true,
        title: const Text(
          'Register',
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage(''),
                  //   fit: BoxFit.cover,
                  // ),
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32.0),
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Text(
                      'Phone Number',
                      style: AppTextStyles.darkGreenS2W7,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RoundedBorderedTextField(
                      hint: 'Your Phone Number',
                      controller: viewModel.phoneNoController,
                      keyboardType: TextInputType.phone,
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RoundedBorderedTextField(
                      hint: 'Enter Your Email Address',
                      controller: viewModel.emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Text(
                      'Password',
                      style: AppTextStyles.darkGreenS2W7,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RoundedBorderedTextField(
                      hint: 'Enter Your Password',
                      controller: viewModel.passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RoundedBorderedTextField(
                      hint: 'Your Department',
                      controller: viewModel.departmentController,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RoundedBorderedTextField(
                      hint: 'Your Designation',
                      controller: viewModel.designationController,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: RoundedButton(
                      text: 'Create Account',
                      onTap: () => viewModel.register(),
                      isCircular: true,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                ],
              ),
            ),
          ),
          GetBuilder<RegisterPageViewModel>(
            builder: (viewModel) => viewModel.loading
                ? CircularLoader(
                    width: screenWidth,
                    height: screenHeight,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
