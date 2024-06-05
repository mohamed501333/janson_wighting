// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janson_wighting/app.dart';
import 'package:janson_wighting/widgets/%D8%A8%D9%8A%D8%A7%D9%86%D8%A7%D8%AA%20%D8%A7%D9%84%D9%88%D8%B2%D9%86%20%D9%88%20%D8%A7%D9%84%D8%AA%D8%B2%D9%83%D8%B1%D9%87.dart';
import 'package:provider/provider.dart';

import 'providers.dart';

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
        create: (context) => Refresher(),
      ),
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
    return  SingleChildScrollView(
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
          //test buttom
          const Test(),
          
        ],
      ),
    );
  }
}

class buttoms extends StatelessWidget {
  const buttoms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Gap(9),
        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 203, 218, 7))),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'وزنة جديدة',
                style: TextStyle(fontSize: 18),
              ),
            )),
        const Gap(9),
        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 203, 218, 7))),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'حفظ',
                style: TextStyle(fontSize: 18),
              ),
            )),
        const Gap(9),
        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 203, 218, 7))),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'طباعة الوزنة',
                style: TextStyle(fontSize: 18),
              ),
            )),
      ].reversed.toList(),
    );
  }
}

class Test extends StatelessWidget {
  const Test({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                context.read<ImcomingValueporvider>().sendMessage();
              }),
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
