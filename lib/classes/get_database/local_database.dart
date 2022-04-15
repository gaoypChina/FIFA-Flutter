import 'package:fifa/classes/get_database/read_csv.dart';
import 'package:fifa/database/shared_preferences.dart';
import 'package:fifa/global_variables.dart';

class GetLocalDatabase{

  getCustomizedData() async {

    if(globalSaveNumber>0) {
      try{
        globalJogadoresIndex =[];
        //TIRA OS ESPAÇOS DAS STRINGS
        for (int i = 0; i < globalSaveData[globalSaveNumber][1].length; i++) {
          globalSaveData[globalSaveNumber][0][i] = globalSaveData[globalSaveNumber][0][i].toString().trim();
          globalSaveData[globalSaveNumber][1][i] = globalSaveData[globalSaveNumber][1][i].toString().trim();
          globalSaveData[globalSaveNumber][2][i] = globalSaveData[globalSaveNumber][2][i].toString().trim();
          globalSaveData[globalSaveNumber][3][i] = globalSaveData[globalSaveNumber][3][i].toString().trim();
          globalSaveData[globalSaveNumber][4][i] = globalSaveData[globalSaveNumber][4][i].toString().trim();

          globalJogadoresIndex.add(i);
        }

        globalJogadoresName = List.from(globalSaveData[globalSaveNumber][0]);
        globalJogadoresClubIndex = List.from(globalSaveData[globalSaveNumber][1].map((e)=>int.parse(e)).toList()); //convert list<string> to list<int>
        globalJogadoresAge = List.from(globalSaveData[globalSaveNumber][2].map((e)=>int.parse(e)).toList());//convert list<string> to list<int>
        globalJogadoresOverall = List.from(globalSaveData[globalSaveNumber][3].map((e)=>int.parse(e)).toList());//convert list<string> to list<int>
        globalJogadoresPosition = List.from(globalSaveData[globalSaveNumber][4]);

      }catch(e){
        print(e);
        //SE der erro vai pro database padrão
        print('ERRO Customized Data, Database: $globalSaveNumber');
        globalSaveNumber = 0;
        await ReadCSV().openCSV();
      }
    }else{
      await ReadCSV().openCSV();
    }

    await SharedPreferenceHelper().savesharedSaveNumber(globalSaveNumber);
  }
}
