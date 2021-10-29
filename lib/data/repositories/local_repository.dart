import 'dart:convert';

import 'package:no_smoking_app/core/constants/app_constants.dart';
import 'package:no_smoking_app/data/models/app_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  final Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  Future<void> saveUser(AppUser user) async {
    (await _sharedPreferences)
        .setString(AppConstants.prefUserProfile, jsonEncode(user));
  }

  Future<AppUser?> getUser() async {
    var userJson =
        (await _sharedPreferences).getString(AppConstants.prefUserProfile);
    return userJson != null && userJson.isNotEmpty
        ? AppUser.fromJson(jsonDecode(userJson))
        : null;
  }
}
