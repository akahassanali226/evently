import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/source/local/prefs_manager.dart';
import 'package:evently/core/utils/app_style.dart';
import 'package:evently/core/utils/route_manager.dart';
import 'package:evently/features/feed/presentation/view/feed_view.dart';
import 'package:evently/features/home/presentation/view/home_view.dart';
import 'package:evently/features/login/presentation/view/login_view.dart';
import 'package:evently/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:evently/features/register/presentation/view/register_view.dart';
import 'package:evently/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  await PrefsManager.init();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      startLocale: Locale("en"),
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider()..init(),
        child: const Evently(),
      ),
    ),
  );
}

class Evently extends StatelessWidget {
  const Evently({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppStyle.lightTheme,
      darkTheme: AppStyle.darkTheme,
      themeMode: provider.mode,
      initialRoute: RouteManager.splashRoute,
      routes: {
        RouteManager.homeRoute: (_) => HomeView(),
        RouteManager.splashRoute: (_) => SplashView(),
        RouteManager.loginRoute: (_) => LoginView(),
        RouteManager.registerRoute: (_) => RegisterView(),
        RouteManager.feedRoute: (_) => FeedView(),
        RouteManager.onboardingRoute: (_) => OnboardingView(),
      },
    );
  }
}
