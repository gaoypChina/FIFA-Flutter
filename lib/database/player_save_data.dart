class PlayerSaveData {
  final int id;
  final String name;
  final String position;
  final int clubID;
  final int overall;
  final int age;

  PlayerSaveData({
    required this.id,
    required this.name,
    required this.clubID,
    required this.position,
    required this.overall,
    required this.age,
  });

  // Convert a Favorite into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

}
