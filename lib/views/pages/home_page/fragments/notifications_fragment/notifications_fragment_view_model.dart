import 'package:get/get.dart';
import 'package:no_smoking_app/data/models/app_notification.dart';
import 'package:no_smoking_app/views/pages/home_page/home_page_view_model.dart';

class NotificationsFragmentViewModel extends GetxController {
  final List<AppNotification>? _notifications = [
    AppNotification(
      title: 'Notification Title 1',
      description:
          'This is the first notification you have received. This is the first notification you have received. Thank you.',
    ),
    AppNotification(
      title: 'Notification Title 2',
      description:
      'This is the second notification you have received. This is the second notification you have received. Thank you.',
    ),
    AppNotification(
      title: 'Notification Title 3',
      description:
      'This is the third notification you have received. This is the third notification you have received. Thank you.',
    ),
    AppNotification(
      title: 'Notification Title 4',
      description:
      'This is the fourth notification you have received. This is the fourth notification you have received. Thank you.',
    ),
    AppNotification(
      title: 'Notification Title 5',
      description:
      'This is the fifth notification you have received. This is the fifth notification you have received. Thank you.',
    ),
  ];

  List<AppNotification>? get notifications => _notifications;

  void goBack(HomePageViewModel homePageViewModel) {
    homePageViewModel.currentFragmentIndex = 0;
  }
}
