import 'package:cloud_firestore/cloud_firestore.dart';

import 'lat_lng.dart';

class Complaint {
  String department;
  String designation;
  String fullName;
  String email;
  String phone;
  String title;
  String description;
  String? complaintType;
  Timestamp date;
  List<String> imageUrls;
  LatLng? location;

  Complaint({
    required this.department,
    required this.designation,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.title,
    required this.description,
    this.complaintType,
    required this.date,
    required this.imageUrls,
    this.location,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) => Complaint(
        department: json['department'],
        designation: json['designation'],
        fullName: json['fullName'],
        email: json['email'],
        phone: json['phone'],
        title: json['title'],
        description: json['description'],
        complaintType: json['complaintType'],
        date: json['date'],
        imageUrls: [for (var imageUrl in json['imageUrls']) imageUrl],
        location: json['location'] != null ? LatLng.fromJson(json['location']) : null,
      );

  Map<String, dynamic> toJson() => {
        'department': department,
        'designation': designation,
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'title': title,
        'description': description,
        'complaintType': complaintType,
        'date': date,
        'imageUrls': imageUrls,
        'location': location != null ? location!.toJson() : null,
      };
}
