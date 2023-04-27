import 'package:go_router/go_router.dart';
import 'package:the_movie/features/splash/presentation/views/splash_view.dart';

import '../../features/home/presentation/views/home_view.dart';

class AppRouter {
  static GoRouter get getRouter {
    return _router;
  }

  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.rn,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.rn,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
