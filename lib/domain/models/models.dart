// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class WieghtTecketMOdel {
  int wightTecket_ID;
  int wightTecket_serial;
  int stockRequsition_ID;
  int stockRequsition_serial;
  int carNum;
  String customerName;
  String driverName;
  String prodcutName;
  String notes;
  double firstShot;
  double secondShot;
  double totalWeight;
  List<int> firstShotpic;
  List<ActionModel> actions;
  WieghtTecketMOdel({
    required this.wightTecket_ID,
    required this.wightTecket_serial,
    required this.stockRequsition_ID,
    required this.stockRequsition_serial,
    required this.carNum,
    required this.customerName,
    required this.driverName,
    required this.prodcutName,
    required this.notes,
    required this.firstShot,
    required this.secondShot,
    required this.totalWeight,
    required this.firstShotpic,
    required this.actions,
  });
 

  WieghtTecketMOdel copyWith({
    int? wightTecket_ID,
    int? wightTecket_serial,
    int? stockRequsition_ID,
    int? stockRequsition_serial,
    int? carNum,
    String? customerName,
    String? driverName,
    String? prodcutName,
    String? notes,
    double? firstShot,
    double? secondShot,
    double? totalWeight,
    List<int>? firstShotpic,
    List<ActionModel>? actions,
  }) {
    return WieghtTecketMOdel(
      wightTecket_ID: wightTecket_ID ?? this.wightTecket_ID,
      wightTecket_serial: wightTecket_serial ?? this.wightTecket_serial,
      stockRequsition_ID: stockRequsition_ID ?? this.stockRequsition_ID,
      stockRequsition_serial: stockRequsition_serial ?? this.stockRequsition_serial,
      carNum: carNum ?? this.carNum,
      customerName: customerName ?? this.customerName,
      driverName: driverName ?? this.driverName,
      prodcutName: prodcutName ?? this.prodcutName,
      notes: notes ?? this.notes,
      firstShot: firstShot ?? this.firstShot,
      secondShot: secondShot ?? this.secondShot,
      totalWeight: totalWeight ?? this.totalWeight,
      firstShotpic: firstShotpic ?? this.firstShotpic,
      actions: actions ?? this.actions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'wightTecket_ID': wightTecket_ID,
      'wightTecket_serial': wightTecket_serial,
      'stockRequsition_ID': stockRequsition_ID,
      'stockRequsition_serial': stockRequsition_serial,
      'carNum': carNum,
      'customerName': customerName,
      'driverName': driverName,
      'prodcutName': prodcutName,
      'notes': notes,
      'firstShot': firstShot,
      'secondShot': secondShot,
      'totalWeight': totalWeight,
      'firstShotpic': firstShotpic,
      'actions': actions.map((x) => x.toMap()).toList(),
    };
  }

  factory WieghtTecketMOdel.fromMap(Map<String, dynamic> map) {
    return WieghtTecketMOdel(
      wightTecket_ID: map['wightTecket_ID'] as int,
      wightTecket_serial: map['wightTecket_serial'] as int,
      stockRequsition_ID: map['stockRequsition_ID'] as int,
      stockRequsition_serial: map['stockRequsition_serial'] as int,
      carNum: map['carNum'] as int,
      customerName: map['customerName'] as String,
      driverName: map['driverName'] as String,
      prodcutName: map['prodcutName'] as String,
      notes: map['notes'] as String,
      firstShot: map['firstShot'] as double,
      secondShot: map['secondShot'] as double,
      totalWeight: map['totalWeight'] as double,
      firstShotpic: List<int>.from((map['firstShotpic'] as List<dynamic>)),
      actions: List<ActionModel>.from((map['actions'] as List<dynamic>).map<ActionModel>((x) => ActionModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory WieghtTecketMOdel.fromJson(String source) => WieghtTecketMOdel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WieghtTecketMOdel(wightTecket_ID: $wightTecket_ID, wightTecket_serial: $wightTecket_serial, stockRequsition_ID: $stockRequsition_ID, stockRequsition_serial: $stockRequsition_serial, carNum: $carNum, customerName: $customerName, driverName: $driverName, prodcutName: $prodcutName, notes: $notes, firstShot: $firstShot, secondShot: $secondShot, totalWeight: $totalWeight, firstShotpic: $firstShotpic, actions: $actions)';
  }

  @override
  bool operator ==(covariant WieghtTecketMOdel other) {
    if (identical(this, other)) return true;
  
    return 
      other.wightTecket_ID == wightTecket_ID &&
      other.wightTecket_serial == wightTecket_serial &&
      other.stockRequsition_ID == stockRequsition_ID &&
      other.stockRequsition_serial == stockRequsition_serial &&
      other.carNum == carNum &&
      other.customerName == customerName &&
      other.driverName == driverName &&
      other.prodcutName == prodcutName &&
      other.notes == notes &&
      other.firstShot == firstShot &&
      other.secondShot == secondShot &&
      other.totalWeight == totalWeight &&
      listEquals(other.firstShotpic, firstShotpic) &&
      listEquals(other.actions, actions);
  }

  @override
  int get hashCode {
    return wightTecket_ID.hashCode ^
      wightTecket_serial.hashCode ^
      stockRequsition_ID.hashCode ^
      stockRequsition_serial.hashCode ^
      carNum.hashCode ^
      customerName.hashCode ^
      driverName.hashCode ^
      prodcutName.hashCode ^
      notes.hashCode ^
      firstShot.hashCode ^
      secondShot.hashCode ^
      totalWeight.hashCode ^
      firstShotpic.hashCode ^
      actions.hashCode;
  }
}

class ActionModel {
  String action;
  String who;
  DateTime when;
  ActionModel({
    required this.action,
    required this.who,
    required this.when,
  });

  ActionModel copyWith({
    String? action,
    String? who,
    DateTime? when,
  }) {
    return ActionModel(
      action: action ?? this.action,
      who: who ?? this.who,
      when: when ?? this.when,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'action': action,
      'who': who,
      'when': when.millisecondsSinceEpoch,
    };
  }

  factory ActionModel.fromMap(Map<String, dynamic> map) {
    return ActionModel(
      action: map['action'] as String,
      who: map['who'] as String,
      when: DateTime.fromMillisecondsSinceEpoch(map['when'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ActionModel.fromJson(String source) =>
      ActionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ActionModel(action: $action, who: $who, when: $when)';

  @override
  bool operator ==(covariant ActionModel other) {
    if (identical(this, other)) return true;

    return other.action == action && other.who == who && other.when == when;
  }

  @override
  int get hashCode => action.hashCode ^ who.hashCode ^ when.hashCode;
}

class DriverModel {
  int ID;
  String drivername;
  String companyname;
  int carNum;
  DriverModel({
    required this.ID,
    required this.drivername,
    required this.companyname,
    required this.carNum,
  });

  DriverModel copyWith({
    int? ID,
    String? drivername,
    String? companyname,
    int? carNum,
  }) {
    return DriverModel(
      ID: ID ?? this.ID,
      drivername: drivername ?? this.drivername,
      companyname: companyname ?? this.companyname,
      carNum: carNum ?? this.carNum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': ID,
      'drivername': drivername,
      'companyname': companyname,
      'carNum': carNum,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    return DriverModel(
      ID: map['ID'] as int,
      drivername: map['drivername'] as String,
      companyname: map['companyname'] as String,
      carNum: map['carNum'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverModel.fromJson(String source) =>
      DriverModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DriverModel(ID: $ID, drivername: $drivername, companyname: $companyname, carNum: $carNum)';
  }

  @override
  bool operator ==(covariant DriverModel other) {
    if (identical(this, other)) return true;

    return other.ID == ID &&
        other.drivername == drivername &&
        other.companyname == companyname &&
        other.carNum == carNum;
  }

  @override
  int get hashCode {
    return ID.hashCode ^
        drivername.hashCode ^
        companyname.hashCode ^
        carNum.hashCode;
  }
}
