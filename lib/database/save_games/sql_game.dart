import 'dart:io';
import 'dart:math';

import 'package:fifa/database/key_names.dart';
import 'package:fifa/database/local_database/shared_preferences.dart';
import 'package:fifa/database/save_games/basic_game_infos.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

class SaveSQLGame{
//https://docs.flutter.dev/cookbook/persistence/sqlite

  //VÁRIAVEIS UNIVERSAIS
  String databasePath = 'testes0000.db';
  final String tablePlayerSaveData = 'players';
  int saveGameNumber = 0;

  static Database? _database;
  Future<Database> get database async {
    await setDatabasePath();
    if (_database != null && _database!.path.contains(databasePath)) return _database!;

    //print('creating Database');
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

  Future setDatabasePath() async {
    //DEPENDENDO DO SAVE, SALVA EM UM DATABASE DIFERENTE
    saveGameNumber = (await SharedPreferenceHelper().getsharedSaveGameNumber())!;
    databasePath =  'testes000$saveGameNumber.db';
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
          'CREATE TABLE IF NOT EXISTS $tablePlayerSaveData(${KeyNames().idKey} INTEGER PRIMARY KEY AUTOINCREMENT,'
              ' ${KeyNames().yearKey} INTEGER'
              ')',
        );
      },
    );
    return database;
  }

  Future<void> insertPlayerSaveData(BasicGameInfos players) async {
    final db = await database;

    await db.insert(
      tablePlayerSaveData,
      players.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updatePlayerSaveData(BasicGameInfos players) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given PlayerSaveData.
    await db.update(
      tablePlayerSaveData,
      players.toMap(),
      // Ensure that the PlayerSaveData has a matching id.
      where: 'id = ?',
      // Pass the PlayerSaveData's id as a whereArg to prevent SQL injection.
      whereArgs: [players.id],
    );
  }

  Future<List<BasicGameInfos>> funcPlayerSavedDataResult() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(tablePlayerSaveData);

    // Convert the List<Map<String, dynamic> into a List<PlayerSaveData>.
    return List.generate(maps.length, (i) {
      return BasicGameInfos(
        id: maps[i][KeyNames().idKey],
        year: maps[i][KeyNames().yearKey],
      );
    });
  }

  Future<void> deletePlayerSaveData(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the PlayerSaveData from the database.
    await db.delete(
      tablePlayerSaveData,
      // Use a `where` clause to delete a specific favorite.
      where: 'id = ?',
      // Pass the PlayerSaveData's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }


  ///////////////////////////////////////////////////////////////////////////
  saveAllPlayersToDatabase(){
      BasicGameInfos gameInfos = BasicGameInfos(
        id: saveGameNumber,
        year: ano,
      );

      insertPlayerSaveData(gameInfos);
  }

  Future getAllPlayerFromDatabase() async{
    List<BasicGameInfos> list = await funcPlayerSavedDataResult();
    if(list.isNotEmpty){
      for (BasicGameInfos row in list){
        globalJogadoresIndex[row.id] = row.id;
        globalJogadoresName[row.id] = row.year;
      }
    }

  }

}