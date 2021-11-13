import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/add_complaint_fragment/add_complaint_fragment_view_model.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';

import 'violation_type_fragment_view_model.dart';

class ViolationTypeFragment extends StatelessWidget {
  const ViolationTypeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get View Model
    ViolationTypeFragmentViewModel viewModel = Get.find();
    HomePageViewModel homePageViewModel = Get.find();
    AddComplaintFragmentViewModel addComplaintFragmentViewModel = Get.find();

    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Report Violation',
                style: AppTextStyles.blackS6W4,
              ),
              GetBuilder<ViolationTypeFragmentViewModel>(
                builder: (viewModel) => const Text(
                  'Violation Type',
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
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
              ),
              itemCount: viewModel.complaintTypes?.length ?? 0,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: MaterialButton(
                  color: AppColors.darkGreen,
                  onPressed: () => viewModel.goToAddComplaintPage(
                    viewModel.complaintTypes![index],
                    homePageViewModel,
                    addComplaintFragmentViewModel,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        viewModel.complaintTypes![index].imgUrl,
                        height: 150.0,
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        color: Colors.blue[200],
                        height: 2.0,
                        width: 50.0,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        viewModel.complaintTypes![index].name,
                        style: AppTextStyles.whiteS3W4,
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
