import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:no_smoking_app/data/models/app_user.dart';
import 'package:no_smoking_app/data/models/complaint.dart';
import 'package:no_smoking_app/data/models/lat_lng.dart';
import 'package:no_smoking_app/data/repositories/complaint_repository.dart';
import 'package:no_smoking_app/data/repositories/local_repository.dart';
import 'package:no_smoking_app/data/repositories/storage_repository.dart';
import 'package:no_smoking_app/utils/snack_bar_utils.dart';
import 'package:no_smoking_app/views/global/rounded_button.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';

class AddComplaintFragmentViewModel extends GetxController {
  // Get repositories
  final ComplaintsRepository _complaintsRepository = Get.find();
  final StorageRepository _storageRepository = Get.find();
  final LocalRepository _localRepository = Get.find();

  // Get location
  final Location _location = Location();

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

  final ImagePicker _imagePicker = ImagePicker();

  // Selected Image Files
  final List<XFile> _images = [
    XFile(''),
    XFile(''),
    XFile(''),
    XFile(''),
    XFile(''),
  ];

  String _complaintType = '';
  int secondsSinceAuthChange = 0;

  AddComplaintFragmentViewModel() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _localRepository.getUser().then((appUser) {
          if (appUser != null) {
            _initData(appUser);
          }
        });
      }
    });
  }

  set complaintType(String value) {
    _complaintType = value;
  }

  bool _loading = false;

  TextEditingController get fullNameController => _fullNameController;

  TextEditingController get phoneNoController => _phoneNoController;

  TextEditingController get emailController => _emailController;

  TextEditingController get departmentController => _departmentController;

  TextEditingController get designationController => _designationController;

  TextEditingController get complainTitleController => _complainTitleController;

  TextEditingController get complainDescriptionController =>
      _complainDescriptionController;

  List<XFile> get images => _images;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    update();
  }

  setImage(XFile value, int index) {
    _images[index] = value;
    update();
  }

  void handleSubmitComplaint(HomePageViewModel homePageViewModel) async {
    loading = true;
    if (validateForm()) {
      var isComplaintSuccessful = true;
      List<String> imageNames = [];
      for (var image in _images) {
        if (image.path.isNotEmpty) {
          var imageName = await _storageRepository.saveImage(image.path);
          imageNames.add(imageName ?? '');
        }
      }
      var location = await _getLocation();
      var isLocationSuccessful = location != null && location.latitude != null;
      if (isLocationSuccessful) {
        isComplaintSuccessful = await _complaintsRepository.addComplaint(
          Complaint(
            fullName: _fullNameController.text,
            phone: _phoneNoController.text,
            email: _emailController.text,
            department: _departmentController.text,
            designation: _designationController.text,
            title: _complainTitleController.text,
            date: Timestamp.now(),
            description: _complainDescriptionController.text,
            complaintType: _complaintType,
            imageUrls: imageNames,
            location: LatLng(
              latitude: location!.latitude!,
              longitude: location.longitude!,
            ),
          ),
        );
      }
      if (!isLocationSuccessful) {
        SnackBarUtils.showShortSnackBar(
          title: 'Location Error',
          message: 'Failed to retrieve location.',
        );
      } else if (!isComplaintSuccessful) {
        SnackBarUtils.showShortSnackBar(
          title: 'Error',
          message: 'Complain registration failed.',
        );
      } else {
        goBack(homePageViewModel);
        SnackBarUtils.showShortSnackBar(
          title: 'Complain Registration Successful',
          message: 'The complain has been registered successfully.',
        );
      }
    } else {
      SnackBarUtils.showShortSnackBar(
        title: 'Missing Fields',
        message: 'Some fields are missing.',
      );
    }
    loading = false;
  }

  bool validateForm() {
    var isLoggedIn = FirebaseAuth.instance.currentUser != null;
    var isValid = true;
    if (_emailController.text.isEmpty && !isLoggedIn) {
      isValid = false;
    }
    if (_fullNameController.text.isEmpty && !isLoggedIn) {
      isValid = false;
    }
    if (_departmentController.text.isEmpty && !isLoggedIn) {
      isValid = false;
    }
    if (_designationController.text.isEmpty && !isLoggedIn) {
      isValid = false;
    }
    if (_phoneNoController.text.isEmpty && !isLoggedIn) {
      isValid = false;
    }
    if (_complainTitleController.text.isEmpty) {
      isValid = false;
    }
    if (_complainDescriptionController.text.isEmpty) {
      isValid = false;
    }
    if (_images[0].path.isEmpty &&
        _images[1].path.isEmpty &&
        _images[2].path.isEmpty &&
        _images[3].path.isEmpty &&
        _images[4].path.isEmpty) {
      isValid = false;
    }
    return isValid;
  }

  goBack(HomePageViewModel homePageViewModel) {
    homePageViewModel.currentFragmentIndex = 0;
  }

  void showCameraGalleryDialog(int index) {
    Get.dialog(
      Dialog(
        insetPadding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedButton(
                text: 'Camera',
                onTap: () {
                  Get.back();
                  pickImage(index: index, imageSource: ImageSource.camera);
                },
              ),
              const SizedBox(width: 16.0),
              RoundedButton(
                text: 'Gallery',
                onTap: () {
                  Get.back();
                  pickImage(index: index, imageSource: ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void pickImage({
    required int index,
    required ImageSource imageSource,
  }) async {
    var image = await _imagePicker.pickImage(source: imageSource);
    if (image != null) {
      setImage(image, index);
    }
  }

  Future<LocationData?> _getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    return await _location.getLocation();
  }

  void _initData(AppUser appUser) {
    _fullNameController.text = appUser.fullName;
    _phoneNoController.text = appUser.phone;
    _emailController.text = appUser.email;
    _departmentController.text = appUser.department;
    _designationController.text = appUser.designation;
  }

  void getLocalUser() {
    _localRepository.getUser().then((appUser) {
      if (appUser != null) {
        _initData(appUser);
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          secondsSinceAuthChange++;
          if (secondsSinceAuthChange < 30) {
            getLocalUser();
          }
        });
      }
    });
  }
}
