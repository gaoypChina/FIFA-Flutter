import 'package:fifa/theme/textstyle.dart';

import 'package:flutter/material.dart';


popUpExpectativa({required BuildContext context, required String title, required String content}){
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: Text(title,style: EstiloTextoPreto.text16),
        content: Text(content, style:  EstiloTextoPreto.text14,),
        actions: <Widget>[
          TextButton(
              child: const Text("OK",style: EstiloTextoPreto.text16,),
              onPressed: (){
                Navigator.of(context).pop();
              }
          ),
        ],
      );
    },
  );
}