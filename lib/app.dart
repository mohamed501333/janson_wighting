// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';
import 'package:janson_wighting/domain/models/models.dart';

extension Dsd on DateTime {
  String formatt_yMd() {
    String formateeddate = DateFormat('dd-MM-yyyy').format(this);
    return formateeddate;
  }

  String formatt_hms() {
    String formateeddate = DateFormat('hh:mm:ss a').format(this);
    return formateeddate;
  }
}


extension FD on String{
  int to_int(){
    return int.parse(this);
   }
  double to_double(){
    return double.parse(this);
   }
}


extension C3 on List<ActionModel> {
  //get finalProdcut date for this action

  

  String get_Who_Of(String action) {
    return where((element) => element.action == action).first.who;
  }
  //get fraction date for this action

  DateTime get_Date_of_action(String action) {
    return where((element) => element.action == action).isEmpty
        ? DateTime.utc(0)
        : where((element) => element.action == action).first.when;
  }


  // return true if action exist
  bool if_action_exist(String actiontitle) {
    return where((element) => element.action == actiontitle).isNotEmpty;
  }
}
class Validation {
   static String? validateothers(String? value) {
    if (value!.isEmpty) {
      return "فارغ";
    }
    if (int.tryParse(value) == null) {
      return "ادخل قيمة صحيحة";
    }

    return null;
  }
}
