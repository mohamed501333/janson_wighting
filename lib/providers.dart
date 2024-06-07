// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:janson_wighting/domain/enums.dart';
import 'package:janson_wighting/domain/models/models.dart';


class ImcomingValueporvider extends ChangeNotifier {
  var port = SerialPort('COM1');

  initport() {
    port.config.baudRate = 9600;
    port.config.bits = 8;
    port.config.parity = SerialPortParity.none;
    port.config.stopBits = 1;
    port.config.xonXoff = 0;
    port.config.rts = 1;
    port.config.dtr = 1;
    port.config.cts = 0;
    port.config.dsr = 0;
    port.openReadWrite();
  }

  var x = 0;
  Future<void> sendMessage() async {
    for (var i = 0; i < 500; i++) {
      await Future.delayed(const Duration(milliseconds: 10));
      port.write(Uint8List.fromList([...i.toString().codeUnits, 10]));
      // print('Writen Bytes: $i');
    }
  }

  var nowValu = "0";

  stream() {
    SerialPortReader(port).stream.listen((v) {
      var a = utf8.decode(v).replaceAll(RegExp(r'[^0-9]'), '');
      if (a != '' && a != nowValu) {
        nowValu = a;
        notifyListeners();
      }
    });
  }

  Refrech_UI() {
    notifyListeners();
  }
}

class Hivecontroller extends ChangeNotifier {
WieghtTecketMOdel? temprecord;
     int ticketserial=0;
  String v='';
    TextEditingController carnumcontroller = TextEditingController();
    TextEditingController drivernamecontroller = TextEditingController();
    TextEditingController customercontroller = TextEditingController();
    TextEditingController itemcontroller = TextEditingController();
    TextEditingController notescontroller = TextEditingController();
   clearfields(){
    v='';
    carnumcontroller.clear();
    drivernamecontroller.clear();
    customercontroller.clear();
    itemcontroller.clear();
    notescontroller.clear();
    notifyListeners();
   }

      initHive()  async {     
             print("12222222");
      var path = Directory.current.path;
       Hive.init(path);
       await Hive.openBox('records').then((h){
        allrecords.addAll(Hive.box('records').values.map((v){return WieghtTecketMOdel.fromJson(v);}));
                Hive.box('records').watch().forEach((r){
                  allrecords.clear();
        allrecords.addAll(Hive.box('records').values.map((v){return WieghtTecketMOdel.fromJson(v);}));
         print(allrecords);
       });  
        //  print(allrecords);
        });
   }


     
 List<WieghtTecketMOdel> allrecords=[];

  addNewRecord(){
     var record =WieghtTecketMOdel(wightTecket_ID: DateTime.now().microsecondsSinceEpoch, wightTecket_serial: allrecords.length+1, stockRequsition_ID: 0, stockRequsition_serial: 0, carNum: 0, customerName: '', driverName: '', prodcutName: '', notes: '', firstShot: 0, secondShot: 0, totalWeight: 0, actions: [WhigtTecketAction.create_newTicket.add]);
    Hive.box('records').put(record.wightTecket_serial, record.toJson());
    ticketserial =record.wightTecket_serial;
    temprecord=record;
    notifyListeners();
  }
  updateRecord(WieghtTecketMOdel record){
    Hive.box('records').put(record.wightTecket_serial, record.toJson());
    notifyListeners();
  }
    Refrech_UI() {
    notifyListeners();
  }
}

