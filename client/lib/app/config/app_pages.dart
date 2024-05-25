import 'package:get/get.dart';
import 'package:nailed_it/app/config/app_routes.dart';
import 'package:nailed_it/presentation/view/root/root_screen.dart';
import 'package:nailed_it/presentation/view_model/notification/notification_binding.dart';
import 'package:nailed_it/presentation/view_model/root/root_binding.dart';
import 'package:nailed_it/presentation/view_model/see_more/see_more_binding.dart';

abstract class AppPages {
  static List<GetPage> data = [
    GetPage(
      name: AppRoutes.ROOT,
      page: () => const RootScreen(),
      bindings: [
        RootBinding(),
        NotificationBinding(),
        SeeMoreBinding(),
      ],
    ),
  ];
}
