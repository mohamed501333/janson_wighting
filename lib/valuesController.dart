// ignore_for_file: camel_case_types, file_names

import 'package:flutter/foundation.dart';

class valuesControllers extends ChangeNotifier {
  String firstWeight = "0";

  assignValue(String val) {
    firstWeight = val;
    notifyListeners();
  }
}
