import 'dart:io';
import 'dart:math';

import 'package:fifa/database/key_names.dart';
import 'package:fifa/database/local_database/shared_preferences.dart';
import 'package:fifa/database/save_games/player_save/player_save_data.dart';
import 'package:fifa/functions/end_year_updates/update_data_year.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

class SaveSQL{
//https://docs.flutter.dev/cookbook/persistence/sqlite

  //VÁRIAVEIS UNIVERSAIS
  String databasePath = 'teste0000.db';
  final String tablePlayerSaveData = 'players';

  static Database? _database;
  Future<Database> get database async {
    await setDatabasePath();
    if (_database != null && _database!.path.contains(databasePath)) return _database!;

    //print('creating Database');
    _database = await initDB();
    return _database!;
  }

  checkDatabaseSize(){
    var file = File('/data/user/0/com.marcos.fifa/databases/teste000$globalSaveNumber.db');
    int bytes = file.lengthSync();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    String value = ((bytes / pow(1024, i)).toStringAsFixed(2)) + ' ' + suffixes[i];
    customToast('Database $globalSaveNumber\nSize: $value');
  }

  Future setDatabasePath() async {
    //DEPENDENDO DO SAVE, SALVA EM UM DATABASE DIFERENTE
    globalSaveNumber = (await SharedPreferenceHelper().getsharedSaveNumber())!;
    databasePath =  'teste000$globalSaveNumber.db';
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
              ' ${KeyNames().nameKey} TEXT,'
              ' ${KeyNames().ageKey} INTEGER,'
              ' ${KeyNames().positionKey} TEXT,'
              ' ${KeyNames().clubIDKey} INTEGER,'
              ' ${KeyNames().overallKey} INTEGER,'
              ' ${KeyNames().nationalityKey} TEXT,'
              ' ${KeyNames().imagePlayerKey} TEXT'
              ')',
        );
      },
    );
    return database;
  }

  Future<void> insertPlayerSaveData(PlayerSaveData players) async {
    final db = await database;

    await db.insert(
      tablePlayerSaveData,
      players.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updatePlayerSaveData(PlayerSaveData players) async {
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

  Future<List<PlayerSaveData>> funcPlayerSavedDataResult() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(tablePlayerSaveData);

    // Convert the List<Map<String, dynamic> into a List<PlayerSaveData>.
    return List.generate(maps.length, (i) {
      return PlayerSaveData(
        id: maps[i][KeyNames().idKey],
        name: maps[i][KeyNames().nameKey],
        age: maps[i][KeyNames().ageKey],
        clubID: maps[i][KeyNames().clubIDKey],
        position: maps[i][KeyNames().positionKey],
        overall: maps[i][KeyNames().overallKey],
        nationality: maps[i][KeyNames().nationalityKey],
        imageUrl: maps[i][KeyNames().imagePlayerKey],
      );
    });
  }

  printDatabaseValues() async{
    List<PlayerSaveData> list = await funcPlayerSavedDataResult();
    for (PlayerSaveData row in list){
      print(row.printToString());
    }
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
    for (int i=0; i<globalJogadoresIndex.length;i++){
      PlayerSaveData player = PlayerSaveData(
        id: globalJogadoresIndex[i],
        name: globalJogadoresName[i],
        age: globalJogadoresAge[i],
        clubID: globalJogadoresClubIndex[i],
        overall: globalJogadoresOverall[i],
        position: globalJogadoresPosition[i],
        nationality: globalJogadoresNationality[i],
        imageUrl: globalJogadoresImageUrl[i],
      );

      insertPlayerSaveData(player);
    }
  }

  Future getAllPlayerFromDatabase() async{
    List<PlayerSaveData> list = await funcPlayerSavedDataResult();
    if(list.isNotEmpty){

      resetPlayersData();
      resetData();

      for (PlayerSaveData row in list){
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

}