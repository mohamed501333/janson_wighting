// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types
import 'dart:async';

import 'package:advanced_search/advanced_search.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janson_wighting/app.dart';
import 'package:janson_wighting/valuesController.dart';
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
        create: (context) => valuesControllers(),
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
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
                   context.read<ImcomingValueporvider>().Refrech_UI();

      
;
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 9, 116, 238),
        ),
        backgroundColor: const Color.fromARGB(255, 10, 102, 206),
        body: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //black item
          WhightInput(),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              weightInfo(),
              SizedBox(
                width: 9,
              ),
              wightTecket(),
              SizedBox(
                width: 9,
              )
            ],
          ),

          //test buttom
          Test(),
        ],
      ),
    );
  }
}

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
                    context.read<valuesControllers>().assignValue(val);
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
                Consumer<valuesControllers>(
                  builder: (context, myType, child) {
                    return Text("${myType.firstWeight}",
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
  const wightTecket({
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
                  "بيانات تذكرة الوزن",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //رقم السياره
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
              child: AdvancedSearch(
                searchItems: const ["1", "2"],
                maxElementsToDisplay: 4,
                singleItemHeight: 40,
                borderColor: Colors.grey,
                minLettersForSearch: 1,
                selectedTextColor: const Color.fromARGB(255, 2, 2, 2),
                fontSize: 22,
                borderRadius: 12.0,
                hintText: '       رقم السيارة',
                cursorColor: Colors.white,
                autoCorrect: false,
                focusedBorderColor: Colors.blue,
                searchResultsBgColor: const Color(0x00fafafa),
                disabledBorderColor: Colors.cyan,
                enabledBorderColor: Colors.black,
                enabled: true,
                caseSensitive: false,
                inputTextFieldBgColor: Colors.white10,
                clearSearchEnabled: true,
                itemsShownAtStart: 2,
                searchMode: SearchMode.CONTAINS,
                showListOfResults: true,
                unSelectedTextColor: Colors.black54,
                verticalPadding: 10,
                horizontalPadding: 10,
                hideHintOnTextInputFocus: true,
                hintTextColor: Colors.white,
                onItemTap: (index, value) {},
                onSearchClear: () {
                  print("Cleared Search");
                },
                onSubmitted: (searchText, listOfResults) {
                  print("Submitted: $searchText");
                },
                onEditingProgress: (searchText, listOfResults) {
                  print("TextEdited: $searchText");
                  print("LENGTH: ${listOfResults.length}");
                },
              ),
            ),
            //اسم السائق
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
              child: AdvancedSearch(
                searchItems: const ["1", "2"],
                maxElementsToDisplay: 4,
                singleItemHeight: 40,
                borderColor: Colors.grey,
                minLettersForSearch: 1,
                selectedTextColor: const Color.fromARGB(255, 2, 2, 2),
                fontSize: 22,
                borderRadius: 12.0,
                hintText: '       اسم السائق',
                cursorColor: Colors.white,
                autoCorrect: false,
                focusedBorderColor: Colors.blue,
                searchResultsBgColor: const Color(0x00fafafa),
                disabledBorderColor: Colors.cyan,
                enabledBorderColor: Colors.black,
                enabled: true,
                caseSensitive: false,
                inputTextFieldBgColor: Colors.white10,
                clearSearchEnabled: true,
                itemsShownAtStart: 2,
                searchMode: SearchMode.CONTAINS,
                showListOfResults: true,
                unSelectedTextColor: Colors.black54,
                verticalPadding: 10,
                horizontalPadding: 10,
                hideHintOnTextInputFocus: true,
                hintTextColor: Colors.white,
                onItemTap: (index, value) {},
                onSearchClear: () {
                  print("Cleared Search");
                },
                onSubmitted: (searchText, listOfResults) {
                  print("Submitted: $searchText");
                },
                onEditingProgress: (searchText, listOfResults) {
                  print("TextEdited: $searchText");
                  print("LENGTH: ${listOfResults.length}");
                },
              ),
            ),
            //رقم السياره
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
              child: AdvancedSearch(
                searchItems: const ["1", "2"],
                maxElementsToDisplay: 4,
                singleItemHeight: 40,
                borderColor: Colors.grey,
                minLettersForSearch: 1,
                selectedTextColor: const Color.fromARGB(255, 2, 2, 2),
                fontSize: 22,
                borderRadius: 12.0,
                hintText: '       اسم العميل',
                cursorColor: Colors.white,
                autoCorrect: false,
                focusedBorderColor: Colors.blue,
                searchResultsBgColor: const Color(0x00fafafa),
                disabledBorderColor: Colors.cyan,
                enabledBorderColor: Colors.black,
                enabled: true,
                caseSensitive: false,
                inputTextFieldBgColor: Colors.white10,
                clearSearchEnabled: true,
                itemsShownAtStart: 2,
                searchMode: SearchMode.CONTAINS,
                showListOfResults: true,
                unSelectedTextColor: Colors.black54,
                verticalPadding: 10,
                horizontalPadding: 10,
                hideHintOnTextInputFocus: true,
                hintTextColor: Colors.white,
                onItemTap: (index, value) {},
                onSearchClear: () {
                  print("Cleared Search");
                },
                onSubmitted: (searchText, listOfResults) {
                  print("Submitted: $searchText");
                },
                onEditingProgress: (searchText, listOfResults) {
                  print("TextEdited: $searchText");
                  print("LENGTH: ${listOfResults.length}");
                },
              ),
            ),
            // العميل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
              child: AdvancedSearch(
                searchItems: const ["1", "2"],
                maxElementsToDisplay: 4,
                singleItemHeight: 40,
                borderColor: Colors.grey,
                minLettersForSearch: 1,
                selectedTextColor: const Color.fromARGB(255, 2, 2, 2),
                fontSize: 22,
                borderRadius: 12.0,
                hintText: '        العميل',
                cursorColor: Colors.white,
                autoCorrect: false,
                focusedBorderColor: Colors.blue,
                searchResultsBgColor: const Color(0x00fafafa),
                disabledBorderColor: Colors.cyan,
                enabledBorderColor: Colors.black,
                enabled: true,
                caseSensitive: false,
                inputTextFieldBgColor: Colors.white10,
                clearSearchEnabled: true,
                itemsShownAtStart: 2,
                searchMode: SearchMode.CONTAINS,
                showListOfResults: true,
                unSelectedTextColor: Colors.black54,
                verticalPadding: 10,
                horizontalPadding: 10,
                hideHintOnTextInputFocus: true,
                hintTextColor: Colors.white,
                onItemTap: (index, value) {},
                onSearchClear: () {
                  print("Cleared Search");
                },
                onSubmitted: (searchText, listOfResults) {
                  print("Submitted: $searchText");
                },
                onEditingProgress: (searchText, listOfResults) {
                  print("TextEdited: $searchText");
                  print("LENGTH: ${listOfResults.length}");
                },
              ),
            ),
            // اسم الصنف
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
              child: AdvancedSearch(
                searchItems: const ["1", "2"],
                maxElementsToDisplay: 4,
                singleItemHeight: 40,
                borderColor: Colors.grey,
                minLettersForSearch: 1,
                selectedTextColor: const Color.fromARGB(255, 2, 2, 2),
                fontSize: 22,
                borderRadius: 12.0,
                hintText: '       اسم الصنف',
                cursorColor: Colors.white,
                autoCorrect: false,
                focusedBorderColor: Colors.blue,
                searchResultsBgColor: const Color(0x00fafafa),
                disabledBorderColor: Colors.cyan,
                enabledBorderColor: Colors.black,
                enabled: true,
                caseSensitive: false,
                inputTextFieldBgColor: Colors.white10,
                clearSearchEnabled: true,
                itemsShownAtStart: 2,
                searchMode: SearchMode.CONTAINS,
                showListOfResults: true,
                unSelectedTextColor: Colors.black54,
                verticalPadding: 10,
                horizontalPadding: 10,
                hideHintOnTextInputFocus: true,
                hintTextColor: Colors.white,
                onItemTap: (index, value) {},
                onSearchClear: () {
                  print("Cleared Search");
                },
                onSubmitted: (searchText, listOfResults) {
                  print("Submitted: $searchText");
                },
                onEditingProgress: (searchText, listOfResults) {
                  print("TextEdited: $searchText");
                  print("LENGTH: ${listOfResults.length}");
                },
              ),
            ),
            //رقم ازن التسليم
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
              child: AdvancedSearch(
                searchItems: const ["1", "2"],
                maxElementsToDisplay: 4,
                singleItemHeight: 40,
                borderColor: Colors.grey,
                minLettersForSearch: 1,
                selectedTextColor: const Color.fromARGB(255, 2, 2, 2),
                fontSize: 22,
                borderRadius: 12.0,
                hintText: '       رقم ازن التسليم',
                cursorColor: Colors.white,
                autoCorrect: false,
                focusedBorderColor: Colors.blue,
                searchResultsBgColor: const Color(0x00fafafa),
                disabledBorderColor: Colors.cyan,
                enabledBorderColor: Colors.black,
                enabled: true,
                caseSensitive: false,
                inputTextFieldBgColor: Colors.white10,
                clearSearchEnabled: true,
                itemsShownAtStart: 2,
                searchMode: SearchMode.CONTAINS,
                showListOfResults: true,
                unSelectedTextColor: Colors.black54,
                verticalPadding: 10,
                horizontalPadding: 10,
                hideHintOnTextInputFocus: true,
                hintTextColor: Colors.white,
                onItemTap: (index, value) {},
                onSearchClear: () {
                  print("Cleared Search");
                },
                onSubmitted: (searchText, listOfResults) {
                  print("Submitted: $searchText");
                },
                onEditingProgress: (searchText, listOfResults) {
                  print("TextEdited: $searchText");
                  print("LENGTH: ${listOfResults.length}");
                },
              ),
            ),
            //ملاحزات
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
              child: AdvancedSearch(
                searchItems: const ["1", "2"],
                maxElementsToDisplay: 4,
                singleItemHeight: 40,
                borderColor: Colors.grey,
                minLettersForSearch: 1,
                selectedTextColor: const Color.fromARGB(255, 2, 2, 2),
                fontSize: 22,
                borderRadius: 12.0,
                hintText: '       ملاحظات',
                cursorColor: Colors.white,
                autoCorrect: false,
                focusedBorderColor: Colors.blue,
                searchResultsBgColor: const Color(0x00fafafa),
                disabledBorderColor: Colors.cyan,
                enabledBorderColor: Colors.black,
                enabled: true,
                caseSensitive: false,
                inputTextFieldBgColor: Colors.white10,
                clearSearchEnabled: true,
                itemsShownAtStart: 2,
                searchMode: SearchMode.CONTAINS,
                showListOfResults: true,
                unSelectedTextColor: Colors.black54,
                verticalPadding: 10,
                horizontalPadding: 10,
                hideHintOnTextInputFocus: true,
                hintTextColor: Colors.white,
                onItemTap: (index, value) {},
                onSearchClear: () {
                  print("Cleared Search");
                },
                onSubmitted: (searchText, listOfResults) {
                  print("Submitted: $searchText");
                },
                onEditingProgress: (searchText, listOfResults) {
                  print("TextEdited: $searchText");
                  print("LENGTH: ${listOfResults.length}");
                },
              ),
            ),
          ],
        ),
      ),
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
            child: Consumer<ImcomingValueporvider>(
              builder: (context, myType, child) {
                return Text(myType.nowValu,
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
