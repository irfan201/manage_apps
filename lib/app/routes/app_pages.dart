import 'package:get/get.dart';

import '../modules/create_target/bindings/create_target_binding.dart';
import '../modules/create_target/views/create_target_view.dart';
import '../modules/detail_target/bindings/detail_target_binding.dart';
import '../modules/detail_target/views/detail_target_view.dart';
import '../modules/edit_target/bindings/edit_target_binding.dart';
import '../modules/edit_target/views/edit_target_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profil_bisnis/bindings/profil_bisnis_binding.dart';
import '../modules/profil_bisnis/views/profil_bisnis_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TARGET,
      page: () =>  DetailTargetView(),
      binding: DetailTargetBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_TARGET,
      page: () => CreateTargetView(),
      binding: CreateTargetBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL_BISNIS,
      page: () => const ProfilBisnisView(),
      binding: ProfilBisnisBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_TARGET,
      page: () =>  EditTargetView(),
      binding: EditTargetBinding(),
    ),
  ];
}
