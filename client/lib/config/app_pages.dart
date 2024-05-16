import 'package:get/get.dart';
import 'package:nailed_it/binding/home_binding.dart';
import 'package:nailed_it/binding/nursery_binding.dart';
import 'package:nailed_it/binding/profile_binding.dart';
import 'package:nailed_it/binding/root_binding.dart';
import 'package:nailed_it/config/app_routes.dart';
import 'package:nailed_it/view/nursery/nursery_screen.dart';
import 'package:nailed_it/view/root/root_screen.dart';

List<GetPage> appPages = [
  GetPage(
    name: Routes.ROOT,
    page: () => const RootScreen(),
    bindings: [
      RootBinding(),
      HomeBinding(),
      ProfileBinding(),
    ],
  ),
  GetPage(
    name: Routes.NURSERY,
    page: () => const NurseryScreen(),
    binding: NurseryBinding(),
  ),
];
