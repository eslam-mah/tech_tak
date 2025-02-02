import 'package:go_router/go_router.dart';
import 'package:tech_tak/features/about_us/view/about_us_page.dart';

abstract class AboutUsRouter {
  static final List<GoRoute> goRoutes = [
    GoRoute(
        path: AboutUsPage.routeName,
        builder: (context, state) {
          return const AboutUsPage();
        }),
  ];
}
