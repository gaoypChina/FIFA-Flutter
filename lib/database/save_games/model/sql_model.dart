class SQLModel{

  late String databasePath;
  late String tableName;
  late dynamic object;
  String sqlCreateTable = '';

  printDatabaseSettings(){
    print('DATABASE: $databasePath TABLE: $tableName OBJECT: $object');
  }

}