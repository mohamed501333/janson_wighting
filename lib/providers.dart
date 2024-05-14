// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

class ImcomingValueporvider extends ChangeNotifier {
  var port = SerialPort('COM3');
  var nowValu = "0";

  addValue(String val) {
    if (val != nowValu) {
      nowValu = val;
      notifyListeners();
    }
  }

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

  Future<void> sendMessage() async {
    for (var i = 0; i < 60; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      const Duration(seconds: 2);
      port.write(Uint8List.fromList([...1.toString().codeUnits, 10]));
      print('Writen Bytes: $i');
    }
  }

  stream() {
    SerialPortReader(port).stream.distinct().listen((event) {
      addValue(utf8.decode(event).replaceAll(RegExp(r'[^0-9]'), ''));
    });
  }

  Refrech_UI() {
    notifyListeners();
  }
}
