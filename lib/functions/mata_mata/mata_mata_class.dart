import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/international.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

class MataMata {

  int clubID1 = -1;
  int clubID2 = -1;
  String clubName1 = 'Palmeiras';
  String clubName2 = 'Santos';
  int goal1 = -1;
  int goal2 = -1;

  int phaseStage = 0;
  int nInternationalLeagues = internationalLeagueNames.length;

  defineClubsOitavas() {
    for (int i = 0; i < nInternationalLeagues; i++) {
      String internationalName = internationalLeagueNames[i];
      globalInternationalMataMataClubsID[internationalName] = {};
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
      globalInternationalMataMataClubsID[internationalName]['Oitavas'] = List.from(listClubsID);
    }
  }

  defineClubsQuartas() {
    for (int i = 0; i < nInternationalLeagues; i++) {
      String internationalName = internationalLeagueNames[i];

      List listClubsID = [];
      List clubsOitavas = globalInternationalMataMataClubsID[internationalName]['Oitavas'];
      print('DEFINE QUARTAS');
      print(globalInternationalMataMataClubsID);
      print(clubsOitavas);
      print(globalInternationalMataMataGoals[internationalName]['Oitavas']);
      //VÊ QUAL DOS DOIS TIMES FEZ MAIS GOLS
      for (int nConfronto = 0; nConfronto < 8; nConfronto++) {
        List goals1 = globalInternationalMataMataGoals[internationalName]['Oitavas'][clubsOitavas[nConfronto*2]];
        List goals2 = globalInternationalMataMataGoals[internationalName]['Oitavas'][clubsOitavas[nConfronto*2+1]];
        if(goals1.first + goals1.last == goals2.first + goals2.last){
          //PENALTIS
          int penaltis = Random().nextInt(2);
          if(penaltis==0){
            listClubsID.add(clubsOitavas[nConfronto*2]);
          }else{
            listClubsID.add(clubsOitavas[nConfronto*2+1]);
          }
        }else if(goals1.first + goals1.last > goals2.first + goals2.last){
          listClubsID.add(clubsOitavas[nConfronto*2]);
        }else{
          listClubsID.add(clubsOitavas[nConfronto*2+1]);
        }
      }
      //SALVA A LISTA FINAL
      globalInternationalMataMataClubsID[internationalName]['Quartas'] = List.from(listClubsID);
    }
  }

  String getSemanaPhase(int week) {
    String phase = '';
    if (semanaOitavas.contains(week)) {
      phase = 'Oitavas';
    }
    if (semanaQuartas.contains(week)) {
      phase = 'Quartas';
    }
    if (semanaSemi.contains(week)) {
      phase = 'Semi';
    }
    if (semanaFinal.contains(week)) {
      phase = 'Final';
    }
    return phase;
  }

  int getPhaseStage(int weekSelected) {
    //jogo de ida ou volta
    if (semanaOitavas.first == weekSelected ||
        semanaQuartas.first == weekSelected
        || semanaSemi.first == weekSelected ||
        semanaFinal.first == weekSelected) {
      phaseStage = 0;
    } else {
      phaseStage = 1;
    }
    return phaseStage;
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

  getData(String internationalName, String weekPhase, int matchRow,int phaseStage) {
    try {
      final List clubsID = List.from(globalInternationalMataMataClubsID[internationalName][weekPhase]);

      if (phaseStage == 0) {
        clubID1 = clubsID[matchRow * 2];
        clubID2 = clubsID[matchRow * 2 + 1];
      } else {
        clubID1 = clubsID[matchRow * 2 + 1];
        clubID2 = clubsID[matchRow * 2];
      }

      clubName1 = Club(index: clubID1).name;
      clubName2 = Club(index: clubID2).name;
      try {
        goal1 = globalInternationalMataMataGoals[internationalName][weekPhase][clubID1][phaseStage];
        goal2 = globalInternationalMataMataGoals[internationalName][weekPhase][clubID2][phaseStage];
      } catch (e) {
        //print('Pag. Mata-Mata: Semana ainda não foi simulada');
      }
    } catch (e) {
      //print('FASE AINDA NÃO SIMULADA');
    }
  }
}
