import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

popUpSimulation({required BuildContext context, required int week, required String name, required Function()? function}){
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: const Text("Simulate", style: EstiloTextoPreto.text16),
        content: Text("Do you want to simulate the matchs until week $week/$name?", style:  EstiloTextoPreto.text14,),
        actions: <Widget>[
          TextButton(
              child: Text(Translation(context).text.cancel,style: EstiloTextoPreto.text16,),
              onPressed: (){
                Navigator.of(context).pop();
              }
          ),
          TextButton(
              child: const Text("OK",style: EstiloTextoPreto.text16,),
              onPressed: (){
                function!();
                Navigator.of(context).pop();
              }
          ),
        ],
      );
    },
  );
}