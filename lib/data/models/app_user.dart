class AppUser {
  String fullName;
  String phone;
  String email;
  String department;
  String designation;

  AppUser({
    required this.fullName,
    required this.phone,
    required this.email,
    required this.department,
    required this.designation,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        fullName: json['fullName'],
        phone: json['phone'],
        email: json['email'],
        department: json['department'],
        designation: json['designation'],
      );

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'phone': phone,
        'email': email,
        'department': department,
        'designation': designation,
      };
}
