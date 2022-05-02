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
    globalJogadoresClubIndex.add(clubID);
    globalJogadoresIndex.add(playerID);
    globalJogadoresName.add(name);
    globalJogadoresPosition.add(position);
    globalJogadoresAge.add(age);
    globalJogadoresOverall.add(overall);
    globalJogadoresNationality.add(nationality);
    globalJogadoresImageUrl.add(imagePlayer);
  }
}