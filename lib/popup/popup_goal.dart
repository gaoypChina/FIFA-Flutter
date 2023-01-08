import 'package:fifa/page_controller/configuration/configuration_state.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

//TODO: FAZER O POPUP DE GOL
popUpGoal({required BuildContext context, required Function(ConfigurationState configurationState)? function}){
  ConfigurationState configurationState = ConfigurationState();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: Text('GOAL',style: EstiloTextoPreto.text16),
        content: Column(
          children: [

          ],
        ),
        actions: <Widget>[
          TextButton(
              child: const Text("OK",style: EstiloTextoPreto.text16,),
              onPressed: (){
                function!(configurationState);
                Navigator.of(context).pop();
              }
          ),
        ],
      );
    },
  );
}