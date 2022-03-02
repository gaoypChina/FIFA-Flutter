import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';


popUpOkCancelar({required BuildContext context, required String title, required String content, required Function()? function}){
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: Text(title,style: EstiloTextoPreto.text16),
        content: Text(content, style:  EstiloTextoPreto.text14,),
        actions: <Widget>[
          TextButton(
              child: const Text("Cancelar",style: EstiloTextoPreto.text16,),
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