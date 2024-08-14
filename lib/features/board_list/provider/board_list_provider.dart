import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/base/provider/base_provider.dart';
import 'package:tic_tac_toe/core/constants/navigation/navigation_constants.dart';

class BoardListProvider extends BaseProvider {
  @override
  void init() {
    // TODO: implement init
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  void navigateToCreateBoardPage() {
    navigation.navigateToPage(path: NavigationConstants.CREATE_BOARD);
  }

  void navigateToGameBoard() {
    navigation.navigateToPage(path: NavigationConstants.GAME_BOARD);
  }
}
