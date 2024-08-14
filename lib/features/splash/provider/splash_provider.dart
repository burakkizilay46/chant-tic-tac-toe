import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/base/provider/base_provider.dart';
import 'package:tic_tac_toe/core/constants/enums/shared_prefs_keys.dart';
import 'package:tic_tac_toe/core/constants/navigation/navigation_constants.dart';
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
    bool? isLogged = await sharedPrefManager.getBoolValue(SharedPrefKeys.ISLOGGED);

    // Eğer giriş durumu null ise, varsayılan olarak false olarak ayarlanıyor
    if (isLogged == null) {
      await SharedPrefsManager.instance.setBoolValue(SharedPrefKeys.ISLOGGED, value: false);
      isLogged = false;
    }

    // Giriş durumuna göre navigasyon işlemi yapılıyor
    if (isLogged) {
      navigation.navigateToPageClear(path: NavigationConstants.BOARD_LIST);
    } else {
      await navigation.navigateToPageClear(path: NavigationConstants.CREATE_USER);
    }
  }
}
