class AppStateManager {
  static AppStateManager? _instance;
  static AppStateManager get instance {
    return _instance ??= AppStateManager.init();
  }

  String currentUser = '';

  AppStateManager.init();
}
