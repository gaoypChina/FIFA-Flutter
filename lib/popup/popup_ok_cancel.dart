import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';


popUpOkCancel({required BuildContext context, required String title, required String content, required Function()? function}){
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: Text(title,style: EstiloTextoPreto.text16),
        content: Text(content, style:  EstiloTextoPreto.text14,),
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