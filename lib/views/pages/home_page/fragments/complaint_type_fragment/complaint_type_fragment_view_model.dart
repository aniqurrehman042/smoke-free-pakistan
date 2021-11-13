import 'package:get/get.dart';
import 'package:no_smoking_app/data/models/complaint_type.dart';
import 'package:no_smoking_app/theme/app_assets.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/add_complaint_fragment/add_complaint_fragment_view_model.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';

class ComplaintTypeFragmentViewModel extends GetxController {
  final List<ComplaintType>? _complaintTypes = [
    ComplaintType(
      name: 'Authorized Officer\nسرکاری افسر',
      imgUrl: AppAssets.icBusinessMan,
    ),
    ComplaintType(
      name: 'Common Citizen\nعام شہری',
      imgUrl: AppAssets.icStudent,
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
      int index
      ) {
    Get.back();
    addComplaintFragmentViewModel.complaintType = complaintType.name;
    if (index == 0) {
      homePageViewModel.currentFragmentIndex = 5;
    } else {
      homePageViewModel.currentFragmentIndex = 6;
    }
  }
}