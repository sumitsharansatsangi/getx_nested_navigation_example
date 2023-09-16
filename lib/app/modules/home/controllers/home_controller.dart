import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  RxInt tabIndex = 0.obs;
  late TabController tabController;
  void onTabClick(int newTab) {
    debugPrint('Tab $newTab');
    tabIndex(newTab);
    tabController.animateTo(newTab);
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
