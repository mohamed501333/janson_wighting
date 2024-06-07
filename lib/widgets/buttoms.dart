import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janson_wighting/main.dart';
import 'package:janson_wighting/providers.dart';
import 'package:janson_wighting/widgets/%D8%A8%D9%8A%D8%A7%D9%86%D8%A7%D8%AA%20%D8%A7%D9%84%D9%88%D8%B2%D9%86%20%D9%88%20%D8%A7%D9%84%D8%AA%D8%B2%D9%83%D8%B1%D9%87.dart';
import 'package:provider/provider.dart';

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
                    WidgetStatePropertyAll(Color.fromARGB(255, 203, 218, 7))),
            onPressed: () {        
                    context.read<Hivecontroller>().addNewRecord();
            },
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
                    WidgetStatePropertyAll(Color.fromARGB(255, 203, 218, 7))),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                    context.read<Hivecontroller>().temprecord=null;
                    context.read<Hivecontroller>().clearfields();
                    context.read<Hivecontroller>().Refrech_UI();
              }
                
            },
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
                    WidgetStatePropertyAll(Color.fromARGB(255, 203, 218, 7))),
            onPressed: () {gett();},
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'طباعة الوزنة فقط',
                style: TextStyle(fontSize: 18),
              ),
            )),
                    const Gap(9),

        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 203, 218, 7))),
            onPressed: () {gett();},
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'طباعة الوزنة والحمولة',
                style: TextStyle(fontSize: 18),
              ),
            )),
      ].reversed.toList(),
    );
  }
}
