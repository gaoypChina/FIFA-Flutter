
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/cup_classification.dart';
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

  getAdversario() {

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

  getCupAdversario() {

    Map match = CupClassification().getCupClubMatchMap(getCup(myClass.getLeagueName()), semana, myClass.clubName);

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

  getLeagueAdversario(){
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

  getInternationalAdversario(int semana){
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
      clubID = InternationalLeague().getClub(myClass.playingInternational, indexAdv032);
    }
    clubName = Club(index: clubID).name;
    List clubsID = International(myClass.getMyInternationalLeague()).getClassification();
    int adversarioPosicao032 = clubsID.indexOf(clubID);
    posicao = (adversarioPosicao032 % 4)+1;
  }

  getMataMataInternationalAdversario(int semana){
    late int indexAdv; //de 0-16
    try {
      List listIDs = globalInternationalMataMataClubsID[myClass.getMyInternationalLeague()][Semana(semana).semanaStr];
      if (listIDs.contains(myClass.clubID)) {
        int myIndex = listIDs.indexOf(myClass.clubID);
        if (myIndex % 2 == 0) {
          indexAdv = myIndex + 1;
          if(!Semana(semana).isJogoIdaMataMata){
            visitante = true;
          }
        } else {
          indexAdv = myIndex - 1;
          if(Semana(semana).isJogoIdaMataMata){
            visitante = true;
          }
        }
        clubID = listIDs[indexAdv];
        clubName = Club(index: clubID).name;
      }
    } catch (e) {
      //print('Variavel: globalInternationalMataMataClubsID ainda nao criada');
    }
  }
}
