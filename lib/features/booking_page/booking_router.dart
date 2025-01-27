import 'package:go_router/go_router.dart';
import 'package:tech_tak/features/booking_page/view/pages/booking_page.dart';
import 'package:tech_tak/features/booking_page/view/pages/form_submitted_page.dart';

abstract class BookingRouter {
  static final List<GoRoute> goRoutes = [
    GoRoute(
        path: BookingPage.routeName,
        builder: (context, state) {
          return const BookingPage();
        }),
    GoRoute(
        path: FormSubmittedPage.routeName,
        builder: (context, state) {
          return const FormSubmittedPage();
        }),
  ];
}
