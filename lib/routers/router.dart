import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/di/dependency_injection.dart';
import 'package:test_app/features/cubit/home_cubit.dart';
import 'package:test_app/features/pages/authent/cubit/auth_cubit.dart';
import 'package:test_app/features/pages/home/cart/cart_screen.dart';
import 'package:test_app/features/pages/home/home_page.dart';
import 'package:test_app/features/pages/home/profile/profile_page.dart';
import 'package:test_app/features/pages/authent/login_page.dart';
import 'package:test_app/features/pages/authent/register_page.dart';
import 'package:test_app/features/pages/splash/splash_screen.dart';

class Routers {
  static const String splashPage = '/';
  static const String homePage = '/homePage';
  static const String cart = '/cart';
  static const String loginPage = '/login-page';
  static const String registerPage = '/register-page';
  static const String profilePage = '/profile-page';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case homePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: getIt<HomeCubit>(),
                  child: const HomePage(),
                ));
      case cart:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: getIt<HomeCubit>(),
                  child: const CartScreen(),
                ));
      case loginPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: getIt.get<AuthCubit>(),
                  child: const LoginPage(),
                ));

      case registerPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: getIt.get<AuthCubit>(),
                  child: const RegisterPage(),
                ));
      case profilePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: getIt.get<AuthCubit>(),
                  child: const ProfilePage(),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text(
                          'Không có tuyến đường nào được xác định cho ${settings.name}')),
                ));
    }
  }
}
