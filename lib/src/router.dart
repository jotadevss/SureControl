import 'package:elevo/src/core/atoms/transaction_atoms.dart';
import 'package:elevo/src/ui/deleted/deleted_page.dart';
import 'package:elevo/src/ui/empty/empty_page.dart';
import 'package:elevo/src/ui/error/error_page.dart';
import 'package:elevo/src/ui/home/home_page.dart';
import 'package:elevo/src/ui/splash/splash_page.dart';
import 'package:elevo/src/ui/success/success_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  redirect: (context, state) {
    if (isEmptyTransactionState.value) {
      return AppRouter.EMPTY_PAGE_ROUTER;
    }
    return null;
  },
  routes: [
    GoRoute(
      path: AppRouter.SPLASH_PAGE_ROUTER,
      builder: (context, state) {
        return SplashPage();
      },
    ),
    GoRoute(
      path: AppRouter.HOME_PAGE_ROUTER,
      builder: (context, state) {
        return HomePage();
      },
    ),
    GoRoute(
      path: AppRouter.EMPTY_PAGE_ROUTER,
      builder: (context, state) {
        return SuccessPage();
      },
    ),
    GoRoute(
      path: AppRouter.DELETED_PAGE_ROUTER,
      builder: (context, state) {
        return DeletedPage();
      },
    ),
  ],
);

class AppRouter {
  static const String SPLASH_PAGE_ROUTER = '/';
  static const String EMPTY_PAGE_ROUTER = '/empty';
  static const String HOME_PAGE_ROUTER = '/home';
  static const String DELETED_PAGE_ROUTER = '/deleted';
  static const String ERROR_PAGE_ROUTER = '/error';
  static const String INPUT_SUCCESS_PAGE_ROUTER = '/input-success';
}
