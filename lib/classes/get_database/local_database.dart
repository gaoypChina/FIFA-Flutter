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

        globalJogadoresName = globalSaveData[globalSaveNumber][0];
        globalJogadoresClubIndex = globalSaveData[globalSaveNumber][1].map(int.parse).toList(); //convert list<string> to list<int>
        globalJogadoresAge = globalSaveData[globalSaveNumber][2].map(int.parse).toList();//convert list<string> to list<int>
        globalJogadoresOverall = globalSaveData[globalSaveNumber][3].map(int.parse).toList();//convert list<string> to list<int>
        globalJogadoresPosition = globalSaveData[globalSaveNumber][4];

      }catch(e){
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
