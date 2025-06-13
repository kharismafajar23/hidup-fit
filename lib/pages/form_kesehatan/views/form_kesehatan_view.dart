import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

import '../controllers/form_kesehatan_controller.dart';

class FormKesehatanView extends GetView<FormKesehatanController> {
  const FormKesehatanView({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        children: [
          TitleApp().marginOnly(bottom: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Catat Data Kesehatan Secara Manual',
                style: MyTextStyles.headingText.copyWith(color: MyColors.primary),
                textAlign: TextAlign.center,
              ).marginOnly(bottom: 8),
              Text(
                'Masukkan data kesehatanmu secara mandiri untuk memantau kondisi tubuh setiap hari.',
                style: MyTextStyles.paragraphText.copyWith(fontSize: 15, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ).marginOnly(bottom: 20),
              TextField(
                controller: controller.tanggalController,
                readOnly: true,
                onTap: () => controller.selectDate(context),
                decoration: InputDecoration(
                  labelText: 'Tanggal & Waktu Input',
                  suffixIcon: Icon(
                    Icons.calendar_month_rounded,
                    color: MyColors.primary,
                  ),
                  errorText: !controller.validateTanggal.value ? controller.msgTanggal.value : null,
                ),
              ).marginOnly(bottom: 8),
              TextField(
                decoration: InputDecoration(labelText: 'Berat Badan (Kg)'),
                keyboardType: TextInputType.numberWithOptions(),
              ).marginOnly(bottom: 8),
              TextField(
                decoration: InputDecoration(labelText: 'Tekanan Darah (mmHg)'),
                keyboardType: TextInputType.text,
              ).marginOnly(bottom: 8),
              TextField(
                decoration: InputDecoration(labelText: 'Detak Jantung (bpm)'),
                keyboardType: TextInputType.numberWithOptions(),
              ).marginOnly(bottom: 8),
              TextField(
                decoration: InputDecoration(labelText: 'Tinggi Badan (Cm)'),
                keyboardType: TextInputType.numberWithOptions(),
              ).marginOnly(bottom: 8),
              TextField(
                decoration: InputDecoration(labelText: 'Suhu Tubuh (^C)'),
                keyboardType: TextInputType.numberWithOptions(),
              ).marginOnly(bottom: 8),
              TextField(
                decoration: InputDecoration(labelText: 'Jumlah Langkah/ Aktifitas Fisik'),
                keyboardType: TextInputType.numberWithOptions(),
              ).marginOnly(bottom: 8),
              SizedBox(
                height: 140,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(labelText: 'Catatan Tambahan'),
                  keyboardType: TextInputType.multiline,
                ).marginOnly(bottom: 16),
              ),
              SizedBox(
                width: MyDeviceUtils.getScreenWidth(context),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.statistikKesehatan);
                  },
                  child: Text('SIMPAN'),
                ),
              ).marginOnly(bottom: 20),
            ],
          )
        ],
      ),
    );
  }
}
