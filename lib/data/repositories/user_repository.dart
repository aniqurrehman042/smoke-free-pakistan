import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no_smoking_app/core/constants/app_constants.dart';
import 'package:no_smoking_app/data/models/app_user.dart';

class UsersRepository {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection(AppConstants.usersCollection);

  Future<bool> register(AppUser user) async {
    try {
      await _usersCollectionReference.doc(user.email).set(user.toJson());
      return true;
    } on Exception catch (e) {
      debugPrint('Error: UserRepository.register: ');
      debugPrint(e.toString());
      return false;
    }
  }

  Future<AppUser?> getProfile(String email) async {
    try {
      var user = await _usersCollectionReference.doc(email).get();
      return AppUser.fromJson(user.data() as Map<String, dynamic>);
    } on Exception catch (e) {
      debugPrint('Error: UserRepository.getProfile: ');
      debugPrint(e.toString());
      return null;
    }
  }

  Future<bool> editProfile(AppUser user) async {
    try {
      await _usersCollectionReference.doc(user.email).update(user.toJson());
      return true;
    } on Exception catch (e) {
      debugPrint('Error: UserRepository.register: ');
      debugPrint(e.toString());
      return false;
    }
  }

  Future<AppUser?> getCurrentUserProfile() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        var user = await _usersCollectionReference.doc(currentUser.email).get();
        return AppUser.fromJson(user.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } on Exception catch (e) {
      debugPrint('Error: UserRepository.getCurrentUserProfile: ');
      debugPrint(e.toString());
      return null;
    }
  }
}
