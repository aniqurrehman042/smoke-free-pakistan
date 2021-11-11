import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/theme/app_assets.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';
import 'package:no_smoking_app/views/global/image_page_view_with_dot_indicator.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Save screen size
    var screenHeight = Get.height;

    // Scroll Images List
    var scrollImages = [
      AppAssets.splashImage
    ];

    // Go to Home Page after delay
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.off(() => const HomePage()),
    );

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          // Main Column
          child: Column(
            children: [
              // Top Space
              SizedBox(height: screenHeight * 0.25),

              // Middle Section
              SizedBox(
                height: screenHeight * 0.5,

                // Middle Section Column
                child: Column(
                  children: [
                    // Scrollable Page View For Images
                    ImagePageViewWithDotIndicator(
                      isExpanded: true,
                      scrollImages: scrollImages,
                    ),
                    const SizedBox(height: 16.0),

                    // App Title
                    const Text(
                      'SMOKE FREE PAKISTAN',
                      style: AppTextStyles.darkGreenS6W7,
                    )
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),

              // Copyright Notice
              const Text(
                '© 2021 Smoke Free Pakistan App. All rights reserved.',
                textAlign: TextAlign.center,
                style: AppTextStyles.blackS1W4,
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
