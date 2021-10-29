import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no_smoking_app/core/constants/app_constants.dart';
import 'package:no_smoking_app/data/models/complaint.dart';

class ComplaintsRepository {
  final CollectionReference _complaintsCollectionReference =
      FirebaseFirestore.instance.collection(AppConstants.complaintsCollection);

  Future<bool> addComplaint(Complaint complaint) async {
    try {
      await _complaintsCollectionReference.add(complaint.toJson());
      return true;
    } on Exception catch (e) {
      debugPrint('Error: ComplaintRepository.addComplaint: ');
      debugPrint(e.toString());
      return false;
    }
  }

  Future<List<Complaint>?> getCurrentUserComplaints() async {
    try {
      List<Complaint> complaints = [];
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        var querySnapshot = await _complaintsCollectionReference
            .where('email', isEqualTo: currentUser.email)
            .get();
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          complaints.add(
            Complaint.fromJson(
              queryDocumentSnapshot.data() as Map<String, dynamic>,
            ),
          );
        }
        return complaints;
      } else {
        return null;
      }
    } on Exception catch (e) {
      debugPrint('Error: ComplaintRepository.getCurrentUserComplaints: ');
      debugPrint(e.toString());
      return null;
    }
  }
}
