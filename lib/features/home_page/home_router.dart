import 'package:go_router/go_router.dart';
import 'package:tech_tak/features/home_page/view/pages/home_page.dart';

abstract class HomeRouter {
  static final List<GoRoute> goRoutes = [
    GoRoute(
        path: HomePage.routeName,
        builder: (context, state) {
          return const HomePage();
        }),
  ];
}
