// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

class ImcomingValueporvider extends ChangeNotifier {
  var port = SerialPort('COM3');

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

  addValue(String val) {
    print(val);
    if (val != nowValu) {
      nowValu = val;
    }
  }

  stream() {
    SerialPortReader(port).stream.listen((v) {
      addValue(utf8.decode(v).replaceAll(RegExp(r'[^0-9]'), ''));
    });
    // Stream<Uint8List> s = SerialPortReader(port).stream;

    // s.forEach((element) {
    //   print(String.fromCharCodes(element));
    // });
  }

  Refrech_UI() {
    notifyListeners();
  }
}
