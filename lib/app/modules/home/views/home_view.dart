import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nested_navigation_example/app/modules/nested_navigation_detail/bindings/nested_navigation_detail_binding.dart';
import 'package:getx_nested_navigation_example/app/modules/nested_navigation_detail/views/nested_navigation_detail_view.dart';
import 'package:getx_nested_navigation_example/app/modules/nested_navigation_main/views/nested_navigation_main_view.dart';
import 'package:getx_nested_navigation_example/app/modules/standard_navigation_main/views/standard_navigation_main_view.dart';
import 'package:getx_nested_navigation_example/app/modules/sub_tabs_nested_navigation_main/views/sub_tabs_nested_navigation_main_view.dart';
import 'package:getx_nested_navigation_example/app/routes/app_pages.dart';
import 'package:getx_nested_navigation_example/app/utils/get_view_keep_live.dart';
import 'package:getx_nested_navigation_example/constants.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetViewKeepAlive<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build called in home");
    return Scaffold(
      body: TabBarView(
          controller: controller.tabController,
          children: [
            const StandardNavigationMainView(),
            Navigator(
              key: Get.nestedKey(Constants.nestedNavigationNavigatorId),
              initialRoute: Routes.NESTED_NAVIGATION_MAIN,
              onGenerateRoute: (routeSettings) {
                if (routeSettings.name == Routes.NESTED_NAVIGATION_MAIN) {
                  return MaterialPageRoute(builder: (context) {
                    return const NestedNavigationMainView();
                  });
                } else if (routeSettings.name ==
                    Routes.NESTED_NAVIGATION_DETAIL) {
                  return GetPageRoute(
                    routeName: Routes.NESTED_NAVIGATION_DETAIL,
                    page: () => NestedNavigationDetailView(
                      argument: routeSettings.arguments as String,
                    ),
                    binding: NestedNavigationDetailBinding()
                  );
                }
                return MaterialPageRoute(builder: (context) {
                    return const NestedNavigationMainView();
                  });
              },
            ),
            const SubTabsNestedNavigationMainView()
          ],
        ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.tab), label: 'Standard'),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_chart), label: 'Nested'),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_rows_outlined), label: 'SubTabs Nested'),
          ],
          onTap: controller.onTabClick,
        ),
      ),
    );
  }
}
