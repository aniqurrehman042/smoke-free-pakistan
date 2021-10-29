class AppNotification {
  String title;
  String description;

  AppNotification({
    required this.title,
    required this.description,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      AppNotification(
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };
}
