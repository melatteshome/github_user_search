import 'package:get/get.dart';
import 'package:whales_technology/pages/home/home_page.dart';
import 'package:whales_technology/pages/home/home_binding.dart';
import 'package:whales_technology/pages/home/home_logic.dart';
import 'package:whales_technology/routes/app_routes.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
        name: AppRoutes.Home_page,
        page: () => HomePage(),
        binding: HomeBinding())
  ];
}
