import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsHelper {
  /// Buka lokasi rumah sakit di Google Maps (pin)
  static Future<void> openMap(double latitude, double longitude, {String? label}) async {
    final Uri geoUri = Uri.parse("geo:$latitude,$longitude?q=$latitude,$longitude(${label ?? 'Lokasi'})");
    final Uri webUri = Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");

    if (!await _tryLaunch(geoUri)) {
      if (!await _tryLaunch(webUri)) {
        Get.snackbar(
          "Gagal",
          "Tidak bisa membuka Google Maps.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.shade400,
          colorText: Colors.white,
        );
      }
    }
  }

  /// Ambil lokasi pengguna (dengan permission)
  static Future<Position?> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
        "Layanan Lokasi Mati",
        "Aktifkan GPS untuk menggunakan fitur ini.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.orange.shade400,
        colorText: Colors.white,
      );
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar(
          "Izin Ditolak",
          "Aplikasi butuh izin lokasi untuk menavigasi.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.shade400,
          colorText: Colors.white,
        );
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        "Izin Lokasi Permanen Ditolak",
        "Atur izin lokasi di pengaturan HP.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade700,
        colorText: Colors.white,
        duration: Duration(seconds: 5),
      );
      return null;
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  /// Buka navigasi/rute dari posisi user ke rumah sakit
  static Future<void> openDirections({
    required double destinationLat,
    required double destinationLng,
  }) async {
    final Position? position = await _getCurrentLocation();
    if (position == null) return;

    final Uri uri = Uri.parse(
      "https://www.google.com/maps/dir/?api=1"
      "&origin=${position.latitude},${position.longitude}"
      "&destination=$destinationLat,$destinationLng"
      "&travelmode=driving",
    );

    if (!await _tryLaunch(uri)) {
      Get.snackbar(
        "Gagal",
        "Tidak bisa membuka navigasi Google Maps.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,
      );
    }
  }

  /// Helper untuk mencoba launch URL
  static Future<bool> _tryLaunch(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }
}
