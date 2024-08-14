import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/boards_screen.dart';
import 'package:tic_tac_toe/pages/create_board_screen.dart';
import 'package:tic_tac_toe/pages/game_board_screen.dart';
import 'package:tic_tac_toe/pages/splash_screen.dart';
import 'package:tic_tac_toe/pages/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const GameBoardScreen());
  }
}
