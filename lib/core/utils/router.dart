import 'package:go_router/go_router.dart';
import 'package:tech_tak/features/booking_page/booking_router.dart';
import 'package:tech_tak/features/home_page/view/pages/home_page.dart';
import 'package:tech_tak/features/projects_page/projects_router.dart';

abstract class Rout {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),

    // ...HomeRouter.goRoutes,
    ...BookingRouter.goRoutes,
    ...ProjectsRouter.goRoutes
  ]);
}
