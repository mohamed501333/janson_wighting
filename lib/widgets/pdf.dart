import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';
import 'package:janson_wighting/app.dart';
import 'package:janson_wighting/domain/enums.dart';
import 'package:janson_wighting/domain/models/models.dart';
import 'package:pdf/pdf.dart' as pw;
import 'package:pdf/widgets.dart';

Future<Uint8List> generatePdf(
    m.BuildContext c, WieghtTecketMOdel record) async {
  final pdf = Document(version: pw.PdfVersion.pdf_1_5, compress: true);
  // final font = await PdfGoogleFonts.arapeyItalic();
  var font = Font.ttf(await rootBundle.load("assets/fonts/HacenTunisia.ttf"));
// final theme = pw.ThemeData.withFont(
//   base: pw.Font.ttf(await rootBundle.load("assets/fonts/HacenTunisia.ttf")),
//   bold: pw.Font.ttf(await rootBundle.load("assets/fonts/HacenTunisia.ttf")),
// );
  pdf.addPage(
    Page(
      // theme:theme ,
      pageFormat: pw.PdfPageFormat.a4,
      build: (context) {
        var s =
            TextStyle(font: font, fontSize: 16, fontWeight: FontWeight.bold);
        return Column(children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(),
                color: pw.PdfColors.grey300,
              ),
              child: Text('يانسن فوم',
                  style: s, textDirection: TextDirection.rtl)),
          Container(
            width: double.infinity,
            child: Column(children: [
              SizedBox(height: 3),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Text(
                              "رقم اذن التحميل:${record.stockRequsition_serial == 0 ? '' : record.stockRequsition_serial}",
                              style: s,
                              textDirection: TextDirection.rtl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Text(
                              "مسلسل التذكره :${record.wightTecket_serial}",
                              style: s,
                              textDirection: TextDirection.rtl),
                        ),
                      ].reversed.toList()),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Text("عميل/مورد:${record.customerName} ",
                              style: s, textDirection: TextDirection.rtl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 130),
                          child: Text("الصنف :${record.prodcutName}",
                              style: s, textDirection: TextDirection.rtl),
                        ),
                      ].reversed.toList()),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Text("اسم السائق: ${record.driverName} ",
                              style: s, textDirection: TextDirection.rtl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Text("رقم السياره : ${record.carNum}",
                              style: s, textDirection: TextDirection.rtl),
                        ),
                      ].reversed.toList()),
                ]),
              ),
              Table(
                columnWidths: {
                  0: const FlexColumnWidth(2),
                  1: const FlexColumnWidth(2),
                  2: const FlexColumnWidth(1),
                  3: const FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                      children: [
                    Container(
                        padding: const EdgeInsets.all(5),
                        child: Center(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                              Text("الوزنه  ",
                                  style: TextStyle(
                                      font: font,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.rtl),
                            ]))),
                    Container(
                        padding: const EdgeInsets.all(5),
                        child: Center(
                            child: Text("كج ",
                                style: TextStyle(
                                    font: font,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                textDirection: TextDirection.rtl))),
                    Container(
                        padding: const EdgeInsets.all(5),
                        child: Center(
                            child: Text("التاريخ",
                                style: TextStyle(
                                    font: font,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                textDirection: TextDirection.rtl))),
                    Container(
                        padding: const EdgeInsets.all(5),
                        child: Center(
                            child: Text("الوقت",
                                style: TextStyle(
                                    font: font,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                textDirection: TextDirection.rtl))),
                  ].reversed.toList())
                ],
                border: TableBorder.all(width: 1, color: pw.PdfColors.black),
              ),
              Table(
                columnWidths: {
                  0: const FlexColumnWidth(2),
                  1: const FlexColumnWidth(2),
                  2: const FlexColumnWidth(1),
                  3: const FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                      children: [
                    Container(
                        padding: const EdgeInsets.all(5),
                        child: Center(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                              Text(" الاولى ",
                                  style: TextStyle(
                                      font: font,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.rtl),
                            ]))),
                    record.actions.if_action_exist(WhigtTecketAction
                                .create_fristWhight.getTitle) ==
                            false
                        ? SizedBox()
                        : Container(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                                child: Text(
                                    " ${record.firstShot.toStringAsFixed(0)} ",
                                    style: TextStyle(
                                        font: font,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl))),
                    record.actions.if_action_exist(WhigtTecketAction
                                .create_fristWhight.getTitle) ==
                            false
                        ? SizedBox()
                        : Container(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                                child: Text(
                                    record.actions.reversed
                                        .toList()
                                        .get_Date_of_action(WhigtTecketAction
                                            .create_fristWhight.getTitle)
                                        .formatt_yMd(),
                                    style: TextStyle(
                                        font: font,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl))),
                    record.actions.if_action_exist(WhigtTecketAction
                                .create_fristWhight.getTitle) ==
                            false
                        ? SizedBox()
                        : Container(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                                child: Text(
                                    record.actions.reversed
                                        .toList()
                                        .get_Date_of_action(WhigtTecketAction
                                            .create_fristWhight.getTitle)
                                        .formatt_hms(),
                                    style: TextStyle(
                                        font: font,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl))),
                  ].reversed.toList())
                ],
                border: TableBorder.all(width: 1, color: pw.PdfColors.black),
              ),
              Table(
                columnWidths: {
                  0: const FlexColumnWidth(2),
                  1: const FlexColumnWidth(2),
                  2: const FlexColumnWidth(1),
                  3: const FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                      children: [
                    Container(
                        padding: const EdgeInsets.all(5),
                        child: Center(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                              Text(" الثانيه ",
                                  style: TextStyle(
                                      font: font,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.rtl),
                            ]))),
                    record.actions.if_action_exist(WhigtTecketAction
                                .create_secondWhigt.getTitle) ==
                            false
                        ? SizedBox()
                        : Container(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                                child: Text(
                                    " ${record.secondShot.toStringAsFixed(0)} ",
                                    style: TextStyle(
                                        font: font,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl))),
                    record.actions.if_action_exist(WhigtTecketAction
                                .create_secondWhigt.getTitle) ==
                            false
                        ? SizedBox()
                        : Container(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                                child: Text(
                                    record.actions.reversed
                                        .toList()
                                        .get_Date_of_action(WhigtTecketAction
                                            .create_secondWhigt.getTitle)
                                        .formatt_yMd(),
                                    style: TextStyle(
                                        font: font,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl))),
                    record.actions.if_action_exist(WhigtTecketAction
                                .create_secondWhigt.getTitle) ==
                            false
                        ? SizedBox()
                        : Container(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                                child: Text(
                                    record.actions.reversed
                                        .toList()
                                        .get_Date_of_action(WhigtTecketAction
                                            .create_secondWhigt.getTitle)
                                        .formatt_hms(),
                                    style: TextStyle(
                                        font: font,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl))),
                  ].reversed.toList())
                ],
                border: TableBorder.all(width: 1, color: pw.PdfColors.black),
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: pw.PdfColors.grey300,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                        Text(
                            "                  صافى الوزن  :${record.totalWeight.toStringAsFixed(0)}                ",
                            style: TextStyle(
                                font: font,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl),
                      ]))),
            ]),
          )
        ]);
      },
    ),
  );
  return pdf.save();
}
