int hitungUsia(String tanggalLahir) {
  try {
    final birthDate = DateTime.parse(tanggalLahir);
    final today = DateTime.now();

    int usia = today.year - birthDate.year;

    // Kalau belum ulang tahun di tahun ini, kurangi 1
    if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
      usia--;
    }

    return usia;
  } catch (e) {
    // Jika tanggal lahir tidak valid
    return 0;
  }
}
