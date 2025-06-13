import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/data/models/article.dart';
import 'package:hidup_fit/data/services/db_helper.dart';
import 'package:hidup_fit/pages/article/views/article_views.dart';
import 'package:hidup_fit/pages/home/views/home_view.dart';
import 'package:hidup_fit/pages/input_data/views/input_data_view.dart';
import 'package:hidup_fit/pages/konsultasi/views/konsultasi_view.dart';
import 'package:hidup_fit/pages/profile/views/profile_view.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/local_storage/storage_utility.dart';

class NavigationMenuController extends GetxController {
  RxInt selectedIndex = 0.obs;
  var user = {};
  var articles = <Article>[].obs;

  final List<Widget> pages = const [
    HomeView(),
    InputDataView(),
    KonsultasiView(),
    ArticleViews(),
    ProfileView()
  ];

  @override
  void onInit() {
    loadUser();
    loadArticles();
    super.onInit();
  }

  loadUser() {
    final localStorage = UseLocalStorage();
    user = jsonDecode(localStorage.readData('username'));
  }

  logout() async {
    final localStorage = UseLocalStorage();
    localStorage.clearAll();
    Get.offAllNamed(AppRoutes.login);
  }

  void loadArticles() async {
    final data = await DBHelper.getArticles();

    // Jika kosong, isi dummy dulu
    if (data.isEmpty) {
      await addDummyArticles();
    } else {
      articles.assignAll(data);
    }
  }

  Future<void> addDummyArticles() async {
    List<Article> dummy = [
      Article(
        title: '7 Kebiasaan Pagi yang Bikin Tubuh Lebih Sehat dan Produktif',
        description: 'Memulai hari dengan kebiasaan yang tepat dapat meningkatkan kesehatan dan produktivitas secara signifikan. Bangun lebih awal memberi waktu untuk menyiapkan diri tanpa tergesa-gesa, sementara minum air putih setelah bangun membantu tubuh rehidrasi. Olahraga ringan seperti stretching atau jalan pagi mampu meningkatkan energi dan mood. Sarapan bergizi memberi asupan yang dibutuhkan tubuh untuk beraktivitas, dan berjemur di bawah sinar matahari pagi membantu pembentukan vitamin D. Hindari langsung menatap layar ponsel agar otak tidak stres sejak pagi, dan menulis daftar rencana harian dapat membuat hari lebih terarah dan produktif.',
        imageUrl: 'assets/images/news/news1.jpg',
      ),
      Article(
        title: 'Kenali Tanda-Tanda Stres dan Cara Mengatasinya',
        description: 'Memulai hari dengan kebiasaan yang tepat dapat meningkatkan kesehatan dan produktivitas secara signifikan. Bangun lebih awal memberi waktu untuk menyiapkan diri tanpa tergesa-gesa, sementara minum air putih setelah bangun membantu tubuh rehidrasi. Olahraga ringan seperti stretching atau jalan pagi mampu meningkatkan energi dan mood. Sarapan bergizi memberi asupan yang dibutuhkan tubuh untuk beraktivitas, dan berjemur di bawah sinar matahari pagi membantu pembentukan vitamin D. Hindari langsung menatap layar ponsel agar otak tidak stres sejak pagi, dan menulis daftar rencana harian dapat membuat hari lebih terarah dan produktif.',
        imageUrl: 'assets/images/news/news2.jpg',
      ),
    ];
    for (var article in dummy) {
      await DBHelper.insertArticle(article);
    }
    loadArticles();
  }
}
