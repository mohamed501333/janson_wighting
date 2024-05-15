import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class Hivecontroller extends ChangeNotifier {
  Box<dynamic> box = Hive.box("name");
}
