import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/features/start_page/screens/start_page.dart';
import 'package:hidup_fit/utils/theme/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: CustomAppTheme.lightTheme,
      // darkTheme: CustomAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const StartPage(),
    );
  }
}
