import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        title: const Text(
          'Statistics',
          style: AppTextStyles.blackS6W4,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: const [
          Expanded(
            child: Center(
              child: Text(
                'Coming Soon',
                style: AppTextStyles.darkGreenS5W4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
