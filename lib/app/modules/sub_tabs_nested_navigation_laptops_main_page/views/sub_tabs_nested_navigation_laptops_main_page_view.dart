import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nested_navigation_example/app/routes/app_pages.dart';
import 'package:getx_nested_navigation_example/app/utils/get_view_keep_live.dart';

import '../../../../constants.dart';
import '../controllers/sub_tabs_nested_navigation_laptops_main_page_controller.dart';

class SubTabsNestedNavigationLaptopsMainPageView
    extends GetViewKeepAlive<SubTabsNestedNavigationLaptopsMainPageController> {
  const SubTabsNestedNavigationLaptopsMainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build called in SubTabsNestedNavigationLaptopsMainPageView");
    return Obx(() => controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : controller.laptops.isEmpty
            ? const Center(child: Text("No Data"))
            : ListView.builder(
                itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text(controller.laptops[index]),
                  onTap: () => Get.toNamed(
                      Routes.SUB_TABS_NESTED_NAVIGATION_LAPTOP_DETAIL_PAGE,
                      arguments: controller.laptops[index],
                      id: Constants.subTabLaptopNavigatorId),
                ),
                itemCount: controller.laptops.length,
              ));
  }
}
