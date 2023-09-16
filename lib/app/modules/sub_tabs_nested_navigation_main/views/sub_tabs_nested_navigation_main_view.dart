import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nested_navigation_example/app/modules/sub_tabs_nested_navigation_computer_detail_page/bindings/sub_tabs_nested_navigation_computer_detail_page_binding.dart';
import 'package:getx_nested_navigation_example/app/modules/sub_tabs_nested_navigation_computer_detail_page/views/sub_tabs_nested_navigation_computer_detail_page_view.dart';
import 'package:getx_nested_navigation_example/app/modules/sub_tabs_nested_navigation_computers_main_page/bindings/sub_tabs_nested_navigation_computers_main_page_binding.dart';
import 'package:getx_nested_navigation_example/app/modules/sub_tabs_nested_navigation_computers_main_page/views/sub_tabs_nested_navigation_computers_main_page_view.dart';
import 'package:getx_nested_navigation_example/app/modules/sub_tabs_nested_navigation_laptop_detail_page/bindings/sub_tabs_nested_navigation_laptop_detail_page_binding.dart';
import 'package:getx_nested_navigation_example/app/modules/sub_tabs_nested_navigation_laptop_detail_page/views/sub_tabs_nested_navigation_laptop_detail_page_view.dart';
import 'package:getx_nested_navigation_example/app/modules/sub_tabs_nested_navigation_laptops_main_page/bindings/sub_tabs_nested_navigation_laptops_main_page_binding.dart';
import 'package:getx_nested_navigation_example/app/modules/sub_tabs_nested_navigation_laptops_main_page/views/sub_tabs_nested_navigation_laptops_main_page_view.dart';
import 'package:getx_nested_navigation_example/app/routes/app_pages.dart';
import 'package:getx_nested_navigation_example/app/utils/get_view_keep_live.dart';
import '../../../../constants.dart';
import '../controllers/sub_tabs_nested_navigation_main_controller.dart';

class SubTabsNestedNavigationMainView
    extends GetViewKeepAlive<SubTabsNestedNavigationMainController> {
  const SubTabsNestedNavigationMainView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build called in SubTabsNestedNavigationMainView");
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: TabBar(
              controller: controller.tabController,
              tabs: const [
                Tab(
                  icon: Icon(Icons.desktop_mac),
                  text: "Desktop",
                ),
                Tab(
                  icon: Icon(Icons.laptop_mac),
                  text: "Laptop",
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: [
              Navigator(
                key: Get.nestedKey(Constants.subTabComputerNavigatorId),
                initialRoute:
                    Routes.SUB_TABS_NESTED_NAVIGATION_COMPUTERS_MAIN_PAGE,
                onGenerateRoute: (routeSettings) {
                  if (routeSettings.name ==
                      Routes.SUB_TABS_NESTED_NAVIGATION_COMPUTERS_MAIN_PAGE) {
                    return GetPageRoute(
                        routeName: Routes
                            .SUB_TABS_NESTED_NAVIGATION_COMPUTER_DETAIL_PAGE,
                        page: () =>
                            const SubTabsNestedNavigationComputersMainPageView(),
                        transitionDuration: const Duration(milliseconds: 100),
                        transition: Transition.circularReveal,
                        popGesture: true,
                        maintainState: true,
                        binding:
                            SubTabsNestedNavigationComputersMainPageBinding());
                  } else if (routeSettings.name ==
                      Routes.SUB_TABS_NESTED_NAVIGATION_COMPUTER_DETAIL_PAGE) {
                    return GetPageRoute(
                        routeName: Routes
                            .SUB_TABS_NESTED_NAVIGATION_COMPUTER_DETAIL_PAGE,
                        page: () =>
                            SubTabsNestedNavigationComputerDetailPageView(
                              argument: routeSettings.arguments as String,
                            ),
                        transition: Transition.rightToLeftWithFade,
                        binding:
                            SubTabsNestedNavigationComputerDetailPageBinding());
                  }
                  return GetPageRoute(
                      routeName: Routes
                          .SUB_TABS_NESTED_NAVIGATION_COMPUTER_DETAIL_PAGE,
                      page: () =>
                          const SubTabsNestedNavigationComputersMainPageView(),
                      transitionDuration: const Duration(milliseconds: 100),
                      transition: Transition.circularReveal,
                      popGesture: true,
                      maintainState: true,
                      binding:
                          SubTabsNestedNavigationComputersMainPageBinding());
                },
              ),
              Navigator(
                key: Get.nestedKey(Constants.subTabLaptopNavigatorId),
                initialRoute:
                    Routes.SUB_TABS_NESTED_NAVIGATION_LAPTOPS_MAIN_PAGE,
                onGenerateRoute: (routeSettings) {
                  if (routeSettings.name ==
                      Routes.SUB_TABS_NESTED_NAVIGATION_LAPTOPS_MAIN_PAGE) {
                    return GetPageRoute(
                        routeName: Routes
                            .SUB_TABS_NESTED_NAVIGATION_LAPTOP_DETAIL_PAGE,
                        page: () =>
                            const SubTabsNestedNavigationLaptopsMainPageView(),
                        transitionDuration: const Duration(milliseconds: 100),
                        transition: Transition.circularReveal,
                        popGesture: true,
                        maintainState: true,
                        binding:
                            SubTabsNestedNavigationLaptopsMainPageBinding());
                  } else if (routeSettings.name ==
                      Routes.SUB_TABS_NESTED_NAVIGATION_LAPTOP_DETAIL_PAGE) {
                    return GetPageRoute(
                        routeName: Routes
                            .SUB_TABS_NESTED_NAVIGATION_LAPTOP_DETAIL_PAGE,
                        page: () => SubTabsNestedNavigationLaptopDetailPageView(
                              argument: routeSettings.arguments as String,
                            ),
                        transitionDuration: const Duration(milliseconds: 100),
                        transition: Transition.rightToLeftWithFade,
                        popGesture: true,
                        maintainState: true,
                        binding:
                            SubTabsNestedNavigationLaptopDetailPageBinding());
                  }
                  return GetPageRoute(
                      routeName:
                          Routes.SUB_TABS_NESTED_NAVIGATION_LAPTOP_DETAIL_PAGE,
                      page: () =>
                          const SubTabsNestedNavigationLaptopsMainPageView(),
                      transitionDuration: const Duration(milliseconds: 100),
                      transition: Transition.circularReveal,
                      popGesture: true,
                      maintainState: true,
                      binding: SubTabsNestedNavigationLaptopsMainPageBinding());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
