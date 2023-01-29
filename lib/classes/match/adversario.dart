
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/international.dart';
import 'package:fifa/classes/international_league.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';

class Adversario{
  String clubName = '';
  late int clubID;
  late int posicao;
  bool visitante = false;

  getAdversario() {

    My myClass = My();

    //ADVERSARIO CAMPEONATO
    if (Semana(semana).isJogoCampeonatoNacional && semana < League(index: myClass.leagueID).nClubs) {
      getLeagueAdversario();
    }
    //ADVERSARIO FASE DE GRUPOS CHAMPIONS OU LIBERTADORES
    else if (myClass.playingInternational.isNotEmpty && Semana(semana).isJogoGruposInternacional) {
      getInternationalAdversario(semana);
    }
    //FASE DE MATA-MATA
    else if (Semana(semana).isJogoMataMataInternacional) {
      getMataMataInternationalAdversario(semana);
    }
  }

  getLeagueAdversario(){
    My myClass = My();
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
    My myClass = My();
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
    My myClass = My();
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
