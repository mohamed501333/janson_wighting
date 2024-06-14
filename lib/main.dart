// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janson_wighting/app.dart';
import 'package:janson_wighting/providers.dart';
import 'package:janson_wighting/widgets/buttoms.dart';
import 'package:janson_wighting/widgets/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'widgets/الاولى والثانيه.dart';
import 'widgets/بيانات الوزن و التزكره.dart';
import 'package:flutter/services.dart';

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
          title: const Center(
              child: Text(
            "يانسن فوم",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
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
              Column(
                children: [
                  StreamBuilder(
                    stream: timedCounter(101),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        context.read<Hivecontroller>().cam1 = snapshot.data;
                        return Image.memory(
                          snapshot.data,
                          width: MediaQuery.of(context).size.width * .22,
                          height: 230,
                          fit: BoxFit.fill,
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  StreamBuilder(
                    stream: timedCounter(202),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        context.read<Hivecontroller>().cam2 = snapshot.data;
                        return Image.memory(
                          snapshot.data,
                          width: MediaQuery.of(context).size.width * .22,
                          height: 230,
                          fit: BoxFit.fill,
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
              const NotCompletedTecket(),
              const Gap(9),
              const weightInfo(),
              const Gap(9),
              wightTecket(),
              const Gap(9)
            ],
          ),
          const Gap(9),
          const buttoms(),

          Column(
            children: [
                 
                        Consumer<Hivecontroller>(
            builder: (context, myType, child) {
              if (myType.temprecord != null) {
                return SizedBox(
                  height: 300,
                  width: 500,
                  child: PdfPreview(
                    build: (format) => generatePdf(context, myType.temprecord!),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
                
          
                               const Text("عند الوزن الاول",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<Hivecontroller>(
                    builder: (context, myType, child) {
                      if (myType.temprecord!=null&&myType.temprecord!.firstShotpiccam1.isNotEmpty) {
                        return Image.memory(
                              Uint8List.fromList(myType.temprecord!.firstShotpiccam1),
                              width: 500,
                              height: 400,
                              fit: BoxFit.fill,
                            );
                      } else {
                        return const SizedBox();
                      }
                              
                    },
                  ),
                  Consumer<Hivecontroller>(
                    builder: (context, myType, child) {
                      if (myType.temprecord!=null&&myType.temprecord!.firstShotpiccam2.isNotEmpty) {
                        return Image.memory(
                              Uint8List.fromList(myType.temprecord!.firstShotpiccam2),
                              width: 500,
                              height: 400,
                              fit: BoxFit.fill,
                            );
                      } else {
                        return const SizedBox();
                      }
                              
                    },
                  ),
                ],
              ),
                     
                               const Text("عند الوزن الثانى",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
          
              Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  
                  Consumer<Hivecontroller>(
                    builder: (context, myType, child) {
                      if (myType.temprecord!=null&&myType.temprecord!.secondShotpiccam1.isNotEmpty) {
                        return Image.memory(
                              Uint8List.fromList(myType.temprecord!.secondShotpiccam1),
                              width: 500,
                              height: 400,
                              fit: BoxFit.fill,
                            );
                      } else {
                        return const SizedBox();
                      }
                              
                    },
                  ),
                  Consumer<Hivecontroller>(
                    builder: (context, myType, child) {
                      if (myType.temprecord!=null&&myType.temprecord!.secondShotpiccam2.isNotEmpty) {
                        return Image.memory(
                              Uint8List.fromList(myType.temprecord!.secondShotpiccam2),
                              width: 500,
                              height: 400,
                              fit: BoxFit.fill,
                            );
                      } else {
                        return const SizedBox();
                      }
                              
                    },
                  ),
                ],
              ),
                     
            ],
          )
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

Future<Uint8List> gett() async {
// var request = http.Request('GET', Uri.parse('http://admin:Admin%40@192.168.1.4/ISAPI/Streaming/channels/101/picture'));

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//   }
//   else {
//     print(response.reasonPhrase);
//   }
//     final onvif = await Onvif.connect(
//  host:"192.168.1.4:80",
//  username: "admin",
//  password:'Admin@123');
//  var i=await onvif.deviceManagement.getDeviceInformation();
//  print(onvif.s);

// var dio = Dio();
// var response = await dio.request(
//   'http://admin:Admin%40123@192.168.1.4/ISAPI/Streaming/channels/101/picture',
//   options: Options(
//     method: 'GET',
//   ),
// );

// if (response.statusCode == 200) {
//   print(json.encode(response.data));
// }
// else {
//   print(response.statusMessage);
// }

  final url = Uri.parse(
      'http://admin:Admin%40123@192.168.1.4/ISAPI/Streaming/channels/101/picture'); //Repclace Your Endpoint
  final headers = {
    'Accept': '*/*',
    'Cache-Control': 'no-cache',
    'Accept-Encoding': 'gzip, deflate, br',
    'Content-Type': 'image/jpeg',
    'Authorization': 'Basic YWRtaW46QWRtaW5AMTIz'
  };

  final response = await http.get(
    url,
    headers: headers,
  );

  if (response.statusCode == 200) {
    print('Data Sending Success.');
  } else {
    print('Hata: ');
  }
  return response.bodyBytes;
}

Stream<Uint8List> timedCounter(int x) async* {
  final url = Uri.parse(
      'http://admin:Admin%40123@192.168.1.4/ISAPI/Streaming/channels/$x/picture'); //Repclace Your Endpoint
  final headers = {
    'Accept': '*/*',
    'Cache-Control': 'no-cache',
    'Accept-Encoding': 'gzip, deflate, br',
    'Content-Type': 'image/jpeg',
    'Authorization': 'Basic YWRtaW46QWRtaW5AMTIz'
  };

  while (true) {
    final response = await http.get(
      url,
      headers: headers,
    );
    await Future.delayed(const Duration(seconds: 1));
    yield response.bodyBytes;
  }
}
