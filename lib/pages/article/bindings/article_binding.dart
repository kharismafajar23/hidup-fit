import 'package:get/get.dart';
import 'package:hidup_fit/pages/navigation_menu/controllers/navigation_menu_controller.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationMenuController());
  }
}
