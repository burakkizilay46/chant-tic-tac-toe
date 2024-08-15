import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/base/provider/base_provider.dart';

class GameProvider extends BaseProvider {
  late Map<String, dynamic>? _board;
  Map<String, dynamic> get board => _board!;

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {}

  void initBoard(Map<String, dynamic> selectedBoard) {
    print(selectedBoard['documentId'].toString());

    _board = selectedBoard;
    notifyListeners();
  }

  void tapTile(int index, bool isXTurn) {
    _board!['board'][index] = isXTurn ? 'X' : 'O';
    firebaseService.updateDocument('boards', _board!['documentId'].toString(), _board!);
  }
}
