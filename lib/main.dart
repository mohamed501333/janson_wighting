// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
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
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var port = context.read<ImcomingValueporvider>().port;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                const Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                      hintText: "Enter your message",
                    ),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      context.read<ImcomingValueporvider>().sendMessage();
                    }),
              ],
            ),
          ),
          _informationField('Description', port.description),
          // _informationField('MAC Address', port.config.bits.toString()),
          _informationField('dtr', port.config.dtr.toString()),

          SizedBox(
            height: 300,
            child: Column(
              children: <Widget>[
                Consumer<ImcomingValueporvider>(
                  builder: (context, myType, child) {
                    return Text(myType.nowValu,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color(0xfffbf107),
                        ));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _informationField(String label, String? value) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    margin: const EdgeInsets.only(top: 10),
    height: 50,
    decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: const Color(0xfffbf1c7)),
        borderRadius: const BorderRadius.all(Radius.circular(8))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xfff9f1d7),
            )),
        Text(value ?? 'N/A',
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xfffbf107),
            )),
      ],
    ),
  );
}
