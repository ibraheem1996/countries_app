import 'dart:async';
import 'dart:ui';

import 'package:countries/coor/theme/theme_cubit.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'coor/dependency/dependency_get_it.dart';
import 'coor/theme/dark_theme/app_dark_theme.dart';
import 'coor/theme/light_theme/app_light_theme.dart';
import 'features/home/logic/home_cubit.dart';
import 'features/home/ui/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await setupGetIt();
      await Firebase.initializeApp();

      final crashlytics = FirebaseCrashlytics.instance;
      final analytics = FirebaseAnalytics.instance;
      final remoteConfig = FirebaseRemoteConfig.instance;
      final performance = FirebasePerformance.instance;

      FlutterError.onError = (FlutterErrorDetails details) {
        crashlytics.recordFlutterFatalError(details);
      };

      PlatformDispatcher.instance.onError = (error, stack) {
        crashlytics.recordError(error, stack, fatal: true);
        return true;
      };

      await performance.setPerformanceCollectionEnabled(true);

      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(minutes: 1),
        ),
      );
        
       unawaited(remoteConfig.fetchAndActivate());


      runApp(BlocProvider(create: (context) => ThemeCubit(), child: const MyApp()));
    },
    (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          theme: AppLightTheme.lightTheme,
          darkTheme: AppDarkTheme.darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          home: BlocProvider(create: (_) => getIt<HomeCubit>(), child: const HomePage()),
        );
      },
    );
  }
}
