import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/views/pages/home_page/home_bottom_navigation_bar.dart';
import 'package:no_smoking_app/views/pages/home_page/home_drawer.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get View Model
    HomePageViewModel viewModel = Get.find();

    return WillPopScope(
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Scaffold(
          key: viewModel.scaffoldKey,
          backgroundColor: Colors.white,
          drawer: const HomeDrawer(),
          bottomNavigationBar: const HomeBottomNavigationBar(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: FloatingActionButton(
              backgroundColor: AppColors.darkGreen,
              onPressed: () => viewModel.showAddComplaintMenu(),
              child: const Icon(
                Icons.add,
                size: 35.0,
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: GetBuilder<HomePageViewModel>(
            builder: (viewModel) =>
                viewModel.fragments[viewModel.currentFragmentIndex],
          ),
        ),
      ),
      onWillPop: viewModel.onBackPressed,
    );
  }
}
