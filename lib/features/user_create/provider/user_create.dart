import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/base/provider/base_provider.dart';
import 'package:tic_tac_toe/core/constants/enums/shared_prefs_keys.dart';
import 'package:tic_tac_toe/core/constants/navigation/navigation_constants.dart';
import 'package:tic_tac_toe/core/init/cache/shared_prefs_manager.dart';

class UserCreateProvider extends BaseProvider {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  void createUser(String username) async {
    await firebaseService.addDataToCollection("users", {"name": username});
    setUser(username);
  }

  Future<void> setUser(String user) async {
    await SharedPrefsManager.instance.setStringValue(SharedPrefKeys.USER, user);
    await SharedPrefsManager.instance.setBoolValue(SharedPrefKeys.ISLOGGED, value: true);
    navigateToBoardsScreen();
  }

  Future<void> navigateToBoardsScreen() async {
    await navigation.navigateToPageClear(path: NavigationConstants.BOARD_LIST);
  }
}
