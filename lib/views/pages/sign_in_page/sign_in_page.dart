import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';
import 'package:no_smoking_app/views/global/circular_loader.dart';
import 'package:no_smoking_app/views/global/rounded_bordered_text_field.dart';
import 'package:no_smoking_app/views/global/rounded_button.dart';
import 'package:no_smoking_app/views/pages/sign_in_page/sign_in_page_view_model.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Save screen size
    var screenHeight = Get.height;
    var screenWidth = Get.width;

    // Get View Model
    SignInPageViewModel viewModel = Get.find();

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                decoration: const BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage(''),
                    //   fit: BoxFit.cover,
                    // ),
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.2,
                    ),
                    const Text(
                      'Welcome To\nSmoke Free Pakistan App!',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.greenS7W7,
                    ),
                    const SizedBox(height: 32.0),
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
                    const SizedBox(height: 32.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: RoundedButton(
                        text: 'Sign In',
                        onTap: () => viewModel.signIn(),
                        isCircular: false,
                      ),
                    ),
                    const SizedBox(height: 48.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: AppTextStyles.darkGreenS2W4,
                        ),
                        GestureDetector(
                          onTap: () => viewModel.goToRegisterPage(),
                          child: const Text(
                            "Create One",
                            style: AppTextStyles.darkGreenS2W7,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    const Text(
                      "Stop Smoking & Take care of yourself and the environment",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.darkGreenS1W4I,
                    ),
                  ],
                ),
              ),
            ),
            GetBuilder<SignInPageViewModel>(
              builder: (viewModel) => viewModel.loading
                  ? CircularLoader(
                      width: screenWidth,
                      height: screenHeight,
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
