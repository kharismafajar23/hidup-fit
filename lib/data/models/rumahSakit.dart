class RumahSakit {
  final int? id;
  final String nama;
  final String alamat;
  final String? gambar;
  final double latitude;
  final double longitude;
  final String kontak;

  RumahSakit({
    this.id,
    required this.nama,
    required this.alamat,
    this.gambar,
    required this.latitude,
    required this.longitude,
    required this.kontak,
  });

  factory RumahSakit.fromMap(Map<String, dynamic> map) {
    return RumahSakit(
      id: map['id'],
      nama: map['nama'],
      alamat: map['alamat'],
      gambar: map['gambar'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      kontak: map['kontak'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'alamat': alamat,
      'gambar': gambar,
      'latitude': latitude,
      'longitude': longitude,
      'kontak': kontak,
    };
  }
}
