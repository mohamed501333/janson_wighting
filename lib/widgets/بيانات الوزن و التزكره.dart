// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, must_be_immutable
//بيانات  الوزن

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import 'package:janson_wighting/app.dart';
import 'package:janson_wighting/domain/enums.dart';
import 'package:janson_wighting/domain/models/models.dart';
import 'package:janson_wighting/providers.dart';


GlobalKey<FormState> formKey = GlobalKey<FormState>();

class wightTecket extends StatelessWidget {
  wightTecket({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<Hivecontroller>(
      builder: (context, myType, child) {
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
        width: MediaQuery.of(context).size.width * .18,
        height: 410,
        child: SingleChildScrollView(
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
              SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      customField(
                        enabled: myType.canedit1,
                        validator: Validation.validateothers,
                        controller:
                            context.read<Hivecontroller>().carnumcontroller,
                        name: "رقم السياره",
                        sugestions: const [
                          "mohamed",
                          "ahmed",
                          "mohamed",
                          "ahmed",
                          'samy'
                        ],
                      ),
                      const Gap(5),
                      customField(
                        controller:
                            context.read<Hivecontroller>().drivernamecontroller,
                        name: "اسم السائق",
                        sugestions: const [
                          "mohamed",
                          "ahmed",
                          "mohamed",
                          "ahmed",
                          'samy'
                        ],
                      ),
                      const Gap(5),
                      customField(
                        controller:
                            context.read<Hivecontroller>().customercontroller,
                        name: "العميل",
                        sugestions: const [
                          "mohamed",
                          "ahmed",
                          "mohamed",
                          "ahmed",
                          'samy'
                        ],
                      ),
                      const Gap(5),
                      customField(
                        controller:
                            context.read<Hivecontroller>().itemcontroller,
                        name: "الصنف",
                        sugestions: const [
                          "mohamed",
                          "ahmed",
                          "mohamed",
                          "ahmed",
                          'samy'
                        ],
                      ),
                      const Gap(5),
                      customField(
                        controller:
                            context.read<Hivecontroller>().notescontroller,
                        name: "ملاحظات",
                        sugestions: const [
                          "mohamed",
                          "ahmed",
                          "mohamed",
                          "ahmed",
                          'samy'
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
      },
    );
  }
}

class customField extends StatelessWidget {
  customField({
    Key? key,
    required this.controller,
    required this.name,
    required this.sugestions,
    this.validator,
    this.enabled = true,
  }) : super(key: key);

  final TextEditingController controller;
  final String name;
  final List<String> sugestions;
  String v = '';
  final bool enabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
      child: Consumer<Hivecontroller>(
        builder: (context, myType, child) {
          var s = sugestions
              .where(
                  (element) => element.toLowerCase().contains(controller.text))
              .toList()
              .take(3);
          return myType.temprecord == null
              ? const SizedBox()
              : Column(
                  children: [
                    TextFormField(
                      validator: validator,
                      enabled: enabled,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        floatingLabelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                        contentPadding: const EdgeInsets.all(9),
                        filled: true,
                        fillColor: Colors.blue,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        labelText: name,
                        labelStyle:
                            const TextStyle(fontSize: 16, color: Colors.black),
                        suffixIcon: const Icon(Icons.numbers),
                      ),
                      controller: controller,
                      onChanged: (String value) {
                        controller.text = value;
                        v = value;
                        context.read<Hivecontroller>().Refrech_UI();
                      },
                    ),
                    s.isEmpty || controller.text.isEmpty || v == ''
                        ? const SizedBox()
                        : Column(
                            children: s
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        controller.text = e;
                                        v = '';
                                        context
                                            .read<Hivecontroller>()
                                            .Refrech_UI();
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                            color: Colors.white),
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

class NotCompletedTecket extends StatelessWidget {
  const NotCompletedTecket({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.29,
      height: 410,
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
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Color.fromARGB(255, 3, 202, 93)),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "وزنات غير مكتمله",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const Gap(5),
          rowItemheader(),
          Consumer<Hivecontroller>(
            builder: (context, myType, child) {
              int x=0;
              return Center(
                child: SizedBox(
                  height: 334,
                  width: MediaQuery.of(context).size.width * .50,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: myType.allrecords.where((e)=>e.actions.if_action_exist(WhigtTecketAction.create_secondWhigt.getTitle)==false).toList().reversed
                          .map((e){ x++;
                            return  rowItem(
                              x: x,
                                e: e,
                              );})
                          .toList(),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class rowItem extends StatelessWidget {
  const rowItem({
    Key? key,
    required this.e, required this.x,
  }) : super(key: key);
  final WieghtTecketMOdel e;
  final int x;

  @override
  Widget build(BuildContext context) {
      Color? color=x.isOdd?const Color.fromARGB(255, 3, 153, 173):Colors.cyan;
    return IntrinsicHeight(
      child: GestureDetector(
         onTap: (){
          context.read<Hivecontroller>().canedit1=false;
          context.read<Hivecontroller>().FillRecord(e);
         },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: 70,
                constraints: const BoxConstraints.expand(),
                decoration:
                    BoxDecoration(border: Border.all(), color:color),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      e.wightTecket_serial.toString(),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 70,
                constraints: const BoxConstraints.expand(),
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: color),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      e.carNum.toString(),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 100,
                constraints: const BoxConstraints.expand(),
                decoration:
                    BoxDecoration(border: Border.all(), color: color),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      e.driverName.toString(),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 150,
                constraints: const BoxConstraints.expand(),
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: color),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      e.firstShot.toStringAsFixed(0),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ].reversed.toList(),
        ),
      ),
    );
  }
}

class rowItemheader extends StatelessWidget {
   rowItemheader({
    Key? key,
  }) : super(key: key);
      Color? color= const Color.fromARGB(255, 3, 82, 84);
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: 70,
              constraints: const BoxConstraints.expand(),
              decoration:
                  BoxDecoration(border: Border.all(), color: color),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'م التذكره',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 70,
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: color),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                   "رقم العربه",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 100,
              constraints: const BoxConstraints.expand(),
              decoration:
                  BoxDecoration(border: Border.all(), color: color),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "اسم السائق",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 150,
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: color),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "الوزن فارع",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ].reversed.toList(),
      ),
    );
  }
}
