import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ColorChanges with ChangeNotifier {
  bool _isRed = false;
  bool get isRed => _isRed;
  set isRed(bool value){
    _isRed = value;
    notifyListeners();
  }

  Color get colorRed => (_isRed) ? Colors.blue : Colors.red;
}
