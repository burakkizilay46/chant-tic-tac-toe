import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/base/provider/base_provider.dart';

class GameProvider extends BaseProvider {
  late Map<String, dynamic>? _board;
  Map<String, dynamic> get board => _board!;

  bool _haveOPlayer = false;
  bool get haveOPlayer => _haveOPlayer;

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {}

  void joinGame() async {
    String user = appStateManager.currentUser;
    _board!['players'].add(user);
    await firebaseService.updateDocument('boards', _board!['documentId'], _board!);
    _haveOPlayer = true;
    notifyListeners();
  }

  void initBoard(Map<String, dynamic> selectedBoard) {
    if (selectedBoard['players'].length == 2) {
      _haveOPlayer = true;
    } else {
      if (selectedBoard['players'].contains(appStateManager.currentUser.toString())) {
        _haveOPlayer = false;
      } else {
        _haveOPlayer = true;
      }
    }

    _board = selectedBoard;
    notifyListeners();
  }

  bool isMyTurn() {
    String currentTurnPlayer = _board!['turn'];
    return currentTurnPlayer == appStateManager.currentUser.toString();
  }

  Future<void> onTileTap(int index) async {
    if (isMyTurn() && _board!['tiles'][index] == '') {
      _board!['tiles'][index] = _getCurrentPlayerSymbol();
      _changeTurn();

      await firebaseService.updateDocument('boards', _board!['documentId'], _board!);
      initBoard(_board!);
      notifyListeners();
    }
  }

  String _getCurrentPlayerSymbol() {
    return _board!['players'][0] == appStateManager.currentUser.toString() ? 'X' : 'O';
  }

  void _changeTurn() {
    if (_board!['turn'] == _board!['players'][0]) {
      _board!['turn'] = _board!['players'][1];
    } else {
      _board!['turn'] = _board!['players'][0];
    }
  }
}
