// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janson_wighting/app.dart';
import 'package:janson_wighting/providers.dart';
import 'package:janson_wighting/widgets/buttoms.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'widgets/بيانات الوزن و التزكره.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ImcomingValueporvider()
          ..port
          ..initport()
          ..stream(),
      ),
      ChangeNotifierProvider(
        create: (context) => Hivecontroller()..initHive(),
      ),
      // ChangeNotifierProvider(
      //   create: (context) => Hivecontroller()..initHive(),
      // )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 9, 116, 238),
        ),
        backgroundColor: const Color.fromARGB(255, 10, 102, 206),
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {



    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //black item
          const WhightInput(),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //بيانات  الوزن
              const weightInfo(),
              const SizedBox(
                width: 9,
              ),
              //بيانات التزكره
              wightTecket(),
              const SizedBox(
                width: 9,
              )
            ],
          ),
          const Gap(9),
          const buttoms(),

        ],
      ),
    );
  }
}

class WhightInput extends StatelessWidget {
  const WhightInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(9))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //wight value
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Selector<ImcomingValueporvider, String>(
              selector: (_, myType) => myType.nowValu,
              builder: (context, v, child) {
                return Text(v,
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 0, 0),
                    ));
              },
            ),
          ),
          //date
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                Text(
                  DateTime.now().formatt_yMd(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 231, 216, 216),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                StreamBuilder(
                  stream: Stream<int>.periodic(
                      const Duration(seconds: 1), (count) => count),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Text(
                      DateTime.now().formatt_hms(),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 88, 185, 7),
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    );
                  },
                ),
              ],
            ),
          ),
        ].reversed.toList(),
      ),
    );
  }
}
gett() async {
  var request = http.Request('GET', Uri.parse('http://admin:Admin%40123@192.168.1.4/ISAPI/Streaming/channels/101/picture'));


http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}

}