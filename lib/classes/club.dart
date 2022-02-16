import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/global/global_variables.dart';
import 'package:fifa/global/images.dart';

class Club{

  late int index;
  late String name;
  late List jogadores;
  late List escalacao;
  late int leagueID;
  late String picture;
  late int nJogadores;
  //Leagues variables
  late int leaguePoints;
  late int leagueGM;
  late int leagueGS;
  late int internationalPoints;
  late int internationalGM;
  late int internationalGS;

  Club({required this.index}) {
    name = clubsName[index];
    picture = FIFAImages().imageLogo(name);
    jogadores = getJogadores();
    nJogadores = jogadores.length;
    escalacao = optimizeBestSquadClub();
    leagueID = getLeagueID();
    leaguePoints = globalClubsLeaguePoints.isNotEmpty ? globalClubsLeaguePoints[index] : 0;
    leagueGM = globalClubsLeagueGM.isNotEmpty ? globalClubsLeagueGM[index] : 0;
    leagueGS = globalClubsLeagueGS.isNotEmpty ? globalClubsLeagueGS[index] : 0;
    internationalPoints = globalClubsInternationalPoints.isNotEmpty ? globalClubsInternationalPoints[index] : 0;
    internationalGM = globalClubsInternationalGM.isNotEmpty ? globalClubsInternationalGM[index] : 0;
    internationalGS = globalClubsInternationalGS.isNotEmpty ? globalClubsInternationalGS[index] : 0;
  }

  int getLeagueID() {
    //SEARCH IN ALL LEAGUES
    late int index;
    for (var nameLeague in leagueNames) {
      Map map = clubNameMap(nameLeague);
      if (map.containsValue(name)) {
        index = leaguesIndexFromName[nameLeague];
      }
    }
    return index;
  }

    int getChaveLeague(){
    String leagueName = League(index: getLeagueID()).name;

    //Search name by index;
    Map mapLeague = clubNameMap(leagueName);
    var position = mapLeague.keys.firstWhere((k) => mapLeague[k] == name, orElse: () => null);
      return position;
    }

    List getJogadores(){
    List jogadores = [];
      for (int i=0; i<globalJogadoresIndex.length;i++) {
        if(globalJogadoresClubIndex[i] == index){ //index do clube do jogador == index do clube
          jogadores.add(i);
        }
      }

      // if(index==globalMyClubID){
      //    jogadores = globalMyJogadores;
      // }
      return jogadores;
    }

  double getOverall(){
    double ovr = 0;
    bool isMyTeam = false;
    if(index == globalMyClubID) {
      isMyTeam = true;
    }
    for (int i=0; i<11;i++) {
        if(isMyTeam){
          ovr += double.parse(globalJogadoresOverall[globalMyJogadores[i]].toString());
          }else{
          ovr += double.parse(globalJogadoresOverall[jogadores[i]].toString());
        }
    }

    ovr = ovr/11;
    return ovr;
  }

  List optimizeBestSquadClub(){
    //1ªLista com todos os jogador da posicao 0 -> GOL
    //Organiza na lista o que tem melhor overall
    //salva o com melhor overall



    List playersPositionNames = []; //lista com a posição de todos os jogadores: Ex:[GOL, MEI, ZAG, VOL...]
    List playersOVR =[];
    List playersID =[];
    for (int j = 0; j < jogadores.length; j++) {//0-23

      Jogador jogadorClass = Jogador(index: jogadores[j]);
      //SÓ JOGADORES SEM CARTOES VERMELHOS/3 AMARELOS E SEM LESOES
      if( ! (jogadorClass.injury>0 ||jogadorClass.redCard>0) || jogadorClass.yellowCard>=3){
        playersPositionNames.add(jogadorClass.position);
        playersOVR.add(jogadorClass.overall);
        playersID.add(jogadorClass.index);
      }
    }

    //PARA CADA POSICAO VERIFICA A LISTA DE JOGADORES PERMITIDOS
    List escalacao = [];
    for (int nPosicao = 0; nPosicao < 11; nPosicao++) {
    List<int> permittedPlayersID = [];
    List<int> permittedPlayersOVR = [];
      for (int j = 0; j < playersID.length; j++) {//0-23

        if (positions442[playersPositionNames[j]].contains(nPosicao)) {//Ex: GOL[1,2] contains 0?

          //Se a posicao do jogador é permitida, adiciona na lista de jogadores possíveis
          permittedPlayersID.add(playersID[j]);
          permittedPlayersOVR.add(playersOVR[j]);
        }
      }

    //no final organiza pelo que tem maior overall
    dynamic help;
    for(int i=0;i<permittedPlayersOVR.length;i++){
      for(int k=i;k<permittedPlayersOVR.length;k++){
        if(permittedPlayersOVR[i]<permittedPlayersOVR[k]){
          help = permittedPlayersOVR[i];permittedPlayersOVR[i] = permittedPlayersOVR[k];permittedPlayersOVR[k] = help;
          help = permittedPlayersID[i];permittedPlayersID[i] = permittedPlayersID[k];permittedPlayersID[k] = help;
        }
      }
    }

    //POE O MELHOR JOGADOR NA POSICAO, SE ELE JA ESTIVER ESCALADO PEGA O 2ª MELHOR ETC..
        try{
          for (int bestOrder = 0; bestOrder < 4; bestOrder++) {
            if (!escalacao.contains(permittedPlayersID[bestOrder])) {
              escalacao.add(permittedPlayersID[bestOrder]);
              break;
            }
          }
        }catch(e) {
          //Se nao tiver jogadores disponiveis naquela posicao
          for (int nPosicao2 = 0; nPosicao2 < nJogadores; nPosicao2++) {
            if (!escalacao.contains(jogadores[nPosicao2])) {
              escalacao.add(jogadores[nPosicao2]);
              break;
            }
          }
        }

    }//nPosicoes 11

    //ADICONA JOGADORES RESERVAS
    for (int nPosicao = 0; nPosicao < nJogadores; nPosicao++) {
      if(!escalacao.contains(jogadores[nPosicao])){
        escalacao.add(jogadores[nPosicao]);
      }
    }

    return escalacao;
  }

}