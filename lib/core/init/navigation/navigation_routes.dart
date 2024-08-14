import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/constants/navigation/navigation_constants.dart';
import 'package:tic_tac_toe/core/init/navigation/navigation_exception.dart';
import 'package:tic_tac_toe/features/board_list/view/boards_screen.dart';
import 'package:tic_tac_toe/features/create_board/view/create_board_screen.dart';
import 'package:tic_tac_toe/features/game_board/view/game_board_screen.dart';
import 'package:tic_tac_toe/features/splash/view/splash_screen.dart';
import 'package:tic_tac_toe/features/user_create/view/user_screen.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashScreen());
      case NavigationConstants.SPLASH:
        return normalNavigate(const SplashScreen());
      case NavigationConstants.CREATE_USER:
        return normalNavigate(const UserScreen());
      case NavigationConstants.BOARD_LIST:
        return normalNavigate(const BoardsScreen());
      case NavigationConstants.CREATE_BOARD:
        return normalNavigate(const CreateBoardScreen());
      case NavigationConstants.GAME_BOARD:
        if (args.arguments is Map<String, dynamic>) {
          return normalNavigate(GameBoardScreen(selectedBoard: args.arguments! as Map<String, dynamic>));
        }
        throw NavigateException<Map<String, dynamic>>(args.arguments);
      default:
        return normalNavigate(const SplashScreen());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
