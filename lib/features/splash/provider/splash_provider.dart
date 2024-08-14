import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/base/provider/base_provider.dart';
import 'package:tic_tac_toe/core/constants/navigation/navigation_constants.dart';

class SplashProvider extends BaseProvider {
  @override
  void init() async {
    await Future.delayed(const Duration(seconds: 2));
    navigateToCreate();
  }

  @override
  void setContext(BuildContext context) {}

  Future<void> navigateToCreate() async {
    await navigation.navigateToPageClear(path: NavigationConstants.BOARD_LIST);
  }
}
