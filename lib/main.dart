import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hidup_fit/routes/app_pages.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/theme/theme.dart';

void main() async {
  await GetStorage.init();
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
