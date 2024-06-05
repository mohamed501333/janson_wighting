// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, must_be_immutable
//بيانات  الوزن

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import 'package:janson_wighting/app.dart';
import 'package:janson_wighting/providers.dart';

class weightInfo extends StatelessWidget {
  const weightInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        color: const Color.fromARGB(255, 10, 102, 206),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 129, 136, 202)
                .withOpacity(0.5), //color of shadow
            spreadRadius: 1, //spread radius
            blurRadius: 1, // blur radius
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        width: 300,
        height: 410,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Color.fromARGB(255, 3, 202, 93)),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "بيانات  الوزن",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const Gap(33),
            //firest w
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Gap(8),
                GestureDetector(
                  onTap: () {
                    var val = context.read<ImcomingValueporvider>().nowValu;
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 2.1)
                        ],
                        border: Border.all(),
                        color: const Color.fromARGB(255, 40, 83, 201),
                        borderRadius: BorderRadius.circular(6)),
                    child: const Text(
                      "الوزن الاول",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Gap(18),
                Consumer<ImcomingValueporvider>(
                  builder: (context, myType, child) {
                    return Text(myType.nowValu,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w500));
                  },
                ),
                const Gap(22),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    children: [
                      Text(
                        DateTime.now().formatt_yMd(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 88, 185, 7),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Text(
                        DateTime.now().formatt_hms(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 88, 185, 7),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ].reversed.toList(),
            ),
            //second w
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Gap(8),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 2.1)
                        ],
                        border: Border.all(),
                        color: const Color.fromARGB(255, 40, 83, 201),
                        borderRadius: BorderRadius.circular(6)),
                    child: const Text(
                      "الوزن الثانى",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Gap(18),
                const Text("0",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w500)),
                const Gap(22),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    children: [
                      Text(
                        DateTime.now().formatt_yMd(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 88, 185, 7),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Text(
                        DateTime.now().formatt_hms(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 88, 185, 7),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ].reversed.toList(),
            ),
            const Gap(21),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(" 0  :  الوزن الصافى",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500)),
                Gap(8),
              ],
            ),
            const Gap(33),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(" 0  :  مسلسل التذكره",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal)),
                Gap(8),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class wightTecket extends StatelessWidget {
  wightTecket({
    super.key,
  });
  TextEditingController carnumcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        color: const Color.fromARGB(255, 10, 102, 206),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 129, 136, 202)
                .withOpacity(0.5), //color of shadow
            spreadRadius: 1, //spread radius
            blurRadius: 1, // blur radius
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        width: 300,
        height: 410,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Color.fromARGB(255, 3, 202, 93)),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "بيانات تذكرة الوزن",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //رقم السياره
            customField(
              controller: carnumcontroller,
              name: "رقم السياره",
              sugestions: ["mohamed", "ahmed", "mohamed", "ahmed", 'samy'],
            ),
            //اسم السائق
            //رقم السياره
            // العميل
            // اسم الصنف
            //رقم ازن التسليم
            //ملاحزات
          ],
        ),
      ),
    );
  }
}

class customField extends StatelessWidget {
  customField({
    super.key,
    required this.controller,
    required this.name,
    required this.sugestions,
  });

  final TextEditingController controller;
  final String name;
  final List<String> sugestions;
  String v = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
      child: Consumer<ImcomingValueporvider>(
        builder: (context, myType, child) {
          var s = sugestions
              .where(
                  (element) => element.toLowerCase().contains(controller.text))
              .toList()
              .take(3);

          return Column(
            children: [
              TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  floatingLabelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  contentPadding: const EdgeInsets.all(9),
                  filled: true,
                  fillColor: Colors.blue,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  labelText: name,
                  labelStyle: const TextStyle(fontSize: 16),
                  suffixIcon: const Icon(Icons.numbers),
                ),
                controller: controller,
                onSubmitted: (String value) {},
                onChanged: (String value) {
                  controller.text = value;
                  v = value;
                  context.read<ImcomingValueporvider>().Refrech_UI();
                },
              ),
              s.isEmpty || controller.text == "" || v == ''
                  ? const SizedBox()
                  : Column(
                      children: s
                          .map((e) => GestureDetector(
                                onTap: () {
                                  controller.text = e;
                                  v = '';
                                  context
                                      .read<ImcomingValueporvider>()
                                      .Refrech_UI();
                                },
                                child: Container(
                                  width: 100,
                                  height: 30,
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Center(
                                      child: Text(
                                    e,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )),
                                ),
                              ))
                          .toList(),
                    )
            ],
          );
        },
      ),
    );
  }
}
