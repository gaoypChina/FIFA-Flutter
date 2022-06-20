import 'package:fifa/database/key_names.dart';

class PlayerSaveData {
  final int id;
  final String name;
  final int age;
  final String position;
  final int clubID;
  final int overall;
  final String nationality;
  final String imageUrl;

  PlayerSaveData({
    required this.id,
    required this.name,
    required this.age,
    required this.clubID,
    required this.position,
    required this.overall,
    required this.nationality,
    required this.imageUrl,
  });

  printToString(){
    print('Jogador: ${KeyNames().idKey}: $id'
        ' ${KeyNames().nameKey}: $name'
        ' ${KeyNames().ageKey}: $age'
        ' ${KeyNames().clubIDKey}: $clubID'
        ' ${KeyNames().positionKey}: $position'
        ' ${KeyNames().overallKey}: $overall'
        ' ${KeyNames().nationalityKey}: $nationality'
        ' ${KeyNames().imagePlayerKey}: $imageUrl'
    );
  }

  // Convert a Favorite into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      KeyNames().idKey: id,
      KeyNames().nameKey: name,
      KeyNames().ageKey: age,
      KeyNames().clubIDKey: clubID,
      KeyNames().positionKey: position,
      KeyNames().overallKey: overall,
      KeyNames().nationalityKey: nationality,
      KeyNames().imagePlayerKey: imageUrl,
    };
  }

  PlayerSaveData toClass(List<Map<String, dynamic>> maps, int i){
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
  }

}
