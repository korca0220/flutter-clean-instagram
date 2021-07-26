import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/auth_controller.dart';
import 'package:flutter_clean_instagram/app/controller/detail/image_controller.dart';
import 'package:flutter_clean_instagram/app/controller/user_controller.dart';
import 'package:flutter_clean_instagram/app/ui/android/bottom_navigation/tab_page.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/login_page.dart';
import 'package:get/get.dart';

class RootPage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      initState: (_) async {},
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          controller.getUser();
          return TabPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
