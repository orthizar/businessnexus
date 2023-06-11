import 'package:businessnexus/bindings/business_dashboard_bindings.dart';
import 'package:businessnexus/bindings/create_business_bindings.dart';
import 'package:businessnexus/bindings/overview_bindings.dart';
import 'package:businessnexus/screens/business_dashboard.dart';
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
      name: Routes.businessDashboard,
      page: () => BusinessDashboardScreen(),
      binding: BusinessDashboardBinding(),
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
  static const settings = '/settings';
  static const createBusiness = '/create_business';
  static const businessDashboard = '/business_dashboard';
  static const businessFinances = '/business_finances';
  static const businessEmployees = '/business_employees';
  static const businessInventory = '/business_inventory';
  static const businessProduction = '/business_production';
  static const businessSales = '/business_sales';
}
