import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/init/navigation/navigation_routes.dart';
import 'package:tic_tac_toe/core/init/navigation/navigation_service.dart';
import 'package:tic_tac_toe/features/splash/provider/splash_provider.dart';
import 'package:tic_tac_toe/features/splash/view/splash_screen.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
