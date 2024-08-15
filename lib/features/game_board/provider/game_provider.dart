import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/base/provider/base_provider.dart';
import 'package:tic_tac_toe/core/init/app_state/app_state.dart';

class GameProvider extends BaseProvider {
  late Map<String, dynamic>? _board;
  Map<String, dynamic> get board => _board!;

  bool _haveOPlayer = false;
  bool get haveOPlayer => _haveOPlayer;

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {}

  void joinGame() {
    String user = appStateManager.currentUser;
    _board!['players'].add(user);
    firebaseService.updateDocument('boards', _board!['documentId'], _board!);
    _haveOPlayer = true;
    notifyListeners();
  }

  void initBoard(Map<String, dynamic> selectedBoard) {
    _board = selectedBoard;
    notifyListeners();
    if (selectedBoard['players'].length == 2) {
      _haveOPlayer = true;
    } else {
      print(selectedBoard['players'].contains(appStateManager.currentUser.toString()));
      if (selectedBoard['players'].contains(appStateManager.currentUser.toString())) {
        _haveOPlayer = true;
        notifyListeners();
      } else {
        _haveOPlayer = false;
        notifyListeners();
      }
    }
  }

  void tapTile(int index, bool isXTurn) {
    _board!['board'][index] = isXTurn ? 'X' : 'O';
    firebaseService.updateDocument('boards', _board!['documentId'].toString(), _board!);
    notifyListeners();
  }
}
