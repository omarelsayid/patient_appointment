import 'package:flutter/material.dart';
import 'package:patient_appointment/core/routes/pages_route.dart';
import 'package:patient_appointment/features/home/presentation/view/home_view.dart';
import 'package:patient_appointment/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:patient_appointment/features/splash/presentation/view/splash_view.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.onBoardingView:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case PagesRoutes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case PagesRoutes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Un defined route"),
            centerTitle: true,
          ),
          body: const Center(child: Text("Un defined route")),
        );
      },
    );
  }
}
