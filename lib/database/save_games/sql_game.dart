import 'dart:io';
import 'dart:math';

import 'package:fifa/database/key_names.dart';
import 'package:fifa/database/save_games/basic_game_infos.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

class SaveSQLGame{
//https://docs.flutter.dev/cookbook/persistence/sqlite

  //VÁRIAVEIS UNIVERSAIS
  String databasePath = 'testex0005.db';
  final String tableSaveData = 'infos_table';
  late int saveGameNumber;

  static Database? _database;
  Future<Database> get database async {
    if (_database != null && _database!.path.contains(databasePath)) return _database!;

    print('creating Database $databasePath');
    _database = await initDB();
    return _database!;
  }

  checkDatabaseSize(){
    var file = File('/data/user/0/com.marcos.fifa/databases/testes000$saveGameNumber.db');
    int bytes = file.lengthSync();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    String value = ((bytes / pow(1024, i)).toStringAsFixed(2)) + ' ' + suffixes[i];
    customToast('Database $saveGameNumber\nSize: $value');
  }


  Future<Database> initDB() async{
    // Avoid errors caused by flutter upgrade.
    // Importing 'package:flutter/widgets.dart' is required.
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), databasePath),
      version: 1,

      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE IF NOT EXISTS $tableSaveData(${KeyNames().idKey} INTEGER PRIMARY KEY AUTOINCREMENT,'
              ' ${KeyNames().yearKey} INTEGER,'
              ' ${KeyNames().weekKey} INTEGER,'
              ' ${KeyNames().rodadaKey} INTEGER,'
              ' ${KeyNames().moneyKey} DOUBLE,'
              ' ${KeyNames().difficultyKey} INTEGER,'
              ' ${KeyNames().expectativaKey} INTEGER,'
              ' ${KeyNames().coachPointsKey} INTEGER,'
              ' ${KeyNames().coachNameKey} STRING,'
              ' ${KeyNames().myClubIDKey} INTEGER'
              ')',
        );
      },
    );
    return database;
  }

  Future<void> insertSaveData(BasicGameInfos infos) async {
    final db = await database;

    await db.insert(
      tableSaveData,
      infos.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateSaveData(BasicGameInfos infos) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given PlayerSaveData.
    await db.update(
      tableSaveData,
      infos.toMap(),
      // Ensure that the PlayerSaveData has a matching id.
      where: 'id = ?',
      // Pass the PlayerSaveData's id as a whereArg to prevent SQL injection.
      whereArgs: [infos.id],
    );
  }

  Future<void> deletePlayerSaveData(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the PlayerSaveData from the database.
    await db.delete(
      tableSaveData,
      // Use a `where` clause to delete a specific favorite.
      where: 'id = ?',
      // Pass the PlayerSaveData's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<List<BasicGameInfos>> funcSavedDataResult() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(tableSaveData);

    // Convert the List<Map<String, dynamic> into a List<PlayerSaveData>.
    return List.generate(maps.length, (i) {
      return BasicGameInfos(
        id: maps[i][KeyNames().idKey],
        myClubID: maps[i][KeyNames().myClubIDKey],
        year: maps[i][KeyNames().yearKey],
        week: maps[i][KeyNames().weekKey],
        rodada0: maps[i][KeyNames().rodadaKey],
        money: maps[i][KeyNames().moneyKey],
        difficulty: maps[i][KeyNames().difficultyKey],
        expectativa: maps[i][KeyNames().expectativaKey],
        coachPoints: maps[i][KeyNames().coachPointsKey],
        coachName: maps[i][KeyNames().coachNameKey],
      );
    });

  }

  ///////////////////////////////////////////////////////////////////////////
  BasicGameInfos dataModel(int saveGameNumberLocal){
    saveGameNumber = saveGameNumberLocal;
    return BasicGameInfos(
      id: saveGameNumberLocal,
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
  saveGameToDatabase(int saveGameNumberLocal){
    BasicGameInfos gameInfos = dataModel(saveGameNumberLocal);
    insertSaveData(gameInfos);
  }
  updateGameToDatabase(int saveGameNumberLocal){
    BasicGameInfos gameInfos = dataModel(saveGameNumberLocal);
    updateSaveData(gameInfos);
  }


  Future<BasicGameInfos> getGameFromDatabase(int gameSave) async{
    List<BasicGameInfos> list = await funcSavedDataResult();
    if(list.isNotEmpty){
      BasicGameInfos basicGameInfos = list[gameSave];
      return basicGameInfos;
    }
    throw Exception('Save don\'t exist');
  }



}