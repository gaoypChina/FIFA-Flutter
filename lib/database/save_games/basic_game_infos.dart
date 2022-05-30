
import 'package:fifa/database/key_names.dart';

class BasicGameInfos{
  int id = 0;
  int year = 2023;

  BasicGameInfos({
    required this.id,
    required this.year,
});

  // Convert a Favorite into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      KeyNames().idKey: id,
      KeyNames().yearKey: year,
    };
  }

}