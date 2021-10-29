class ComplaintType {
  String name;
  String imgUrl;

  ComplaintType({
    required this.name,
    required this.imgUrl,
  });

  factory ComplaintType.fromJson(Map<String, dynamic> json) => ComplaintType(
        name: json['name'],
        imgUrl: json['imgUrl'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'imgUrl': imgUrl,
      };
}
