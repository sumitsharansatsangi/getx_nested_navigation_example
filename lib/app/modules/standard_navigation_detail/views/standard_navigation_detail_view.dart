import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/standard_navigation_detail_controller.dart';

class StandardNavigationDetailView
    extends GetView<StandardNavigationDetailController> {
  const StandardNavigationDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StandardNavigationDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: OutlinedButton(
          child: const Text('Go back'),
          onPressed: () => Get.back(),
        ),
      ),
    );
  }
}
