class LatLng {
  double latitude;
  double longitude;

  LatLng({
    required this.latitude,
    required this.longitude,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => LatLng(
        latitude: json['latitude'],
        longitude: json['longitude'],
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}
