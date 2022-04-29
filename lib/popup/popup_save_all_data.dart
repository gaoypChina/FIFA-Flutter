import 'package:fifa/database/shared_preferences.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';


popUpSaveAllData({required BuildContext context}){

  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: const Text('Deseja salvar todas as alterações em qual destino?',style: EstiloTextoPreto.text16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            for(int nSave=1; nSave<=globalMaxSavesPermitted; nSave++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                  onTap:() async {
                    globalSaveNumber = nSave;
                    globalSaveData = {};
                    globalSaveData[globalSaveNumber] = List.from(saveAllData(globalSaveNumber));
                    customToast('Salvo em: Save $nSave');
                    await SharedPreferenceHelper().savePlayersDatabase();
                    await SharedPreferenceHelper().savesharedSaveNumber(globalSaveNumber);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text('Save $nSave', style:  EstiloTextoPreto.underline14,)
              ),
            ),

          ],
        ),
        actions: <Widget>[
          TextButton(
              child: const Text("CANCELAR",style: EstiloTextoPreto.text16,),
              onPressed: (){
                Navigator.of(context).pop();
              }
          ),
        ],
      );
    },
  );

}

saveAllData(int i){
  return [globalJogadoresName,
    globalJogadoresClubIndex,
    globalJogadoresAge,
    globalJogadoresOverall,
    globalJogadoresPosition,
    globalJogadoresNationality];
}