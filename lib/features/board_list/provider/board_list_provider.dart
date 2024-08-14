import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/base/provider/base_provider.dart';
import 'package:tic_tac_toe/core/constants/navigation/navigation_constants.dart';

class BoardListProvider extends BaseProvider {
  @override
  void init() async {
    // TODO: implement init
    await getBoards();
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  List<Map<String, dynamic>> _boards = [];
  List<Map<String, dynamic>> get boards => _boards;

  Future getBoards() async {
    _boards = await firebaseService.getDataFromCollection('boards');
    print("🚀 ~ BoardListProvider ~ FuturegetBoards ~ _boards:" + _boards.toString());
    notifyListeners();
  }

  void navigateToCreateBoardPage() {
    navigation.navigateToPage(path: NavigationConstants.CREATE_BOARD);
  }

  void navigateToGameBoard() {
    navigation.navigateToPage(path: NavigationConstants.GAME_BOARD);
  }
}
