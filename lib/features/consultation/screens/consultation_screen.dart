import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/doctor_card.dart';
import 'package:hidup_fit/utils/constant/image_strings.dart';
import 'package:hidup_fit/utils/constant/text_strings.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/custom_themes/text_styles.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: CustomDeviceUtils.getScreenHeight() - MediaQuery.of(context).padding.top,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        CustomImages.appLogo,
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      ).marginOnly(right: 12),
                      Text(
                        CustomTexts.appName,
                        style: CustomTextStyles.headingText,
                      )
                    ],
                  ).marginOnly(bottom: 24),
                  Text(
                    'Daftar Dokter Tersedia',
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.headingText,
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
            ),
          ),
        ),
      ),
    );
  }
}
