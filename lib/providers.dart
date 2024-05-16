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
      await Future.delayed(const Duration(milliseconds: 5));
      if (i == 89) {
        x = i;
      }
      port.write(Uint8List.fromList([...x.toString().codeUnits, 10]));
      print('Writen Bytes: $i');
    }
  }

  var nowValu = "0";

  addValue(String val) {
    if (val != nowValu) {
      nowValu = val;
    }
  }

  Uint8List? streamlisten;

  stream() {
   SerialPortReader(port).stream.listen((v){
            addValue(utf8.decode(v).replaceAll(RegExp(r'[^0-9]'), ''));
   });
  }


  Refrech_UI() {
    notifyListeners();
  }
}
