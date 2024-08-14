import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/base/firebase/firebase_service.dart';
import 'package:tic_tac_toe/core/base/provider/base_provider.dart';

class CreateBoardProvider extends BaseProvider {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {}

  late Color _selectedColor = Colors.blue;
  Color get selectedColor => _selectedColor;

  Map<String, dynamic> _boardSettings = {};

  void createBoard(Map<String, dynamic> settings, List<String> players) {
    String _currentPlayer = appStateManager.currentUser;
    _boardSettings = settings;
    notifyListeners();

    FirebaseService().addDataToCollection('boards', {
      'settings': _boardSettings,
      'players': [_currentPlayer]
    }).then((value) => navigation.pop());
  }

  Map<String, dynamic> get boardSettings => _boardSettings;

  void setColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }
}
