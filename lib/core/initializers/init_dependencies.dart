import 'package:get/get.dart';
import 'package:no_smoking_app/controllers/firebase_controller.dart';
import 'package:no_smoking_app/data/repositories/complaint_repository.dart';
import 'package:no_smoking_app/data/repositories/local_repository.dart';
import 'package:no_smoking_app/data/repositories/storage_repository.dart';
import 'package:no_smoking_app/data/repositories/user_repository.dart';
import 'package:no_smoking_app/views/pages/home_page/complaint_detail_page/complaint_detail_view_model.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/add_complaint_fragment/add_complaint_fragment_view_model.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/complaint_type_fragment/complaint_type_fragment_view_model.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/complaints_fragment/complaints_fragment_view_model.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/home_fragment/home_fragment_view_model.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/notifications_fragment/notifications_fragment_view_model.dart';
import 'package:no_smoking_app/views/pages/home_page/fragments/profile_fragment/profile_fragment_view_model.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';
import 'package:no_smoking_app/views/pages/register_page/register_page_view_model.dart';
import 'package:no_smoking_app/views/pages/sign_in_page/sign_in_page_view_model.dart';

void initDependencies() {
  // Repositories
  Get.put(UsersRepository());
  Get.put(ComplaintsRepository());
  Get.put(StorageRepository());
  Get.put(LocalRepository());

  // View models
  Get.put(SignInPageViewModel());
  Get.put(RegisterPageViewModel());
  Get.put(ComplaintDetailViewModel());
  Get.put(HomePageViewModel());
  Get.put(HomeFragmentViewModel());
  Get.put(AddComplaintFragmentViewModel());
  Get.put(ComplaintsFragmentViewModel());
  Get.put(ProfileFragmentViewModel());
  Get.put(NotificationsFragmentViewModel());
  Get.put(ComplaintTypeFragmentViewModel());
}

void initFirebase() {
  Get.put(FirebaseController());
}