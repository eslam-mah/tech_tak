import 'package:go_router/go_router.dart';
import 'package:tech_tak/features/projects_page/view/views/projects_page.dart';

abstract class ProjectsRouter {
  static final List<GoRoute> goRoutes = [
    GoRoute(
        path: ProjectsPage.routeName,
        builder: (context, state) {
          return const ProjectsPage();
        }),
  ];
}
