import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';
import 'package:no_smoking_app/views/global/rounded_button.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/notifications_fragment/notifications_fragment_view_model.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';

class NotificationsFragment extends StatelessWidget {
  const NotificationsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get View Model
    NotificationsFragmentViewModel viewModel = Get.find();
    HomePageViewModel homePageViewModel = Get.find();

    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notifications',
                style: AppTextStyles.blackS6W4,
              ),
              GetBuilder<NotificationsFragmentViewModel>(
                builder: (viewModel) => Text(
                  viewModel.notifications != null &&
                          viewModel.notifications!.isNotEmpty
                      ? viewModel.notifications!.length.toString() +
                          ' Notifications'
                      : '0 Notifications',
                  style: AppTextStyles.darkGrayS4W4,
                ),
              ),
              const SizedBox(height: 8.0)
            ],
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => viewModel.goBack(homePageViewModel),
          ),
        ),
        Expanded(
          child: Container(
            color: AppColors.gray,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 4.0),
              itemCount: viewModel.notifications?.length ?? 0,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: MaterialButton(
                  color: Colors.white,
                  onPressed: () => {},
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 40.0,
                        height: 25.0,
                        child: index == 0
                            ? const Center(
                                child: Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 10.0,
                                ),
                              )
                            : const SizedBox(),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewModel.notifications![index].title,
                              style: AppTextStyles.blackS5W4,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              viewModel.notifications![index].description
                                  .toString(),
                              style: AppTextStyles.darkGrayS2W4,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      RoundedButton(
                        text: 'View',
                        isMini: true,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
