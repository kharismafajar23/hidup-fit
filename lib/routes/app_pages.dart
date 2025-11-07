import 'package:get/get.dart';
import 'package:hidup_fit/pages/article/bindings/article_binding.dart';
import 'package:hidup_fit/pages/article_detail/bindings/detail_article_binding.dart';
import 'package:hidup_fit/pages/article/views/article_views.dart';
import 'package:hidup_fit/pages/article_detail/views/detail_article_view.dart';
import 'package:hidup_fit/pages/form_kesehatan/bindings/form_kesehatan_binding.dart';
import 'package:hidup_fit/pages/form_kesehatan/views/form_kesehatan_view.dart';
import 'package:hidup_fit/pages/hasil/bindings/hasil_binding.dart';
import 'package:hidup_fit/pages/hasil/views/hasil_view.dart';
import 'package:hidup_fit/pages/home/bindings/home_binding.dart';
import 'package:hidup_fit/pages/home/views/home_view.dart';
import 'package:hidup_fit/pages/input_data/bindings/input_data_binding.dart';
import 'package:hidup_fit/pages/input_data/views/input_data_view.dart';
import 'package:hidup_fit/pages/konsultasi/bindings/konsultasi_binding.dart';
import 'package:hidup_fit/pages/konsultasi/views/konsultasi_view.dart';
import 'package:hidup_fit/pages/login/bindings/login_binding.dart';
import 'package:hidup_fit/pages/login/views/login_view.dart';
import 'package:hidup_fit/pages/navigation_menu/bindings/navigation_menu_binding.dart';
import 'package:hidup_fit/pages/navigation_menu/views/navigation_menu_view.dart';
import 'package:hidup_fit/pages/profile/bindings/edit_profile_binding.dart';
import 'package:hidup_fit/pages/profile/bindings/profile_binding.dart';
import 'package:hidup_fit/pages/profile/views/edit_profile_view.dart';
import 'package:hidup_fit/pages/profile/views/profile_view.dart';
import 'package:hidup_fit/pages/register/bindings/register_binding.dart';
import 'package:hidup_fit/pages/register/views/register_view.dart';
import 'package:hidup_fit/pages/riwayat_kesehatan/bindings/riwayat_kesehatan_binding.dart';
import 'package:hidup_fit/pages/riwayat_kesehatan/views/riwayat_kesehatan_view.dart';
import 'package:hidup_fit/pages/splash_screen/bindings/splash_screen_binding.dart';
import 'package:hidup_fit/pages/splash_screen/views/splash_screen_view.dart';
import 'package:hidup_fit/pages/statistik/bindings/statistik_bindings.dart';
import 'package:hidup_fit/pages/statistik/views/statistik_view.dart';
import 'package:hidup_fit/pages/target/bindings/target_binding.dart';
import 'package:hidup_fit/pages/target/views/target_view.dart';
import 'package:hidup_fit/pages/verifikasi_otp/bindings/verifikasi_otp_binding.dart';
import 'package:hidup_fit/pages/verifikasi_otp/views/verifikasi_otp_view.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.inputData,
      page: () => InputDataView(),
      binding: InputDataBinding(),
    ),
    GetPage(
      name: AppRoutes.formKesehatan,
      page: () => FormKesehatanView(),
      binding: FormKesehatanBinding(),
    ),
    GetPage(
      name: AppRoutes.statistikKesehatan,
      page: () => StatistikView(),
      binding: StatistikBindings(),
    ),
    GetPage(
      name: AppRoutes.riwayatKesehatan,
      page: () => RiwayatKesehatanView(),
      binding: RiwayatKesehatanBinding(),
    ),
    GetPage(
      name: AppRoutes.target,
      page: () => TargetView(),
      binding: TargetBinding(),
    ),
    GetPage(
      name: AppRoutes.hasil,
      page: () => HasilView(),
      binding: HasilBinding(),
    ),
    GetPage(
      name: AppRoutes.konsultasi,
      page: () => KonsultasiView(),
      binding: KonsultasiBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.article,
      page: () => ArticleViews(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: AppRoutes.articleDetail,
      page: () => DetailArticleView(),
      binding: DetailArticleBinding(),
    ),
    GetPage(
      name: AppRoutes.verifikasiOTP,
      page: () => VerifikasiOtpView(),
      binding: VerifikasiOTPBinding(),
    ),
    GetPage(
      name: AppRoutes.bottomNavigationMenu,
      page: () => NavigationMenuView(),
      binding: NavigationMenuBinding(),
    ),
  ];
}
