import 'package:fifa/classes/geral/esquemas_taticos.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';

class Jogador{

  late int index;
  late String name;
  late String nameResume;
  late String position;
  late String nationality;
  late String imageUrl;
  late int clubID;
  late String clubName;
  late int age;
  late int overall;
  late int overallDynamic;
  late double price;
  late double health;
  late String moral;

  late int matchsLeague;
  late int goalsLeague;
  late int assistsLeague;
  late int redCard;
  late int yellowCard;
  late int injury;
  late double grade;

  late int matchsInternational;
  late int goalsInternational;
  late int assistsInternational;

  late int matchsYear;
  late int goalsYear;
  late int assistsYear;

  late int matchsCarrer;
  late int goalsCarrer;
  late int assistsCarrer;

  Jogador({required this.index}) {
    name = globalJogadoresName[index];
    nameResume = resumeName();
    position = globalJogadoresPosition[index];
    age = globalJogadoresAge[index];
    health = globalJogadoresHealth[index];
    overall = globalJogadoresOverall[index];
    nationality = globalJogadoresNationality[index];
    imageUrl = globalJogadoresImageUrl[index];
    overallDynamic = setOverall();
    price = setPreco();
    clubID = globalJogadoresClubIndex[index];
    clubName = clubsAllNameList[clubID];
    matchsLeague = globalJogadoresLeagueMatchs[index] ?? 0;
    goalsLeague = globalJogadoresLeagueGoals[index] ?? 0;
    assistsLeague = globalJogadoresLeagueAssists[index] ?? 0;
    redCard = globalJogadoresRedCard[index] ?? 0;
    yellowCard = globalJogadoresYellowCard[index] ?? 0;
    grade = globalJogadoresGrades[index] ?? 0;
    injury = globalJogadoresInjury[index] ?? 0;
    matchsInternational = globalJogadoresInternationalMatchs[index];
    goalsInternational = globalJogadoresInternationalGoals[index];
    assistsInternational = globalJogadoresInternationalAssists[index];
    matchsYear = matchsInternational+matchsLeague;
    goalsYear = goalsInternational+goalsLeague;
    assistsYear = assistsInternational+assistsLeague;
    matchsCarrer = globalJogadoresCarrerMatchs[index];
    goalsCarrer = globalJogadoresCarrerGoals[index];
    assistsCarrer = globalJogadoresCarrerAssists[index];
    moral = globalJogadoresMoral[index];
  }

  printData(){
    print('ID: $index NAME: $name CLUBNAME: $clubName OVR: $overall IDADE: $age NATIONALITY: $nationality');
  }

  String resumeName(){
    try{
      List split = name.split(' ');
      String newname = '';
      if(split.length==1){ //Chiquinho
        newname = name;
      }else{
        for(int i = 1;i<split.length;i++){ //Chiquinho Moraes Santos ->Moraes Santos
          newname += split[i]+' ';
        }
        newname = split[0][0]+'. '+newname;//[0][0] 1ªletra -> C. Moraes Santos
      }
      return newname;
    }catch(e){
      return name;
    }
  }
  //////////////////////////////////////////////////////////////////
  //                          S E T                               //
  //////////////////////////////////////////////////////////////////
  int setOverall(){
    int overallNewValue = overall;
    if(globalJogadoresInjury[index]>0 || globalJogadoresRedCard[index]>=1 || globalJogadoresYellowCard[index]>=3){
      overallNewValue -= 12;
    }
    else if(health<0.1){
      overallNewValue -= 5;
    }else if(health<0.2){
      overallNewValue -= 4;
    }else if(health<0.3){
      overallNewValue -= 3;
    }else if(health<0.5){
      overallNewValue -= 2;
    }else if(health<0.7){
      overallNewValue -= 1;
    }

    return overallNewValue;
  }

  isPlayerInRightPosition(int position){
    List possiblePositions = getPlayerValidPositions();
    if(!possiblePositions.contains(position) && position<11){
      overallDynamic -= 8;
    }
  }
  List getPlayerValidPositions(){
    Map positionsMap;
    if(clubID == globalMyClubID){
      positionsMap = EsquemaTatico().getMyPositionsMap();
    }else{
      positionsMap = EsquemaTatico().getPositionsMap();
    }
    List possiblePositions = positionsMap[position];
    return possiblePositions;
  }


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