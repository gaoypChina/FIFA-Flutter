import 'package:fifa/database/local_database/shared_preferences.dart';
import 'package:fifa/database/sql.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';



popUpSaveAllData({required BuildContext context}){

  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: Text(Translation(context).text.saveWhereQuestion,style: EstiloTextoPreto.text16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            for(int nSave=1; nSave<=globalMaxSavesPermitted; nSave++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                  onTap:() async {
                    globalSaveNumber = nSave;
                    await SharedPreferenceHelper().savesharedSaveNumber(globalSaveNumber);
                    customToast('${Translation(context).text.saveWhereAnswer}: Save $nSave');

                    Navigator.of(context).pop();
                    Navigator.of(context).pop();

                    await SaveSQL().saveAllPlayersToDatabase();
                    customToast('done');
                  },
                  child: Text('${Translation(context).text.save} $nSave', style:  EstiloTextoPreto.underline14,)
              ),
            ),

          ],
        ),
        actions: <Widget>[
          TextButton(
              child: Text(Translation(context).text.cancel,style: EstiloTextoPreto.text16,),
              onPressed: (){
                Navigator.of(context).pop();
              }
          ),
        ],
      );
    },
  );

}