import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';

class Jogador{

  late int index;
  late String name;
  late String position;
  late int clubID;
  late String clubName;
  late int age;
  late int overall;
  late double price;
  late double health;

  late int matchsLeague;
  late int goalsLeague;
  late int assistsLeague;
  late int redCard;
  late int yellowCard;
  late int injury;

  late int matchsInternational;
  late int goalsInternational;
  late int assistsInternational;

  late int matchsCarrer;
  late int goalsCarrer;
  late int assistsCarrer;

  Jogador({required this.index}) {
    name = globalJogadoresName[index];
    position = globalJogadoresPosition[index];
    age = globalJogadoresAge[index];
    overall = globalJogadoresOverall[index];
    price = setPreco();
    clubID = globalJogadoresClubIndex[index];
    clubName = clubsAllNameList[clubID];
    health = globalJogadoresHealth[index];
    matchsLeague = globalJogadoresLeagueMatchs[index] ?? 0;
    goalsLeague = globalJogadoresLeagueGoals[index] ?? 0;
    assistsLeague = globalJogadoresLeagueAssists[index] ?? 0;
    redCard = globalJogadoresRedCard[index] ?? 0;
    yellowCard = globalJogadoresYellowCard[index] ?? 0;
    injury = globalJogadoresInjury[index] ?? 0;
    matchsInternational = globalJogadoresInternationalMatchs[index];
    goalsInternational = globalJogadoresInternationalGoals[index];
    assistsInternational = globalJogadoresInternationalAssists[index];
    matchsCarrer = globalJogadoresCarrerMatchs[index];
    goalsCarrer = globalJogadoresCarrerGoals[index];
    assistsCarrer = globalJogadoresCarrerAssists[index];
  }

  //////////////////////////////////////////////////////////////////
  //                          S E T                               //
  //////////////////////////////////////////////////////////////////

  double setPreco(){
    double price=0;
    //adiciona preço
    if(overall<=63){price = 0.2;}
    if(overall<=60){price = 0.1;}
    if(overall==64){price = 0.5;}
    if(overall==65){price = 1.0;}
    if(overall==66){price = 2.0;}
    if(overall==67){price = 3.0;}
    if(overall==68){price = 5.0;}
    if(overall==69){price = 7.0;}
    if(overall==70){price = 9.0;}
    if(overall==71){price = 12.0;}
    if(overall==72){price = 15.0;}
    if(overall==73){price = 20.0;}
    if(overall==74){price = 25.0;}
    if(overall==75){price = 30.0;}
    if(overall==76){price = 35.0;}
    if(overall==77){price = 45.0;}
    if(overall==78){price = 55.0;}
    if(overall==79){price = 65.0;}
    if(overall==80){price = 80.0;}
    if(overall==81){price = 100.0;}
    if(overall==82){price = 120.0;}
    if(overall==83){price = 140.0;}
    if(overall==84){price = 170.0;}
    if(overall==85){price = 210.0;}
    if(overall==86){price = 250.0;}
    if(overall==87){price = 300.0;}
    if(overall==88){price = 350.0;}
    if(overall==89){price = 400.0;}
    if(overall==90){price = 450.0;}
    if(overall==91){price = 500.0;}
    if(overall==92){price = 600.0;}
    if(overall==93){price = 700.0;}
    if(overall==94){price = 800.0;}
    if(overall==95){price = 1000.0;}
    if(overall==96){price = 1200.0;}
    if(overall>=97){price = 1500.0;}
    if (age>=16){price = price*240.0/(age*age);}
    if (age>=32){price = price*0.9;}
    if (age>=35){price = price*0.9;}
    return price;
  }
}