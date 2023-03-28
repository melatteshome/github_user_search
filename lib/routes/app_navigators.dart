import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whales_technology/routes/app_routes.dart';

class AppNavigator {
  static void startHomePage() {
    Get.toNamed(AppRoutes.Home_page);
  }
}
