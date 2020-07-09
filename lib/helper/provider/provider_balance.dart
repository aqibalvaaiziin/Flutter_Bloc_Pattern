import 'package:flutter/foundation.dart';

class Balance with ChangeNotifier {
  int _balance = 10000;

  int get balance => _balance;
  set balance(int newValue) {
    _balance = newValue;
    notifyListeners();
  }
}
