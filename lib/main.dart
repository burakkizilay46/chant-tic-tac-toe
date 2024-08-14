import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/init/navigation/navigation_routes.dart';
import 'package:tic_tac_toe/core/init/navigation/navigation_service.dart';
import 'package:tic_tac_toe/features/splash/provider/splash_provider.dart';
import 'package:tic_tac_toe/features/splash/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SplashProvider>(create: (context) => SplashProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
