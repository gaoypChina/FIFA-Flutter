import '../global_variables.dart';

class PlayerBasicInfo{
  int clubID = -1;
  int playerID = -1;
  int age = 18;
  String name = '';
  String position = 'ATA';
  int overall = 75;
  String nationality = 'Brazil';
  String imagePlayer = 'https://i0.wp.com/zblibrary.info/wp-content/uploads/sites/76/2017/03/default-user.png?ssl=1';

  createNewPlayerToDatabase(){

    globalJogadoresIndex.add(playerID);
    globalJogadoresClubIndex.add(clubID);
    globalJogadoresName.add(name);
    globalJogadoresPosition.add(position);
    globalJogadoresAge.add(age);
    globalJogadoresOverall.add(overall);
    globalJogadoresNationality.add(nationality);
    globalJogadoresImageUrl.add(imagePlayer);
  }

  deletePlayerFromDatabase(int playerID){
    globalJogadoresIndex.removeAt(playerID);
    globalJogadoresClubIndex.removeAt(playerID);
    globalJogadoresName.removeAt(playerID);
    globalJogadoresPosition.removeAt(playerID);
    globalJogadoresAge.removeAt(playerID);
    globalJogadoresOverall.removeAt(playerID);
    globalJogadoresNationality.removeAt(playerID);
    globalJogadoresImageUrl.removeAt(playerID);
  }

  reorganizeIndex(){
    //reorganiza IDs [0,2,3,4]-> [0,1,2,3]
    globalJogadoresIndex = [for (var i = 0; i < globalJogadoresName.length; i++) i];
  }
}