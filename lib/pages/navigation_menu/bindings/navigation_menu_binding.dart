import 'package:get/get.dart';

import '../controllers/navigation_menu_controller.dart';

class NavigationMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationMenuController());
  }
}
