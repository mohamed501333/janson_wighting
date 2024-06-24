// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:janson_wighting/domain/enums.dart';
import 'package:janson_wighting/domain/models/models.dart';
import 'package:network_discovery/network_discovery.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

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

String ip = '';

class Hivecontroller extends ChangeNotifier {
  static late WebSocketChannel channel;
  List<WieghtTecketMOdel> allrecords = [];
  bool initialized = false;

  cuttingOrders_From_Server() {
    if (ip != '' && initialized == false) {
      initialized = true;
      Uri uri2 = Uri.parse('ws://$ip:8080/biscol/ws')
          .replace(queryParameters: {'username': 'biscolpc'});
      channel = WebSocketChannel.connect(uri2);
      channel.stream.forEach((u) {
        WieghtTecketMOdel item = WieghtTecketMOdel.fromJson(u);
        var index = allrecords
            .map((e) => e.wightTecket_ID)
            .toList()
            .indexOf(item.wightTecket_ID);
        if (index == -1) {
          allrecords.removeAt(index);
          allrecords.add(item);
        }
        notifyListeners();
      });
    }
  }

  WieghtTecketMOdel? temprecord;
  String v = '';
  bool canedit1 = true;
  bool canedit2 = true;
  TextEditingController carnumcontroller = TextEditingController();
  TextEditingController drivernamecontroller = TextEditingController();
  TextEditingController customercontroller = TextEditingController();
  TextEditingController itemcontroller = TextEditingController();
  TextEditingController notescontroller = TextEditingController();
  clearfields() {
    v = '';
    carnumcontroller.clear();
    drivernamecontroller.clear();
    customercontroller.clear();
    itemcontroller.clear();
    notescontroller.clear();
    notifyListeners();
  }

  initHive() async {
    var path = Directory.current.path;
    Hive.init(path);
    await Hive.openBox('records').then((h) async {
      Hive.box('records').clear();

      if (ip != '') {
        // get for the first time
        Uri uri = Uri.http('$ip:8080', '/biscol');
        var response = await http.get(uri);
        if (response.statusCode == 200) {
          Hive.box('records').clear();
          var a = json.decode(response.body) as List;
          for (var element in a) {
            var item = WieghtTecketMOdel.fromMap(element);
            Hive.box('records')
                .put(item.wightTecket_ID.toString(), item.toJson());
            allrecords.add(item);
          }
        }

        Hive.box('records').watch().forEach((r) {
          allrecords.clear();
          allrecords.addAll(Hive.box('records')
              .values
              .map((v) => WieghtTecketMOdel.fromJson(v))
              .where((r) => r.actions
                  .where((o) => o.action == "archive_tecket")
                  .isEmpty));
        });

        notifyListeners();
      } else {
        allrecords.addAll(Hive.box('records')
            .values
            .map((v) => WieghtTecketMOdel.fromJson(v))
            .where((r) =>
                r.actions.where((o) => o.action == "archive_tecket").isEmpty));

        Hive.box('records').watch().forEach((r) {
          allrecords.clear();
          allrecords.addAll(Hive.box('records')
              .values
              .map((v) => WieghtTecketMOdel.fromJson(v))
              .where((r) => r.actions
                  .where((o) => o.action == "archive_tecket")
                  .isEmpty));
        });

        notifyListeners();
      }
    });
  }

  syncToServer() {
    Timer.periodic(const Duration(seconds: 1), (t) {
      if (initialized == false) {
        cuttingOrders_From_Server();
      }
      if (ip != '') {
        for (var item in allrecords.where((test) => test.synced == false)) {
          item.synced = true;
          channel.sink.add(item.toJson());
        }
      }
    });
  }

  Uint8List? cam1;
  Uint8List? cam2;

  addNewRecord() {
    clearfields();
    var record = WieghtTecketMOdel(
        lastupdated: DateTime.now().microsecondsSinceEpoch,
        synced: false,
        wightTecket_ID: DateTime.now().microsecondsSinceEpoch,
        wightTecket_serial: allrecords.isEmpty
            ? 1
            : allrecords
                    .sortedBy<num>((p) => p.wightTecket_serial)
                    .last
                    .wightTecket_serial +
                1,
        stockRequsition_ID: 0,
        stockRequsition_serial: 0,
        carNum: 0,
        customerName: '',
        driverName: '',
        prodcutName: '',
        notes: '',
        firstShot: 0,
        secondShot: 0,
        totalWeight: 0,
        actions: [WhigtTecketAction.create_newTicket.add],
        firstShotpiccam1: [],
        firstShotpiccam2: [],
        secondShotpiccam1: [],
        secondShotpiccam2: []);
    temprecord = record;
    Hive.box('records').put(record.wightTecket_ID.toString(), record.toJson());
    notifyListeners();
  }

  FillRecord(WieghtTecketMOdel r) {
    temprecord = r;
    carnumcontroller.text = r.carNum.toString();
    drivernamecontroller.text = r.driverName;
    customercontroller.text = r.customerName;
    itemcontroller.text = r.prodcutName;
    notescontroller.text = r.notes;
    notifyListeners();
  }

  updateRecord(WieghtTecketMOdel record) {
    record.synced = false;
    Hive.box('records').put(record.wightTecket_ID.toString(), record.toJson());
    notifyListeners();
  }

  removeRecord(WieghtTecketMOdel record) {
    record.synced = false;

    Hive.box('records').put(record.wightTecket_ID.toString(), record.toJson());

    notifyListeners();
  }

  Refrech_UI() {
    notifyListeners();
  }
}

class NetwordescoverController extends ChangeNotifier {
  bool isServerOnline = false;

  streamServerStutues() {
    Timer.periodic(const Duration(seconds: 1), (t) async {
      var serverisofline =
          await NetworkDiscovery.discover('192.168.1', 8080).isEmpty;
      NetworkDiscovery.discover('192.168.1', 8080).forEach((e) {
        if (ip != e.ip) {
          ip = e.ip;
          notifyListeners();
        }
        print(e.ip);
      });

      if (!serverisofline != isServerOnline) {
        isServerOnline = !serverisofline;
        notifyListeners();
      }
    });
  }
}
