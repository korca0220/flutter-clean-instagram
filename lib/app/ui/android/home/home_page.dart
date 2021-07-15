import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/home/home_controller.dart';
import 'package:flutter_clean_instagram/app/ui/android/home/direct_home.dart';
import 'package:flutter_clean_instagram/app/ui/android/home/main_home.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return PageView(
      controller: controller.pageController,
      children: [
        MainPage(),
        DirectPage(
          onBackTap: () {
            controller.pageController.previousPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          },
        ),
      ],
    );
  }
}
