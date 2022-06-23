import 'package:fifa/classes/jogador.dart';
import 'package:fifa/database/key_names.dart';
import 'package:fifa/database/save_games/model/save_abstract.dart';
import 'package:fifa/database/save_games/model/sql_model.dart';
import 'package:fifa/database/save_games/model/sql_model_structure.dart';
import 'package:fifa/database/save_games/player_save/player_save_data.dart';
import 'package:fifa/functions/end_year_updates/update_data_year.dart';
import 'package:fifa/global_variables.dart';

class SaveInfosPlayers extends SaveAbstract{

  @override
  PlayerSaveData dataModel(int gameSaveNumber){
    Jogador player = Jogador(index: 1); //valor genérico só pra criar o datamodel
    return PlayerSaveData(
      id: player.index,
      name: player.name,
      age: player.age,
      clubID: player.clubID,
      position: player.position,
      overall: player.overall,
      nationality: player.nationality,
      imageUrl: player.imageUrl,
    );
  }

  @override
  saveGameToDatabase(int gameSaveNumber) async{
    //CRIA O MODELO DO DATABASE
    SQLModel sqlModel = defineSQLModel(gameSaveNumber);
    //VERIFICA SE A TABELA EXISTE
    SQLModelStructure(sqlModel: sqlModel).createDataTable();
    //EXECUTA
    for (int i=0; i<globalJogadoresIndex.length;i++){
      sqlModel.object = PlayerSaveData(
        id: globalJogadoresIndex[i],
        name: globalJogadoresName[i],
        age: globalJogadoresAge[i],
        clubID: globalJogadoresClubIndex[i],
        overall: globalJogadoresOverall[i],
        position: globalJogadoresPosition[i],
        nationality: globalJogadoresNationality[i],
        imageUrl: globalJogadoresImageUrl[i],
      );

      await SQLModelStructure(sqlModel: sqlModel).insertDataTable();
    }
  }

  @override
  updateGameToDatabase(int gameSaveNumber) async{
    //CRIA O MODELO DO DATABASE
    SQLModel sqlModel = defineSQLModel(gameSaveNumber);
    //VERIFICA SE A TABELA EXISTE
    SQLModelStructure(sqlModel: sqlModel).createDataTable();
    //EXECUTA
    for (int i=0; i<globalJogadoresIndex.length;i++){
      sqlModel.object = PlayerSaveData(
        id: globalJogadoresIndex[i],
        name: globalJogadoresName[i],
        age: globalJogadoresAge[i],
        clubID: globalJogadoresClubIndex[i],
        overall: globalJogadoresOverall[i],
        position: globalJogadoresPosition[i],
        nationality: globalJogadoresNationality[i],
        imageUrl: globalJogadoresImageUrl[i],
      );

      await SQLModelStructure(sqlModel: sqlModel).updateTable();
    }
  }

  @override
  Future getGameFromDatabase(int gameSaveNumber) async{
    SQLModel sqlModel = defineSQLModel(gameSaveNumber);

    //Vai pegar
    List list = await SQLModelStructure(sqlModel: sqlModel).funcSavedAllDataResult();

    if(list.length>1000){

      resetPlayersData();
      resetData();

      for (PlayerSaveData row in list){
        //print(row.printToString());
        globalJogadoresIndex.add(row.id);
        globalJogadoresName.add(row.name);
        globalJogadoresAge.add(row.age);
        globalJogadoresClubIndex.add(row.clubID);
        globalJogadoresOverall.add(row.overall);
        globalJogadoresPosition.add(row.position);
        globalJogadoresNationality.add(row.nationality);
        globalJogadoresImageUrl.add(row.imageUrl);
      }
    }
  }

  @override
  SQLModel defineSQLModel(int gameSaveNumber){
    SQLModel sqlModel = SQLModel();
    sqlModel.databasePath = 's3ave$gameSaveNumber.db';
    sqlModel.tableName = 'players';
    PlayerSaveData playerSaveData = SaveInfosPlayers().dataModel(gameSaveNumber);
    sqlModel.object = playerSaveData;
    sqlModel.sqlCreateTable = 'CREATE TABLE IF NOT EXISTS ${sqlModel.tableName}(${KeyNames().idKey} INTEGER PRIMARY KEY AUTOINCREMENT,'
        ' ${KeyNames().nameKey} TEXT,'
        ' ${KeyNames().ageKey} INTEGER,'
        ' ${KeyNames().positionKey} TEXT,'
        ' ${KeyNames().clubIDKey} INTEGER,'
        ' ${KeyNames().overallKey} INTEGER,'
        ' ${KeyNames().nationalityKey} TEXT,'
        ' ${KeyNames().imagePlayerKey} TEXT'
        ')';
    return sqlModel;
  }

}