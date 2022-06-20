import 'package:fifa/database/key_names.dart';
import 'package:fifa/database/save_games/game_save/basic_game_infos.dart';
import 'package:fifa/database/save_games/model/save_abstract.dart';
import 'package:fifa/database/save_games/model/sql_model.dart';
import 'package:fifa/database/save_games/model/sql_model_structure.dart';
import 'package:fifa/global_variables.dart';

class SaveInfosGame extends SaveAbstract{

  @override
  BasicGameInfos dataModel(int gameSaveNumber){
    return BasicGameInfos(
      id: gameSaveNumber,
      myClubID: globalMyClubID,
      year: ano,
      week: semana,
      rodada0: rodada,
      money: globalMyMoney,
      difficulty: globalDificuldade,
      expectativa: globalMyExpectativa,
      coachPoints: globalCoachPoints,
      coachName: globalCoachName,
    );
  }

  @override
  saveGameToDatabase(int gameSaveNumber){
    //CRIA O MODELO DO DATABASE
    SQLModel sqlModel = defineSQLModel(gameSaveNumber);
    SQLModelStructure(sqlModel: sqlModel).insertDataTable();
  }

  @override
  updateGameToDatabase(int gameSaveNumber){
    //CRIA O MODELO DO DATABASE
    SQLModel sqlModel = defineSQLModel(gameSaveNumber);
    SQLModelStructure(sqlModel: sqlModel).updateTable();
  }

  deleteDatabase(int gameSaveNumber){
    //CRIA O MODELO DO DATABASE
    SQLModel sqlModel = defineSQLModel(gameSaveNumber);
  }

  
  @override
  Future<dynamic> getGameFromDatabase(int gameSaveNumber) async{
    //CRIA O MODELO DO DATABASE
    SQLModel sqlModel = defineSQLModel(gameSaveNumber);

    //Vai pegar
    List list = await SQLModelStructure(sqlModel: sqlModel).funcSavedAllDataResult();
    if(list.isNotEmpty){
      dynamic object = list.first;
      return object;
    }
    throw Exception('Save don\'t exist');
  }

  @override
  SQLModel defineSQLModel(int gameSaveNumber){
    SQLModel sqlModel = SQLModel();
    sqlModel.databasePath = 's2ave$gameSaveNumber.db';
    sqlModel.tableName = 'infos_table';
    BasicGameInfos basicGameInfos = SaveInfosGame().dataModel(gameSaveNumber);
    sqlModel.object = basicGameInfos;
    sqlModel.sqlCreateTable = 'CREATE TABLE IF NOT EXISTS ${sqlModel.tableName}(${KeyNames().idKey} INTEGER PRIMARY KEY AUTOINCREMENT,'
        ' ${KeyNames().yearKey} INTEGER,'
        ' ${KeyNames().weekKey} INTEGER,'
        ' ${KeyNames().rodadaKey} INTEGER,'
        ' ${KeyNames().moneyKey} DOUBLE,'
        ' ${KeyNames().difficultyKey} INTEGER,'
        ' ${KeyNames().expectativaKey} INTEGER,'
        ' ${KeyNames().coachPointsKey} INTEGER,'
        ' ${KeyNames().coachNameKey} STRING,'
        ' ${KeyNames().myClubIDKey} INTEGER'
        ')';
    return sqlModel;
  }

}