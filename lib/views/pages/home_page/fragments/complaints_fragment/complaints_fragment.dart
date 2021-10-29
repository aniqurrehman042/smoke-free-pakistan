import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/data/models/complaint.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';
import 'package:no_smoking_app/views/global/circular_loader.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';

import 'complaints_fragment_view_model.dart';

class ComplaintsFragment extends StatelessWidget {
  const ComplaintsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get View Model
    ComplaintsFragmentViewModel viewModel = Get.find();
    HomePageViewModel homePageViewModel = Get.find();

    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Complaints List',
                style: AppTextStyles.blackS6W4,
              ),
              GetBuilder<ComplaintsFragmentViewModel>(
                builder: (viewModel) => Text(
                  viewModel.complaints != null && viewModel.complaints!.isNotEmpty
                      ? viewModel.complaints!.length.toString() + ' Complains'
                      : '0 Complains',
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: AppColors.gray,
            child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    return snapshot.hasData
                        ? FutureBuilder<List<Complaint>?>(
                            future: viewModel.getCurrentUserComplaints(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                print('complaints: ' + (snapshot.data?[0].email ?? ''));
                                return snapshot.hasData && snapshot.data!.isNotEmpty
                                    ? ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 16.0),
                                    child: MaterialButton(
                                      color: Colors.white,
                                      onPressed: () => viewModel.goToComplaintDetailsPage(viewModel.complaints![index]),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(4.0),
                                            child: Image.network(
                                              viewModel.complaints![index]
                                                  .imageUrls[0],
                                              width: 90.0,
                                              height: 90.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  viewModel
                                                      .complaints![index].date
                                                      .toDate().toString(),
                                                  style: AppTextStyles
                                                      .darkGrayS2W4,
                                                  maxLines: 1,
                                                ),
                                                const SizedBox(height: 4.0),
                                                Text(
                                                  viewModel
                                                      .complaints![index].title,
                                                  style: AppTextStyles
                                                      .darkGreenS6W4,
                                                  maxLines: 1,
                                                ),
                                                const SizedBox(height: 4.0),
                                                Text(
                                                  viewModel
                                                      .complaints![index].description
                                                      .toString(),
                                                  style: AppTextStyles
                                                      .darkGrayS2W4,
                                                  maxLines: 2,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                : const Center(
                                  child: Text(
                                    'No complaints so far.',
                                    style: AppTextStyles.darkGreenS5W4,
                                  ),
                                );
                              }
                              return const CircularLoader();
                            },
                          )
                        : Center(
                            child: GestureDetector(
                              onTap: () => viewModel.goToSignInPage(),
                              child: const Text(
                                'Please sign in to see your complaints.',
                                style: AppTextStyles.darkGreenS5W4,
                              ),
                            ),
                          );
                  }
                  return const CircularLoader();
                }),
          ),
        )
      ],
    );
  }
}
