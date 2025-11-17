import 'package:flutter/material.dart';

Color getHealthColor(String category, String value, {Map<String, String>? allValues}) {
  value = value.toLowerCase();

  // 1️⃣ Jika kategori bukan 'kondisi_kesehatan', kembalikan warna seperti biasa
  if (category != 'kondisi_kesehatan') {
    switch (category) {
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

      case 'suhu_tubuh':
        if (value == 'normal') return Colors.green;
        if (value == 'rendah') return Colors.orangeAccent;
        if (value == 'tinggi') return Colors.red;
        break;

      case 'langkah':
        if (value == 'cukup') return Colors.green;
        if (value == 'lebih') return Colors.orangeAccent;
        if (value == 'kurang') return Colors.red;
        break;

      case 'laju_pernafasan':
        if (value == 'normal') return Colors.green;
        if (value == 'lambat') return Colors.orangeAccent;
        if (value == 'cepat') return Colors.red;
        break;
    }

    return Colors.grey;
  }

  // 2️⃣ Jika kategori adalah 'kondisi_kesehatan', hitung berdasarkan allValues
  if (allValues != null) {
    int hijau = 0;
    int kuning = 0;
    int merah = 0;

    // ambil warna tiap kategori utama
    final kategoriUtama = [
      'berat_badan',
      'tekanan_darah',
      'detak_jantung'
    ];

    for (var key in kategoriUtama) {
      final val = allValues[key]?.toLowerCase() ?? '';
      final color = getHealthColor(key, val);

      if (color == Colors.green) hijau++;
      if (color == Colors.orangeAccent || color == Colors.orange) kuning++;
      if (color == Colors.red) merah++;
    }

    // logika penentuan kondisi keseluruhan
    if (hijau == 3) {
      return Colors.green; // semua baik → sehat
    } else if (merah >= 2) {
      return Colors.red; // dua atau lebih merah → tidak sehat
    } else if (kuning > 0 || merah >= 1) {
      return Colors.amber; // ada yang kuning → cukup sehat
    }
  }

  return Colors.grey;
}

/// Fungsi tambahan untuk mendapatkan teks kondisi kesehatan
String getKondisiKesehatan(Map<String, String> allValues) {
  int hijau = 0;
  int kuning = 0;
  int merah = 0;

  final kategoriUtama = [
    'berat_badan',
    'tekanan_darah',
    'detak_jantung'
  ];

  for (var key in kategoriUtama) {
    final val = allValues[key]?.toLowerCase() ?? '';
    final color = getHealthColor(key, val);

    if (color == Colors.green) hijau++;
    if (color == Colors.orangeAccent || color == Colors.orange) kuning++;
    if (color == Colors.red) merah++;
  }

  if (hijau == 3) {
    return 'Sehat';
  } else if (merah >= 2) {
    return 'Tidak Sehat';
  } else if (kuning > 0 || merah >= 1) {
    return 'Cukup Sehat';
  }

  return 'Tidak Diketahui';
}
