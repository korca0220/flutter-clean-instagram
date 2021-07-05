import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DirectPageController extends GetxController
    with SingleGetTickerProviderMixin {
  final List<Tab> tabs = <Tab>[
    Tab(text: '채팅'),
    Tab(text: '룸스'),
  ];

  TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
  }
}
