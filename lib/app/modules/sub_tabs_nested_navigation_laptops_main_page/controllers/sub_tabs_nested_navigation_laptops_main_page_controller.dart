import 'package:get/get.dart';
import 'package:getx_nested_navigation_example/app/data/repository.dart';

class SubTabsNestedNavigationLaptopsMainPageController extends GetxController {
  final laptops = <String>[].obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    isLoading.value = true;
    laptops.value = await Repository().getLaptops;
    isLoading.value = false;
  }

  @override
  void onClose() {}
}
