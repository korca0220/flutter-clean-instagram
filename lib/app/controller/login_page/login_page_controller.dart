import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController
    with SingleGetTickerProviderMixin {
  PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0, keepPage: false);
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
