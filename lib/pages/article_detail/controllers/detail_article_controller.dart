import 'package:get/get.dart';
import 'package:hidup_fit/data/models/article.dart';

class DetailArticleController extends GetxController {
  Article arguments = Get.arguments;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('###################################');
    print(arguments.title);
  }
}
