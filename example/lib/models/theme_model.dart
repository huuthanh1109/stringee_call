import 'package:flutter/material.dart';

import '../main.dart';

abstract class ThemeModel extends ChangeNotifier {
  void themeSetting();
  bool get theme;
}

class ThemeModelImplementation extends ThemeModel {
  bool _theme = false;

  ThemeModelImplementation() {
    Future.delayed(Duration(seconds: 3)).then((_) => getIt.signalReady(this));
  }

  @override
  bool get theme => _theme;

  @override
  void themeSetting() {
    print('theme $theme');
    _theme = !theme;
    notifyListeners();
  }
}
