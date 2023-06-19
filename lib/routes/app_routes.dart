import 'package:businessnexus/bindings/business_dashboard_bindings.dart';
import 'package:businessnexus/bindings/business_finances_submodule_bindings.dart';
import 'package:businessnexus/bindings/create_business_bindings.dart';
import 'package:businessnexus/bindings/overview_bindings.dart';
import 'package:businessnexus/screens/business_dashboard.dart';
import 'package:businessnexus/screens/create_business_screen.dart';
import 'package:businessnexus/screens/modules/business_finances_screen.dart';
import 'package:businessnexus/screens/modules/business_finances_submodule_screen.dart';
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
      page: () => const BusinessDashboardScreen(),
      binding: BusinessDashboardBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsScreen(),
      transition: Transition.noTransition,
    ),
    // routes for modules
    GetPage(
      name: Routes.businessFinances,
      page: () => const BusinessFinancesScreen(),
      binding: BusinessDashboardBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.businessFinancesSubmodule,
      page: () => const BusinessFinancesSubmoduleScreen(),
      binding: BusinessFinancesSubmoduleBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.businessEmployees,
      page: () => const BusinessDashboardScreen(),
      binding: BusinessDashboardBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.businessInventory,
      page: () => const BusinessDashboardScreen(),
      binding: BusinessDashboardBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.businessProduction,
      page: () => const BusinessDashboardScreen(),
      binding: BusinessDashboardBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.businessSales,
      page: () => const BusinessDashboardScreen(),
      binding: BusinessDashboardBinding(),
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
  static const businessFinancesSubmodule = '/business_finances_submodule';
  static const businessEmployees = '/business_employees';
  static const businessInventory = '/business_inventory';
  static const businessProduction = '/business_production';
  static const businessSales = '/business_sales';

  static const billDetails = '/bill_details';
}
