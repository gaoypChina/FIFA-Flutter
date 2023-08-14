
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/mata_mata/cup_classification.dart';
import 'package:fifa/classes/mata_mata/knockout_international.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/international.dart';
import 'package:fifa/classes/international_league.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_names.dart';

class Adversario{
  String clubName = '';
  late int clubID;
  late int posicao;
  bool visitante = false;
  My myClass = My();

  void getAdversario() {

    Semana weekClass = Semana(semana);
    //ADVERSARIO CAMPEONATO
    if (weekClass.isJogoCampeonatoNacional) {
      getLeagueAdversario();
    }
    //ADVERSARIO COPA
    else if (weekClass.isJogoCopa) {
      getCupAdversario();
    }
    //ADVERSARIO FASE DE GRUPOS CHAMPIONS OU LIBERTADORES
    else if (myClass.isPlayingInternational && weekClass.isJogoGruposInternacional) {
      getInternationalAdversario(semana);
    }
    //FASE DE MATA-MATA
    else if (weekClass.isJogoMataMataInternacional) {
      getMataMataInternationalAdversario(semana);
    }
  }

  void getCupAdversario() {

    Map match = CupClassification().getClubMatchMap(getCup(myClass.getLeagueName()), semana, myClass.clubName);

    if (match.isNotEmpty) {
      if (match[ResultDict().keyTeamName1] == myClass.clubName) {
        clubName = match[ResultDict().keyTeamName2];
        clubID = clubsAllNameList.indexOf(clubName);
        visitante = false;
      }else if (match[ResultDict().keyTeamName2] == myClass.clubName) {
        clubName = match[ResultDict().keyTeamName1];
        clubID = clubsAllNameList.indexOf(clubName);
        visitante = true;
      }
    }
  }

  void getLeagueAdversario(){
    late int indexAdv; //de 0-16
    List chaves = Chaves().obterChave(semana, myClass.leagueID);
    if (chaves.isNotEmpty) {
      if (chaves.indexOf(myClass.posicaoChave) % 2 == 0) {
        indexAdv = chaves[chaves.indexOf(myClass.posicaoChave) + 1];
      } else {
        indexAdv = chaves[chaves.indexOf(myClass.posicaoChave) - 1];
        visitante = true;
      }
      clubID = League(index: myClass.leagueID).getClubRealID(indexAdv); //indice entre todos os clube
      clubName = Club(index: clubID).name;
      posicao = Classification(leagueIndex: myClass.leagueID).getClubPosition(clubID);
    }
  }

  void getInternationalAdversario(int semana){
    late int indexAdv; //0-4
    List chaves = Chaves().obterChave(semana, -1);
    int minhaPosicaoChave = myClass.getMyClubInternationalGroupPosition();
    if (chaves.indexOf(minhaPosicaoChave) % 2 == 0) {
      indexAdv = chaves[chaves.indexOf(minhaPosicaoChave) + 1];
    } else {
      indexAdv = chaves[chaves.indexOf(minhaPosicaoChave) - 1];
      visitante = true;
    }
    int indexAdv032 = 4 * myClass.getMyClubInternationalGroup() + indexAdv;
    if (myClass.playingInternational.isNotEmpty) {
      clubID = InternationalLeague().getClubID(myClass.playingInternational, indexAdv032);
    }
    clubName = Club(index: clubID).name;
    List clubsID = International(myClass.getMyInternationalLeague()).getClassification();
    int adversarioPosicao032 = clubsID.indexOf(clubID);
    posicao = (adversarioPosicao032 % 4)+1;
  }

  void getMataMataInternationalAdversario(int semana){
      Map resultMap = KnockoutInternational().getClubMatchMap(myClass.getMyInternationalLeague(), semana, myClass.clubName);

      if(resultMap.isNotEmpty){
        Confronto confronto = KnockoutInternational().getConfrontoFromMapMatch(resultMap);
          if (confronto.clubName1 == myClass.clubName) {
            clubName = confronto.clubName2;
            clubID = clubsAllNameList.indexOf(clubName);
            visitante = false;
          }else if (confronto.clubName2 == myClass.clubName) {
            clubName = confronto.clubName1;
            clubID = clubsAllNameList.indexOf(clubName);
            visitante = true;
          }
      }

  }
}
