import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/controllers/firebase_controller.dart';
import 'package:no_smoking_app/core/constants/app_constants.dart';
import 'package:no_smoking_app/core/initializers/init_dependencies.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page.dart';
import 'package:no_smoking_app/views/pages/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize firebase
    initFirebase();
    
    return GetMaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Get.find<FirebaseController>().initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                  'Could not start the app. Please check your internet connection.'),
            );
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            // Initialize Settings
            initialize();
            return const SplashScreen();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.darkGreen,
            ),
          );
        },
      ),
    );
  }

  void initialize() {
    // Init GetX Controllers
    initDependencies();
  }
}
