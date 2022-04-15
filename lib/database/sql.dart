import 'package:fifa/database/player_save_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sql{

  //VÁRIAVEIS UNIVERSAIS
  static String databasePath = 'players.db';
  static String tablePlayerSaveData = 'players';

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(databasePath);
    return _database!;
  }

  //CRIA O DATABASE
  Future<Database> _initDB(String filePath) async{
    //Determina o caminho do database
    final databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databasePath);

    return await openDatabase(path,version: 1,onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE IF NOT EXISTS $tablePlayerSaveData(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)',
      );
    },);
  }

  Future<void> insertPlayerSaveData(PlayerSaveData players) async {
    final db = await database;

    await db.insert(
      tablePlayerSaveData,
      players.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<PlayerSaveData>> funcPlayerSaveData() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(tablePlayerSaveData);

    // Convert the List<Map<String, dynamic> into a List<PlayerSaveData>.
    return List.generate(maps.length, (i) {
      return PlayerSaveData(
        id: maps[i]['id'],
        name: maps[i]['name'],
        clubID: maps[i]['clubID'],
        position: maps[i]['position'],
        overall: maps[i]['overall'],
        age: maps[i]['age'],
      );
    });
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


  //Funçao de teste se o database esta criado corretamente
  test() async {
    // Check if we have an existing copy first
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databasePath);
    // try opening (will work if it exists)
    try {
      Database db = await openDatabase(path, readOnly: true);
      print(db.toString());
    } catch (e) {
      print("Error $e");
    }
  }
}