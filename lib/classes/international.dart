import 'package:fifa/functions/globalfunctions.dart';
import 'package:fifa/global_variables.dart';

class International{

//INDEX 0
  late String competitionName;
  List clubIDs =[];
  List clubsGM =[];
  List clubsGS =[];
  List clubsSaldo =[];
  List clubsPoints =[];
  Map grupos = {};
  Map oitavas = {};
  Map quartas = {};
  Map semi = {};
  Map finalMap = {};

  International(competitionName) {
    int internationalIndex = GlobalFunctions().getInternationalLeagueNumber(competitionName); //0,1
    try {
      clubIDs = List.from(globalInternational32ClubsID[internationalIndex]); //32 clubes
    }catch(e){
      clubIDs = List.filled(32, 0);
    }
      try {
      clubsGM = convertGeralTo032(List.from(globalClubsInternationalGM)); //287 clubes
      clubsGS = convertGeralTo032(List.from(globalClubsInternationalGS)); //287 clubes
      clubsSaldo = [];
      for (int i = 0; i < clubsGM.length; i++) {
        clubsSaldo.add(clubsGM[i] - clubsGS[i]);
      }
      clubsPoints = convertGeralTo032(List.from(globalClubsInternationalPoints));
    }catch(e){
      //Se não tiver sido inicializado
      clubsGM = List.filled(32, 0);
      clubsGS = List.filled(32, 0);
      clubsPoints = List.filled(32, 0);
      clubsSaldo = List.filled(32, 0);
    }
  }


  /////////////////////////////////////////////////////////////////////////
  //   FUNCTIONS
  List convertGeralTo032(List listAllClubs){
    List list032 = [];
    for (var id in clubIDs) { //loop de 32 valores
      list032.add(listAllClubs[id]);
    }
    return List.from(list032);
  }
  List getClassification(){
    for(int i=0;i<8;i++) {
      ordenaPontuacaoGrupo(i);
    }
    return clubIDs;
  }

  ordenaPontuacaoGrupo(int groupNumber){
    //Organiza em ordem decrescente
    dynamic help;
    for(int i=groupNumber*4;i<groupNumber*4+3;i++){
      for(int k=i+1;k<groupNumber*4+4 ;k++){
        if(clubsPoints[i]<clubsPoints[k] || (clubsPoints[i]==clubsPoints[k] && clubsSaldo[i] < clubsSaldo[k])){
          help = clubsPoints[i];clubsPoints[i] = clubsPoints[k];clubsPoints[k] = help;
          help = clubIDs[i];clubIDs[i] = clubIDs[k];clubIDs[k] = help;
          help = clubsSaldo[i];clubsSaldo[i] = clubsSaldo[k];clubsSaldo[k] = help;
        }
      }
    }
  }
/*
  finall
  {
  timeA: 'Barcelona'
  timeB: 'Real',
  GMA: 4,
  GMB: 2,
  }

   */



}