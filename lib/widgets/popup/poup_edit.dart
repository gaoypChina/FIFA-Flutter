import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void popupEdit({
  required BuildContext context,
  required String title,
  required dynamic variable,
  required bool isStringType,
  required int maxNcharacters,
  required Function(dynamic variable)? functionOK}) {

  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: Text(title),
        content: TextFormField(
          keyboardType: isStringType ? TextInputType.name : TextInputType.number,
          minLines: 1,
          maxLines: 2,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxNcharacters), //max number characteres in Description
          ],
          onChanged: (value){
            variable = value;
          },
          initialValue: variable.toString(),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text(Translation(context).text.cancel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          // define os botões na base do dialogo
          ElevatedButton(
            child: Text(Translation(context).text.save),
            onPressed: () {
              functionOK!(variable);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}