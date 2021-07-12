import 'package:flutter_clean_instagram/app/ui/android/bottom_navigation/tab_page.dart';
import 'package:flutter_clean_instagram/app/ui/android/root/root_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => RootPage()),
    GetPage(name: Routes.HOME_PAGE, page: () => TabPage()),
  ];
}
