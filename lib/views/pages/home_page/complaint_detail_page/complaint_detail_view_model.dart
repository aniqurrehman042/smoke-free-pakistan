import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/data/models/complaint.dart';

class ComplaintDetailViewModel extends GetxController {
  // Text Editing Controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _complainTitleController =
      TextEditingController();
  final TextEditingController _complainDescriptionController =
      TextEditingController();

  TextEditingController get fullNameController => _fullNameController;

  TextEditingController get phoneNoController => _phoneNoController;

  TextEditingController get emailController => _emailController;

  TextEditingController get departmentController => _departmentController;

  TextEditingController get designationController => _designationController;

  TextEditingController get complainTitleController => _complainTitleController;

  TextEditingController get complainDescriptionController =>
      _complainDescriptionController;

  void goBack() {
    Get.back();
  }

  void initData(Complaint complaint) {
    _fullNameController.text = complaint.fullName;
    _emailController.text = complaint.email;
    _phoneNoController.text = complaint.phone;
    _departmentController.text = complaint.department;
    _designationController.text = complaint.designation;
    _complainTitleController.text = complaint.title;
    _complainDescriptionController.text = complaint.description;
  }
}
