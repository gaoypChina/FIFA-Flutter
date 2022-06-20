

abstract class SaveAbstract{

  dataModel(int gameSaveNumber);

  saveGameToDatabase(int gameSaveNumber){  }

  updateGameToDatabase(int gameSaveNumber){  }

  Future<dynamic> getGameFromDatabase(int gameSaveNumber) async{}

  defineSQLModel(int gameSaveNumber){  }

}
