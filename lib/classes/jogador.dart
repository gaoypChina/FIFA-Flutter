import 'package:fifa/classes/functions/esquemas_taticos.dart';
import 'package:fifa/classes/player_stats_keys.dart';
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
  late double trainLevel;

  late int matchsLeague;
  late int goalsLeague;
  late int assistsLeague;
  late int cleanSheetsLeague;
  late int golsSofridosLeague;
  late int redCard;
  late int yellowCard;
  late int injury;
  late double grade;
  late double gradeAvg;

  late int matchsInternational;
  late int goalsInternational;
  late int assistsInternational;
  late int cleanSheetsInternational;
  late int golsSofridosInternational;
  late double gradeInt;

  late int matchsCup;
  late int goalsCup;
  late int assistsCup;
  late int cleanSheetsCup;
  late int golsSofridosCup;
  late double gradeCup;

  late int matchsYear;
  late int goalsYear;
  late int assistsYear;
  late int cleanSheetsYear;
  late int golsSofridosYear;

  late int matchsCarrer;
  late int goalsCarrer;
  late int assistsCarrer;
  late int cleanSheetsCarrer;
  late int golsSofridosCarrer;

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
    cleanSheetsLeague = globalJogadoresCarrerCleanSheets[index] ?? 0;
    golsSofridosLeague = globalJogadoresCarrerGolsSofridos[index] ?? 0;
    redCard = globalJogadoresRedCard[index] ?? 0;
    yellowCard = globalJogadoresYellowCard[index] ?? 0;
    injury = globalJogadoresInjury[index] ?? 0;
    try{
      matchsLeague = globalLeaguePlayers[PlayerStatsKeys().keyPlayerMatchs]![index];
      goalsLeague = globalLeaguePlayers[PlayerStatsKeys().keyPlayerGoals]![index];
      assistsLeague = globalLeaguePlayers[PlayerStatsKeys().keyPlayerAssists]![index];
      cleanSheetsLeague = globalLeaguePlayers[PlayerStatsKeys().keyPlayerCleanSheets]![index];
      golsSofridosLeague = globalLeaguePlayers[PlayerStatsKeys().keyPlayerGolsSofridos]![index];
      grade = (goalsLeague*2+assistsLeague+cleanSheetsLeague*1.5)/(matchsLeague+1);
    }catch(e){
      matchsLeague = 0;
      goalsLeague = 0;
      assistsLeague = 0;
      cleanSheetsLeague = 0;
      golsSofridosLeague = 0;
      grade = 0.0;
    }
    try{
      matchsInternational = globalInternationalPlayers[PlayerStatsKeys().keyPlayerMatchs]![index];
      goalsInternational = globalInternationalPlayers[PlayerStatsKeys().keyPlayerGoals]![index];
      assistsInternational = globalInternationalPlayers[PlayerStatsKeys().keyPlayerAssists]![index];
      cleanSheetsInternational = globalInternationalPlayers[PlayerStatsKeys().keyPlayerCleanSheets]![index];
      golsSofridosInternational = globalInternationalPlayers[PlayerStatsKeys().keyPlayerGolsSofridos]![index];
      gradeInt = (goalsInternational*2+assistsInternational+cleanSheetsInternational*1.5)/(matchsInternational+1);
    }catch(e){
      matchsInternational = 0;
      goalsInternational = 0;
      assistsInternational = 0;
      cleanSheetsInternational = 0;
      golsSofridosInternational = 0;
      gradeInt = 0.0;
    }
    //copa
    try{
      matchsCup = globalCupPlayers[PlayerStatsKeys().keyPlayerMatchs]![index];
      goalsCup = globalCupPlayers[PlayerStatsKeys().keyPlayerGoals]![index];
      assistsCup = globalCupPlayers[PlayerStatsKeys().keyPlayerAssists]![index];
      cleanSheetsCup = globalCupPlayers[PlayerStatsKeys().keyPlayerCleanSheets]![index];
      golsSofridosCup = globalCupPlayers[PlayerStatsKeys().keyPlayerGolsSofridos]![index];
      gradeCup = (goalsCup*2+assistsCup+cleanSheetsCup*1.5)/(matchsCup+1);
    }catch(e){
      matchsCup = 0;
      goalsCup = 0;
      assistsCup = 0;
      cleanSheetsCup = 0;
      golsSofridosCup = 0;
      gradeCup = 0;
    }

    matchsYear = matchsInternational+matchsLeague+matchsCup;
    goalsYear = goalsInternational+goalsLeague+goalsLeague;
    assistsYear = assistsInternational+assistsLeague+assistsCup;
    cleanSheetsYear = cleanSheetsInternational + cleanSheetsLeague+cleanSheetsCup;
    golsSofridosYear = golsSofridosInternational + golsSofridosLeague+golsSofridosCup;
    matchsCarrer = globalJogadoresCarrerMatchs[index];
    goalsCarrer = globalJogadoresCarrerGoals[index];
    assistsCarrer = globalJogadoresCarrerAssists[index];
    cleanSheetsCarrer = globalJogadoresCarrerCleanSheets[index];
    golsSofridosCarrer = globalJogadoresCarrerGolsSofridos[index];
    moral = globalJogadoresMoral[index];
    grade = globalJogadoresGrades[index] ?? 0;
    gradeAvg = grade/matchsYear;
    trainLevel = 0;

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