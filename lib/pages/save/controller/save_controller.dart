import 'package:fifa/database/save_games/game_save/basic_game_infos.dart';
import 'package:fifa/database/save_games/game_save/save_infos_game.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';

class SaveController{

  List<BasicGameInfos> basicGameInfos = [];
  late BasicGameInfos basicGameInfo;

  ////////////////////////////////////////////////////
  //GET GENERAL INFOS ABOUT THE SAVE
  getIndividualGameSaveInfos(int gameSaveNumber){
    basicGameInfo = basicGameInfos[gameSaveNumber];
  }

  getSaves() async{
    basicGameInfos = [];
    for(int i=0; i<globalMaxPossibleSaves;i++){
      try {
        BasicGameInfos basicGameInfo = await SaveInfosGame().getGameFromDatabase(i);
        //print(basicGameInfo.id.toString()+'ano: '+basicGameInfo.year.toString());
        basicGameInfos.add(basicGameInfo);
      }catch(e){
        //print('save $i don\'t exist');
      }
    }
  }

  //////////////////////////////////////////////////////////
  //ALL DATA
  getData(int gameSaveNumber) async{
      getIndividualGameSaveInfos(gameSaveNumber);
      basicGameInfo.saveGlobally();
   try{
      //await SaveInfosPlayers().getGameFromDatabase(gameSaveNumber);
    }catch(e){
      //print('Error Loading players);
    }
    customToast('Finished Loading');
  }

  saveData(int gameSaveNumber) async{
    await SaveInfosGame().saveGameToDatabase(gameSaveNumber);
    //await SaveInfosPlayers().saveGameToDatabase(gameSaveNumber);
    customToast('Finished Saving');
  }

  updateData(int gameSaveNumber) async{
    await SaveInfosGame().updateGameToDatabase(gameSaveNumber);
    //await SaveInfosPlayers().updateGameToDatabase(gameSaveNumber);
    customToast('Finished Saving');
  }

  deleteData(int gameSaveNumber) async{
    await SaveInfosGame().deleteDatabase(gameSaveNumber);
  }




}
