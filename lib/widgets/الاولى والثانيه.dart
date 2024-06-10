
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janson_wighting/widgets/%D8%A8%D9%8A%D8%A7%D9%86%D8%A7%D8%AA%20%D8%A7%D9%84%D9%88%D8%B2%D9%86%20%D9%88%20%D8%A7%D9%84%D8%AA%D8%B2%D9%83%D8%B1%D9%87.dart';
import 'package:provider/provider.dart';

import 'package:janson_wighting/app.dart';
import 'package:janson_wighting/domain/enums.dart';
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
        width: MediaQuery.of(context).size.width * .28,
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
            Consumer<Hivecontroller>(
              builder: (context, myType, child) {
                return myType.temprecord == null
                    ? const SizedBox()
                    : Column(
                        children: [
                          firstwight(myType, context),
                          const Gap(21),
                          secondWight(myType, context),
                          const Gap(21),
                          //////////////////////////////////////////////////////////////////
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  " ${myType.temprecord!.totalWeight.toStringAsFixed(0)}  :  الوزن الصافى",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500)),
                              const Gap(8),
                            ],
                          ),
                          const Gap(33),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  " ${myType.temprecord!.wightTecket_serial} :  مسلسل التذكره",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal)),
                              const Gap(8),
                            ],
                          ),
                        ],
                      );
              },
            )
          ],
        ),
      ),
    );
  }

  Row secondWight(Hivecontroller myType, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Gap(8),
        ////////////////////////////////////////////

        GestureDetector(
          onTap: () {
            var record = myType.temprecord;
            record!.secondShot =
                context.read<ImcomingValueporvider>().nowValu.to_double();
            record.totalWeight =
                context.read<ImcomingValueporvider>().nowValu.to_double() -
                    myType.temprecord!.firstShot;
            record.actions.add(WhigtTecketAction.create_secondWhigt.add);
            myType.canedit2 = false;

            myType.updateRecord(record);
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
              "الوزن الثانى",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const Gap(18),
        myType.temprecord!.actions.if_action_exist(
                    WhigtTecketAction.create_secondWhigt.getTitle) ==
                false
            ? const SizedBox()
            : Row(
                children: [
                  Text(myType.temprecord!.secondShot.toStringAsFixed(0),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500)),
                  const Gap(22),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        Text(
                          myType.temprecord!.actions.reversed
                              .toList()
                              .get_Date_of_action(
                                  WhigtTecketAction.create_secondWhigt.getTitle)
                              .formatt_yMd(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 119, 255, 8),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        Text(
                          myType.temprecord!.actions.reversed
                              .toList()
                              .get_Date_of_action(
                                  WhigtTecketAction.create_secondWhigt.getTitle)
                              .formatt_hms(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 119, 255, 8),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ].reversed.toList(),
    );
  }

  Row firstwight(Hivecontroller myType, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Gap(8),
        ///////////////////////////////////////////////////////////
        myType.canedit1 == false
            ? const Text(
                ":  الوزن الاول ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            : GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    var record = myType.temprecord;
                    record!.firstShot = context
                        .read<ImcomingValueporvider>()
                        .nowValu
                        .to_double();
                        if (myType.cam1!=null) {
                           String.fromCharCodes(myType.cam1!.toList());
                        }
                        if (myType.cam2!=null) {
                           String.fromCharCodes(myType.cam2!.toList());
                        }
                    record.carNum = myType.carnumcontroller.text.to_int();
                    record.driverName = context
                        .read<Hivecontroller>()
                        .drivernamecontroller
                        .text;
                    record.customerName =
                        context.read<Hivecontroller>().customercontroller.text;
                    record.prodcutName =
                        context.read<Hivecontroller>().itemcontroller.text;
                    record.notes =
                        context.read<Hivecontroller>().notescontroller.text;
                    record.actions
                        .add(WhigtTecketAction.create_fristWhight.add);
                    myType.canedit1 = false;
                    myType.updateRecord(record);
                  }
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
        ////////////////////////////////////////////////////////////
        const Gap(18),
        myType.temprecord!.actions.if_action_exist(
                    WhigtTecketAction.create_fristWhight.getTitle) ==
                false
            ? const SizedBox()
            : Row(
                children: [
                  Text(myType.temprecord!.firstShot.toStringAsFixed(0),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500)),
                  const Gap(22),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        Text(
                          myType.temprecord!.actions.reversed
                              .toList()
                              .get_Date_of_action(
                                  WhigtTecketAction.create_fristWhight.getTitle)
                              .formatt_yMd(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 119, 255, 8),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        Text(
                          myType.temprecord!.actions.reversed
                              .toList()
                              .get_Date_of_action(
                                  WhigtTecketAction.create_fristWhight.getTitle)
                              .formatt_hms(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 119, 255, 8),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ].reversed.toList(),
    );
  }
}
