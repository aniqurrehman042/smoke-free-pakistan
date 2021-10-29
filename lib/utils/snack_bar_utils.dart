import 'package:get/get.dart';

class SnackBarUtils {
  static showShortSnackBar({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 2),
    );
  }
}
