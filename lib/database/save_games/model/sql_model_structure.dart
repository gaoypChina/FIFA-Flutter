import 'dart:io';
import 'dart:math';

import 'package:fifa/database/save_games/model/sql_model.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class SQLModelStructure{
//https://docs.flutter.dev/cookbook/persistence/sqlite

  //VÁRIAVEIS UNIVERSAIS
  late SQLModel sqlModel;

  SQLModelStructure({required this.sqlModel});

  static Database? _database;
  Future<Database> get database async {
    if (_database != null && _database!.path.contains(sqlModel.databasePath)) return _database!;

    //print('creating Database');
    _database = await initDB();
    return _database!;
  }

  checkDatabaseSize(){
    var file = File('/data/user/0/com.marcos.fifa/databases/${sqlModel.databasePath}');
    int bytes = file.lengthSync();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    String value = ((bytes / pow(1024, i)).toStringAsFixed(2)) + ' ' + suffixes[i];
    customToast('Database ${sqlModel.databasePath} \nSize: $value');
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
      join(await getDatabasesPath(), sqlModel.databasePath),
      version: 1,

      onCreate: (db, version) {
        return db.execute(
          sqlModel.sqlCreateTable,
        );
      },
    );
    return database;
  }

  Future<void> createDataTable() async {
    final db = await database;
    await db.execute(
      sqlModel.sqlCreateTable,
    );
  }

  Future<void> insertDataTable() async {
    final db = await database;
    await db.insert(
      sqlModel.tableName,
      sqlModel.object.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTable() async {
    // Get a reference to the database.
    final db = await database;

    // Update the given PlayerSaveData.
    await db.update(
      sqlModel.tableName,
      sqlModel.object.toMap(),
      // Ensure that the PlayerSaveData has a matching id.
      where: 'id = ?',
      // Pass the PlayerSaveData's id as a whereArg to prevent SQL injection.
      whereArgs: [sqlModel.object.id],
    );
  }

  Future<void> deleteDataTable(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the PlayerSaveData from the database.
    await db.delete(
      sqlModel.tableName,
      // Use a `where` clause to delete a specific favorite.
      where: 'id = ?',
      // Pass the PlayerSaveData's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }


  Future<List<dynamic>> funcSavedAllDataResult() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(sqlModel.tableName);

    // Convert the List<Map<String, dynamic> into a List<PlayerSaveData>.
    return List.generate(maps.length, (i) {
      return sqlModel.object.toClass(maps, i);
    });

  }


}
