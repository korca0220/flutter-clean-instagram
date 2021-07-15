import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
