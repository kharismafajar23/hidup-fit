import 'package:intl/intl.dart';

String formatTanggal(String isoString) {
  try {
    final date = DateTime.parse(isoString);
    return DateFormat('dd MMMM yyyy', 'id_ID').format(date);
  } catch (e) {
    print(e);
    return isoString;
  }
}
