import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
    with SingleGetTickerProviderMixin {
  final List<Tab> tabs = <Tab>[
    Tab(
      child: Icon(Icons.receipt),
    ),
    Tab(
      child: Icon(Icons.photo_outlined),
    ),
  ];

  ScrollController scrollController;
  TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: tabs.length, vsync: this);
    scrollController = ScrollController();
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
    scrollController.dispose();
  }
}
