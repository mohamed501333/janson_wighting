import 'package:flutter/foundation.dart';

class valuesControllers extends ChangeNotifier {
  String firstWeight = "0";

  assignValue(String val) {
    firstWeight = val;
    notifyListeners();
  }
}
