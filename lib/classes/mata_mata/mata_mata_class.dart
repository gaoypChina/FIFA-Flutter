import 'dart:math';

import 'package:fifa/classes/international.dart';
import 'package:fifa/classes/mata_mata/knockout_international.dart';
import 'package:fifa/classes/mata_mata/knockout_stage.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_names.dart';

class MataMata {

  int phaseIdaVolta = 0;
  int nInternationalLeagues = internationalLeagueNames.length;

  void defineClubsOitavas() {
    for (int i = 0; i < nInternationalLeagues; i++) {
      String internationalName = internationalLeagueNames[i];

      List listClubsID = [];
      List clubs32Classification = International(internationalName).getClassification();
      for (int groupNumber = 0; groupNumber < 8; groupNumber++) {
        listClubsID.add(clubs32Classification[groupNumber * 4 + 1]);
        listClubsID.add(clubs32Classification[groupNumber * 4]); //o time mais forte decide em casa, entao começa sendo visitante
      }
      //troca pra 1º enfrentar 2º de outro grupo
      for (int i = 0; i < 8; i++) {
        int randomAdv = Random().nextInt(8);
        int aux = listClubsID[i * 2 + 1];
        listClubsID[i * 2 + 1] = listClubsID[randomAdv * 2 + 1];
        listClubsID[randomAdv * 2 + 1] = aux;
      }

      Map idaVoltaInitialMap = KnockoutStage().saveIdaVoltaTeamNames(getListClubNames(listClubsID));
      globalInternationalMataMata[internationalName] = {};
      globalInternationalMataMata[internationalName]![KnockoutStage().keyOitavas] = idaVoltaInitialMap;

    }
  }

  void defineClubsQuartas() {
    defineClubsPhase(KnockoutStage().keyOitavas,KnockoutStage().keyQuartas,8);
  }
  void defineClubsSemi() {
    defineClubsPhase(KnockoutStage().keyQuartas,KnockoutStage().keySemifinal,4);
  }
  void defineClubsFinal() {
    defineClubsPhase(KnockoutStage().keySemifinal,KnockoutStage().keyFinal,2);
  }

  void defineClubsPhase(String previousPhase, String nextPhase, int nClubsNextPhase) {
    for (int i = 0; i < nInternationalLeagues; i++) {
      String competitionName = internationalLeagueNames[i];

      List<int> listClubsID = [];
      String winner = "";
      //VÊ QUAL DOS DOIS TIMES FEZ MAIS GOLS
      for (int nConfronto = 0; nConfronto < nClubsNextPhase; nConfronto++) {

        int nConfrontoStart1 = nConfronto + 1;
        Map matchMapIda = KnockoutInternational().getPhaseMatchData(competitionName, previousPhase, ResultDict().keyIda, nConfrontoStart1);
        Map matchMapVolta = KnockoutInternational().getPhaseMatchData(competitionName, previousPhase, ResultDict().keyVolta, nConfrontoStart1);

        String team1 = matchMapIda[ResultDict().keyTeamName1];
        String team2 = matchMapIda[ResultDict().keyTeamName2];

        int sumGoalsTeam1 = matchMapIda[ResultDict().keyGol1] + matchMapVolta[ResultDict().keyGol2];
        int sumGoalsTeam2 = matchMapIda[ResultDict().keyGol2] + matchMapVolta[ResultDict().keyGol1];


        if(sumGoalsTeam1 == sumGoalsTeam2){
          //PENALTIS
          int penaltis = Random().nextInt(2);
          if(penaltis==0){
            winner = team1;
          }else{
            winner = team2;
          }
        }else if(sumGoalsTeam1 > sumGoalsTeam2){
            winner = team1;
        }else{
            winner = team2;
        }
        listClubsID.add(clubsAllNameList.indexOf(winner));
      }

      //Map idaVoltaInitialMap = KnockoutStage().saveIdaVoltaTeamNames(getListClubNames(listClubsID));
    }
  }

  List<String> getListClubNames(List listClubsID){
    List<String> listClubsNames = [];
    for (int clubID in listClubsID) {
      listClubsNames.add(clubsAllNameList[clubID]);
    }
    return listClubsNames;
  }

  String getSemanaPhase(int week) {
    String phase = '';
    if (semanaOitavas.contains(week)) {
      phase = KnockoutStage().keyOitavas;
    }
    if (semanaQuartas.contains(week)) {
      phase = KnockoutStage().keyQuartas;
    }
    if (semanaSemi.contains(week)) {
      phase = KnockoutStage().keySemifinal;
    }
    if (semanaFinal.contains(week)) {
      phase = KnockoutStage().keyFinal;
    }
    return phase;
  }

  int getPhaseIdaVolta(int weekSelected) {
    //jogo de ida ou volta
    if (semanaOitavas.first == weekSelected ||
        semanaQuartas.first == weekSelected
        || semanaSemi.first == weekSelected ||
        semanaFinal.first == weekSelected) {
      phaseIdaVolta = 0;
    } else {
      phaseIdaVolta = 1;
    }
    return phaseIdaVolta;
  }

  int getMatchRows() {
    int matchRows = 0;
    if (semanaOitavas.contains(semana)) {
      matchRows = 8;
    }
    if (semanaQuartas.contains(semana)) {
      matchRows = 4;
    }
    if (semanaSemi.contains(semana)) {
      matchRows = 2;
    }
    if (semanaFinal.contains(semana)) {
      matchRows = 1;
    }
    return matchRows;
  }

  Confronto getData(String internationalName, String phaseName, int matchNumber, int phaseIdaVolta) {
    late Confronto confronto;
    try {

      if(phaseIdaVolta == 0){
        confronto = KnockoutInternational().getConfronto(internationalName, phaseName, ResultDict().keyIda, matchNumber);
      }else{
        confronto = KnockoutInternational().getConfronto(internationalName, phaseName, ResultDict().keyVolta, matchNumber);
      }

    } catch (e) {
      //print('FASE AINDA NÃO SIMULADA');
    }
    return confronto;
  }
}
