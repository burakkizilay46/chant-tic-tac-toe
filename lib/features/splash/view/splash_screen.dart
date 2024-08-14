import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/base/view/base_view.dart';
import 'package:tic_tac_toe/features/splash/provider/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashProvider>(
      provider: SplashProvider(),
      onProviderReady: (SplashProvider provider) {
        provider.setContext(context);
        provider.init();
      },
      onPageBuilder: (SplashProvider provider) => const Scaffold(
        body: Center(
          child: Text('Welcome tic tac toe'),
        ),
      ),
    );
  }
}
