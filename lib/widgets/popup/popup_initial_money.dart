import 'package:fifa/pages/configuration/controller/configuration_state.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


popUpInitialMoney({required BuildContext context, required Function(ConfigurationState configurationState)? function}){
  ConfigurationState configurationState = ConfigurationState();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: Text(Translation(context).text.initialMoney + " "+Translation(context).text.inMillions,style: EstiloTextoPreto.text16),
        content: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(3), //max number characteres in Description
          ],
          onChanged: (value){
            configurationState.setInitialMoney(double.parse(value));
          },
        ),
        actions: <Widget>[
          TextButton(
              child: const Text('Padrão',style: EstiloTextoPreto.text16,),
              onPressed: (){
                configurationState.setInitialMoney(0);
                Navigator.of(context).pop();
              }
          ),
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