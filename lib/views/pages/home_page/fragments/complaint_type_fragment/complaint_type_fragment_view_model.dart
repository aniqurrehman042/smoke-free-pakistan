import 'package:get/get.dart';
import 'package:no_smoking_app/data/models/complaint_type.dart';
import 'package:no_smoking_app/theme/app_assets.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/add_complaint_fragment/add_complaint_fragment_view_model.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';

class ComplaintTypeFragmentViewModel extends GetxController {
  final List<ComplaintType>? _complaintTypes = [
    ComplaintType(
      name: 'Violation at Public Place',
      imgUrl: AppAssets.noImg,
    ),
    ComplaintType(
      name: 'No Smoking sign boards are not displayed',
      imgUrl: AppAssets.noImg,
    ),
    ComplaintType(
      name: 'Sale or Retailership',
      imgUrl: AppAssets.noImg,
    ),
    ComplaintType(
      name: 'Violation at Private Place',
      imgUrl: AppAssets.noImg,
    ),
  ];

  List<ComplaintType>? get complaintTypes => _complaintTypes;

  void goBack(HomePageViewModel homePageViewModel) {
    homePageViewModel.currentFragmentIndex = 0;
  }

  void goToAddComplaintPage(
    ComplaintType complaintType,
    HomePageViewModel homePageViewModel,
    AddComplaintFragmentViewModel addComplaintFragmentViewModel,
  ) {
    Get.back();
    addComplaintFragmentViewModel.complaintType = complaintType.name;
    homePageViewModel.currentFragmentIndex = 5;
  }
}
