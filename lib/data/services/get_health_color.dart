import 'package:flutter/material.dart';

Color getHealthColor(String category, String value) {
  value = value.toLowerCase();

  switch (category) {
    case 'kondisi_kesehatan':
      if (value == 'sehat') return Colors.green;
      if (value == 'tidak sehat') return Colors.orange;
      break;

    case 'berat_badan':
      if (value == 'ideal') return Colors.green;
      if (value == 'kurus') return Colors.blue;
      if (value == 'gemuk') return Colors.orangeAccent;
      if (value == 'obesitas') return Colors.red;
      break;

    case 'tekanan_darah':
      if (value == 'normal') return Colors.green;
      if (value == 'rendah') return Colors.orangeAccent;
      if (value == 'tinggi') return Colors.red;
      break;

    case 'detak_jantung':
      if (value == 'sedang') return Colors.green;
      if (value == 'lambat') return Colors.orangeAccent;
      if (value == 'cepat') return Colors.red;
      break;

    case 'tinggi_badan':
      if (value == 'tinggi') return Colors.green;
      if (value == 'pendek') return Colors.orange;
      break;

    case 'aktivitas_harian':
      if (value.contains('baik') || value.contains('aktif')) return Colors.green;
      if (value.contains('rendah')) return Colors.orange;
      break;

    default:
      return Colors.grey;
  }

  return Colors.grey;
}
