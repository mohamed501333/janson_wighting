// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

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
class Refresher extends ChangeNotifier {
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
    Refrech_UI() {
    notifyListeners();
  }
}