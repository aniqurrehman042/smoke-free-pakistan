import 'package:get/get.dart';
import 'package:no_smoking_app/data/models/complaint.dart';
import 'package:no_smoking_app/data/repositories/complaint_repository.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/complaint_detail_page/complaint_detail_page.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';
import 'package:no_smoking_app/views/pages/sign_in_page/sign_in_page.dart';

class ComplaintsFragmentViewModel extends GetxController {
  final ComplaintsRepository _complaintsRepository = Get.find();

  List<Complaint>? _complaints;

  List<Complaint>? get complaints => _complaints;

  void goBack(HomePageViewModel homePageViewModel) {
    homePageViewModel.currentFragmentIndex = 0;
  }

  Future<List<Complaint>?> getCurrentUserComplaints() async {
    _complaints = await _complaintsRepository.getCurrentUserComplaints();
    update();
    return _complaints;
  }

  void goToComplaintDetailsPage(Complaint complaint) {
    Get.to(() => ComplaintDetailPage(complaint: complaint));
  }

  void goToSignInPage() {
    Get.to(() => const SignInPage());
  }
}