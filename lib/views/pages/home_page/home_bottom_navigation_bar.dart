import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/theme/app_assets.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';

import 'home_page_view_model.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(
      builder: (viewModel) => BottomNavigationBar(
        currentIndex: viewModel.getSelectedBottomNavBarIndex(),
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        elevation: 24.0,
        selectedItemColor: Colors.black,
        unselectedItemColor: AppColors.blueGray,
        selectedLabelStyle: AppTextStyles.darkGreenS2W4,
        unselectedLabelStyle: AppTextStyles.blueGrayS2W4,
        selectedIconTheme: const IconThemeData(
          size: 20.0,
          color: Colors.black,
        ),
        unselectedIconTheme: const IconThemeData(
          size: 20.0,
          color: AppColors.blueGray,
        ),
        type: BottomNavigationBarType.fixed,
        onTap: viewModel.bottomNavBarItemTap,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: ImageIcon(
                AssetImage(AppAssets.icHomeBlueGray),
              ),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: ImageIcon(
                AssetImage(AppAssets.icHome),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Notifications',
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: ImageIcon(
                AssetImage(AppAssets.icNotificationBlueGray),
              ),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: ImageIcon(
                AssetImage(AppAssets.icNotification),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home,
              color: Colors.transparent,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.transparent,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Complaints',
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: ImageIcon(
                AssetImage(AppAssets.icScheduleBlueGray),
              ),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: ImageIcon(
                AssetImage(AppAssets.icSchedule),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: ImageIcon(
                AssetImage(AppAssets.icProfileBlueGray),
              ),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: ImageIcon(
                AssetImage(AppAssets.icProfile),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
