import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/init/app_state/app_state.dart';
import 'package:tic_tac_toe/core/init/navigation/navigation_service.dart';

abstract class BaseProvider extends ChangeNotifier {
  BuildContext? context;

  NavigationService navigation = NavigationService.instance;
  AppStateManager appStateManager = AppStateManager.instance;
  void setContext(BuildContext context);
  void init();
}
