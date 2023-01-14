import 'package:fifa/classes/geral/esquemas_taticos.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/functions/countries_continents.dart';
import 'package:fifa/functions/international_league.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/values/league_names.dart';

class Club{

  late int index;
  late String name;
  late String nationality;
  late String continent;
  late String stadiumName;
  late int stadiumSize;
  late int foundationYear;
  late ClubColors colors;
  late List jogadores;
  late List escalacao;
  late String esquemaTatico;
  late int leagueID;
  double overallAproximated = 0; //serve pra fazer contas com o overall do time mais rapidamente
  late String leagueName;
  late String picture;
  late int nJogadores;
  //Leagues variables
  late int leaguePoints;
  late int leagueGM;
  late int leagueGS;
  late String stateName;
  late String estadualLeagueName;
  late String internationalLeagueName;
  late int internationalLeagueIndex;
  late int internationalPoints;
  late int internationalGM;
  late int internationalGS;

  Club({required this.index,bool hasPlayers = false,bool clubDetails = true}) {
    name = clubsAllNameList[index];
    picture = FIFAImages().imageLogo(name);
    jogadores = hasPlayers ? [] : getJogadores();
    nJogadores = jogadores.length;

    for (int index in  jogadores){
      overallAproximated += globalJogadoresOverall[index];
    }
    overallAproximated = overallAproximated / jogadores.length;

    esquemaTatico = EsquemaTatico().e442;
    if(index == globalMyClubID){
      esquemaTatico = EsquemaTatico().meuEsquema;
    }
    escalacao = hasPlayers ? [] : optimizeBestSquadClub();
    leagueName = getLeagueName();
    leagueID = leaguesIndexFromName[leagueName];
    leaguePoints = globalClubsLeaguePoints.isNotEmpty ? globalClubsLeaguePoints[index] : 0;
    leagueGM = globalClubsLeagueGM.isNotEmpty ? globalClubsLeagueGM[index] : 0;
    leagueGS = globalClubsLeagueGS.isNotEmpty ? globalClubsLeagueGS[index] : 0;

    internationalLeagueName = InternationalLeagueManipulation().funcGetInternationalLeagueName(indexLeague: leagueID);
    internationalLeagueIndex = InternationalLeagueManipulation().funcGetInternationalLeagueIndex(internationalLeagueName: internationalLeagueName);
    try{
      internationalPoints = globalClubsInternationalPoints[index];
      internationalGM = globalClubsInternationalGM[index];
      internationalGS = globalClubsInternationalGS[index];
    }catch(e){
      internationalPoints =0;internationalGM=0;internationalGS=0;
    }
    if(clubDetails){
      ClubDetails clubDetails = ClubDetails();
      nationality = clubDetails.getCountry(name);
      foundationYear = clubDetails.getFoundationYear(name);
      stadiumName = clubDetails.getStadium(name);
      stadiumSize = clubDetails.getStadiumCapacity(name);
      continent = Continents().funcCountryContinents(nationality);
      stateName = clubDetails.getState(name);
      colors = clubDetails.getColors(name);
      if(stateName.isNotEmpty){
        estadualLeagueName = getLeagueNationalityMap().keys.firstWhere((k) => getLeagueNationalityMap()[k] == stateName, orElse: () => null);
      }
    }

  }

  String getLeagueName() {
    //SEARCH IN ALL LEAGUES
    for (var nameLeague in leagueNames) {
      if (clubNameMap.keys.contains(nameLeague)) {
        Map map = clubNameMap[nameLeague];
        if (map.containsValue(name)) {
          return nameLeague;
        }
      }
    }
    print('ERROR IN GETLEAGUENAME() $name');
    return '';
  }


    int getChaveLeague(){
    //Search name by index;
    Map mapLeague = clubNameMap[leagueName];
    int position = mapLeague.keys.firstWhere((k) => mapLeague[k] == name);
      return position;
    }

    List getJogadores(){
    List jogadores = [];
      for (int i=0; i<globalJogadoresIndex.length;i++) {
        if(globalJogadoresClubIndex[i] == index){ //index do clube do jogador == index do clube
          jogadores.add(i);
        }
      }

      return jogadores;
    }

  double getOverall(){
    double ovr = 0;
    for (int i=0; i<11;i++) {
        if(index == globalMyClubID){//if is My Team
          //check Position
          Jogador player = Jogador(index: globalMyJogadores[i]);
          player.isPlayerInRightPosition(i);
            ovr += double.parse(player.overallDynamic.toString());
          }else{
          try{
            Jogador player = Jogador(index: escalacao[i]);
            player.isPlayerInRightPosition(i);
            ovr += double.parse(player.overallDynamic.toString());
          }catch(e){
            //print('$index $name $jogadores');
          }
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

        //PEGA O MAPA DE POSIÇÕES A PARTIR DO ESQUEMA TÁTICO
        Map positions = {};
        EsquemaTatico esquemaTaticoClass = EsquemaTatico();
        if(index == globalMyClubID){
          positions = esquemaTaticoClass.getMyPositionsMap();
        }else{
          positions = esquemaTaticoClass.getPositionsMap();
        }
          //VERIFICA SE A POSIÇÃO DO JOGADOR É PERMITIDA
          if (positions[playersPositionNames[j]].contains(nPosicao)) {//Ex: GOL[1,2] contains 0?
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
          for (int bestOrder = 0; bestOrder < 6; bestOrder++) {
            if (!escalacao.contains(permittedPlayersID[bestOrder])) {
              escalacao.add(permittedPlayersID[bestOrder]);
              break;
            }
          }
        }catch(e) {
          //Se nao tiver jogadores disponiveis naquela posicao
          //começa do 1 pra nao pegar o goleiro e por de atacante por exemplo
          for (int nPosicao2 = 1; nPosicao2 < nJogadores; nPosicao2++) {
            if (!escalacao.contains(jogadores[nPosicao2])) {//se o jogador ainda nao tiver sido escalado no time
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

  Map nPlayersPerPositions(){
    List<String> positionsMyPlayers = [];
    Map positionsCount = {};
    for (int j = 0; j < jogadores.length; j++) { //0-23
      Jogador jogadorClass = Jogador(index: jogadores[j]);
      positionsMyPlayers.add(jogadorClass.position);
    }
    for (int index = 0; index < globalAllPositions.length; index++) {
      positionsCount[globalAllPositions[index]] = 0;
      for (var positionMyPlayer in positionsMyPlayers) {
        if(positionMyPlayer == globalAllPositions[index]){
          positionsCount[globalAllPositions[index]]++;
        }
      }
    }
    return positionsCount;
  }
  ////////////////////////////////////////////////////////////////////////////
  getAverageAge(){
    double averageAge = 0;
    for(int i=0; i<nJogadores; i++){
      averageAge += Jogador(index: jogadores[i]).age;
    }
    averageAge = averageAge / nJogadores;
    return averageAge;
  }

}