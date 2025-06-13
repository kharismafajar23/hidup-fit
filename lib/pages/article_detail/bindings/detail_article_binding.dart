import 'package:get/get.dart';
import 'package:hidup_fit/pages/article_detail/controllers/detail_article_controller.dart';

class DetailArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailArticleController()); // langsung inject, bukan lazy
  }
}
