import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/data/models/article.dart';
import 'package:hidup_fit/data/models/rumahSakit.dart';
import 'package:hidup_fit/data/services/db_helper.dart';
import 'package:hidup_fit/data/services/hitung_usia.dart';
import 'package:hidup_fit/pages/article/views/article_views.dart';
import 'package:hidup_fit/pages/home/views/home_view.dart';
import 'package:hidup_fit/pages/input_data/views/input_data_view.dart';
import 'package:hidup_fit/pages/konsultasi/views/konsultasi_view.dart';
import 'package:hidup_fit/pages/profile/views/profile_view.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/local_storage/storage_utility.dart';

class NavigationMenuController extends GetxController {
  RxInt selectedIndex = 0.obs;
  var user = {}.obs;
  RxBool dataKesehatan = false.obs;
  var articles = <Article>[].obs;
  var rumahSakit = <RumahSakit>[].obs;

  final List<Widget> pages = const [
    HomeView(),
    InputDataView(),
    KonsultasiView(),
    ArticleViews(),
    ProfileView(),
  ];

  @override
  void onInit() {
    loadUser();
    loadArticles();
    loadRumahSakit();
    cekDataKesehatan();
    super.onInit();
  }

  loadUser() {
    final localStorage = UseLocalStorage();
    final userData = localStorage.readData('username');

    if (userData != null) {
      final decoded = jsonDecode(userData);
      final umur = hitungUsia(decoded['tanggal_lahir'] ?? '');
      decoded['usia'] = umur.toString();

      user.value = decoded;
    } else {
      user.value = {};
    }
  }

  logout() async {
    final localStorage = UseLocalStorage();
    localStorage.clearAll();
    Get.offAllNamed(AppRoutes.login);
  }

  void loadArticles() async {
    var data = await DBHelper.getArticles();

    if (data.isEmpty) {
      await addDummyArticles();
      data = await DBHelper.getArticles();
    }

    articles.assignAll(data);
  }

  void loadRumahSakit() async {
    final dataRumahSakit = await DBHelper.getRumahSakit();

    // jika kosong isi data rumah sakit terlebih dahulu
    if (dataRumahSakit.isEmpty) {
      await addDummyRumahSakit();
    } else {
      rumahSakit.assignAll(dataRumahSakit);
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
        description: 'Stres adalah reaksi alami tubuh ketika menghadapi tekanan atau tuntutan, baik dari pekerjaan, hubungan, maupun masalah pribadi. Meski wajar, stres yang tidak dikelola dengan baik dapat berdampak negatif pada kesehatan fisik maupun mental. Beberapa tanda yang sering muncul antara lain sakit kepala, otot tegang, sulit tidur, dan mudah lelah. Dari sisi emosional, stres dapat membuat seseorang menjadi mudah marah, cemas berlebihan, serta merasa gelisah. Sementara itu, dari perilaku biasanya tampak seperti menarik diri dari lingkungan sosial, sulit berkonsentrasi, atau mengalami perubahan pola makan. Untuk mengatasi stres, ada beberapa langkah yang bisa dilakukan. Latihan pernapasan dalam, meditasi, atau yoga dapat membantu menenangkan pikiran. Aktivitas fisik seperti olahraga teratur juga efektif karena mampu memicu keluarnya hormon endorfin yang memberikan rasa tenang. Selain itu, mengatur waktu dengan baik, beristirahat cukup, serta berbagi cerita kepada orang yang dipercaya bisa meringankan beban mental. Dengan mengenali tanda-tanda stres sejak dini dan mengambil langkah tepat untuk mengelolanya, kita dapat menjaga keseimbangan hidup sekaligus meningkatkan kualitas kesehatan secara keseluruhan.',
        imageUrl: 'assets/images/news/news2.jpg',
      ),
      Article(
        title: 'Menjaga Kesehatan di Era Modern dengan Pola Makan Sehat',
        description: 'Di tengah gaya hidup modern yang serba cepat dan penuh tekanan, menjaga kesehatan menjadi sebuah tantangan. Salah satu langkah paling efektif untuk merawat tubuh dan pikiran adalah melalui pola makan hidup sehat. Pola makan yang baik bukan hanya soal memilih makanan bergizi, tetapi juga tentang kesadaran, konsistensi, dan keseimbangan dalam asupan harian. Pola makan hidup sehat adalah investasi jangka panjang untuk kualitas hidup yang lebih baik. Menerapkannya tidak harus drastis — mulailah dengan perubahan kecil yang konsisten. Ingat, tubuh kita mencerminkan apa yang kita konsumsi setiap hari. Jadi, mari pilih makanan yang menyehatkan, bukan hanya yang memuaskan lidah sesaat.',
        imageUrl: 'assets/images/news/news3.jpg',
      ),
    ];
    for (var article in dummy) {
      await DBHelper.insertArticle(article);
    }
  }

  Future<void> addDummyRumahSakit() async {
    List<RumahSakit> data = [
      RumahSakit(
        nama: "RSUD Yogyakarta",
        alamat: "Jl. Ki Ageng Pemanahan No.1-6, Sorosutan, Kec. Umbulharjo, Kota Yogyakarta, Daerah Istimewa Yogyakarta",
        latitude: -7.824936105382004,
        longitude: 110.3779528276621,
        kontak: "(0274) 371195",
        gambar: "assets/images/rumah-sakit/rsud-yogyakarta.jpg",
      ),
      RumahSakit(
        nama: "RSI Hidayatullah",
        alamat: "Jl. Veteran No.184, Pandeyan, Kec. Umbulharjo, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55161",
        latitude: -7.815191312823026,
        longitude: 110.38776592580905,
        kontak: "(0274) 389194",
        gambar: "assets/images/rumah-sakit/rsi-hidayatullah.jpg",
      ),
      RumahSakit(
        nama: "RS Pratama Kota Yogyakarta",
        alamat: "Jl. Kolonel Sugiyono No.98, Brontokusuman, Kec. Mergangsan, Kota Yogyakarta, Daerah Istimewa Yogyakarta",
        latitude: -7.815366550302911,
        longitude: 110.37392725464517,
        kontak: "(0274) 373249",
        gambar: "assets/images/rumah-sakit/rs-pratama.jpg",
      ),
    ];
    for (var item in data) {
      await DBHelper.insertRumahSakit(item);
    }
    loadRumahSakit();
  }

  void cekDataKesehatan() async {
    final localStorage = UseLocalStorage();
    var rawData = localStorage.readData('dataKesehatan');
    if (rawData != null) {
      dataKesehatan.value = true;
    } else {
      dataKesehatan.value = false;
    }
  }
}
