import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hidup_fit/routes/app_pages.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/theme/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  OpenAI.apiKey = dotenv.env['OPENAI_API_KEY'] ?? '';
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MyAppTheme.lightTheme,
      // darkTheme: MyAppTheme.darkTheme, // Aktifkan jika ingin menggunakan mode malam,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.pages,
    );
  }
}
