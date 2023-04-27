import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/core/utils/app_router.dart';
import 'package:the_movie/simple_bloc_observer.dart';

import 'core/constants.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const TheMovie());
}

class TheMovie extends StatelessWidget {
  const TheMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.getRouter,
      title: 'The movie',
      theme: darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
