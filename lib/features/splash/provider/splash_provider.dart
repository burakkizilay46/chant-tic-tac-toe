import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/base/provider/base_provider.dart';
import 'package:tic_tac_toe/core/constants/enums/shared_prefs_keys.dart';
import 'package:tic_tac_toe/core/constants/navigation/navigation_constants.dart';
import 'package:tic_tac_toe/core/init/app_state/app_state.dart';
import 'package:tic_tac_toe/core/init/cache/shared_prefs_manager.dart';

class SplashProvider extends BaseProvider {
  @override
  void init() async {
    await Future.delayed(const Duration(seconds: 2));
    await SharedPrefsManager.preferencesInit();
    navigateToCreate();
  }

  @override
  void setContext(BuildContext context) {}

  Future<void> navigateToCreate() async {
    // Kullanıcının giriş durumu kontrol ediliyor
    // Kullanıcının giriş durumu kontrol ediliyor
    bool? isLogged = await sharedPrefManager.getBoolValue(SharedPrefKeys.ISLOGGED);

// Kullanıcı adını al
    String? user = await sharedPrefManager.getStringValue(SharedPrefKeys.USER);

// Eğer isLogged null ise, varsayılan olarak false ayarlanıyor
    if (isLogged == null) {
      await sharedPrefManager.setBoolValue(SharedPrefKeys.ISLOGGED, value: false);
      isLogged = false;
    }

    if (isLogged && user != null && user.isNotEmpty) {
      AppStateManager.instance.currentUser = await sharedPrefManager.getStringValue(SharedPrefKeys.USER) ?? '';
      navigation.navigateToPageClear(path: NavigationConstants.BOARD_LIST);
    } else {
      await navigation.navigateToPageClear(path: NavigationConstants.CREATE_USER);
    }
  }
}
