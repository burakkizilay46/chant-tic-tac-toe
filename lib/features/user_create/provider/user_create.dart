import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/base/provider/base_provider.dart';
import 'package:tic_tac_toe/core/constants/navigation/navigation_constants.dart';

class UserCreateProvider extends BaseProvider {
  @override
  void init() {
    // TODO: implement init
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  void createUser(String username) {}

  Future<void> navigateToBoardsScreen() async {
    await navigation.navigateToPageClear(path: NavigationConstants.BOARD_LIST);
  }
}
