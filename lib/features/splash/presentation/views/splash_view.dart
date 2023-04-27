import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie/core/utils/service_locator.dart';
import 'package:the_movie/features/home/presentation/views/home_view.dart';

import '../../../../core/utils/api_services.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  static const rn = '/';
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => setUp());
  }

  void setUp() async {
    // i inisialize dio here and i could make this step also in main
    await ServiveLocator.setUp();
    ApiServices.initializeDio();

    GoRouter.of(context).push(HomeView.rn);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SplashViewBody(),
      ),
    );
  }
}
