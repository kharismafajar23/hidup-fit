import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/doctor_card.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/pages/navigation_menu/controllers/navigation_menu_controller.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

class KonsultasiView extends GetView<NavigationMenuController> {
  const KonsultasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleApp().marginOnly(bottom: 20),
          Text(
            'Daftar Dokter Tersedia',
            textAlign: TextAlign.center,
            style: MyTextStyles.headingText,
          ).marginOnly(bottom: 16),
          DoctorCard(
            nama: 'dr. Anisa Rahmawati, Sp.KJ',
            spealisasi: 'Psikiater (Jiwa)',
            pengalaman: '8 Tahun',
            rating: '4.9 (1.200 ulasan)',
            status: 'Online Sekarang',
            linkImage: 'assets/images/doctors/doctor1.jpg',
          ).marginOnly(bottom: 8),
          DoctorCard(
            nama: 'dr. Bima Prasetyo, Sp.PD',
            spealisasi: 'Penyakit Dalam',
            pengalaman: '10 Tahun',
            rating: '4.7 (980 ulasan)',
            status: 'Offline',
            linkImage: 'assets/images/doctors/doctor2.jpg',
          ).marginOnly(bottom: 8),
          DoctorCard(
            nama: 'dr. Maria Natalia, M.Gizi',
            spealisasi: 'Gizi Klinik',
            pengalaman: '6 Tahun',
            rating: '4.8 (1.050 ulasan)',
            status: 'Online Sekarang',
            linkImage: 'assets/images/doctors/doctor3.jpg',
          ),
        ],
      ),
    );
  }
}
