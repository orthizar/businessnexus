import 'package:businessnexus/bindings/create_business_bindings.dart';
import 'package:businessnexus/bindings/overview_bindings.dart';
import 'package:businessnexus/screens/business_details_screen.dart';
import 'package:businessnexus/screens/create_business_screen.dart';
import 'package:businessnexus/screens/overview_screen.dart';
import 'package:businessnexus/screens/settings_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = Routes.overview;

  static final routes = [
    GetPage(
      name: Routes.overview,
      page: () => OverviewScreen(),
      binding: OverviewBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.createBusiness,
      page: () => const CreateBusinessScreen(),
      binding: CreateBusinessBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.businessDetails,
      page: () => const BusinessDetailsScreen(),
      binding: CreateBusinessBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsScreen(),
      transition: Transition.noTransition,
    ),
  ];
}

class Routes {
  static const overview = '/overview';
  static const createBusiness = '/create_business';
  static const businessDetails = '/business_details';
  static const settings = '/settings';
}
