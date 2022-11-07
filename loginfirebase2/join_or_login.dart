import 'package:flutter/foundation.dart';

class JoinOrLogin extends ChangeNotifier {
  bool _isJoin = false;
  bool get isJoin => _isJoin;

  void toggle() {
    _isJoin = !_isJoin;
    notifyListeners();
  }
}
