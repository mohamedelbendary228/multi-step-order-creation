import 'package:baridx_order_creation/features/order_steps_flow/presentation/pages/customer_info_page.dart';
import 'package:baridx_order_creation/features/home/presentation/pages/home_page.dart';
import 'package:baridx_order_creation/features/order_steps_flow/presentation/pages/package_details_page.dart';
import 'package:baridx_order_creation/routes/routes.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: Routes.customerInfo,
      builder: (context, state) => const CustomerInfoPage(),
    ),
    GoRoute(
      path: Routes.packageDetails,
      builder: (context, state) => const PackageDetailsPage(),
    ),
  ],
);
