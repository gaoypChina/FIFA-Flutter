import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/nteams_int_league.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/league_divisions.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

Widget tabelaClassificacaoWidget(BuildContext context,League league){
  List classificationClubsIndexes = Classification(leagueIndex: league.index).classificationClubsIndexes;
  return Column(
    children: [
      Container(
        color: AppColors().greyTransparent,
        child: Row(
          children: [
            const SizedBox(width: 220),
            Text(Translation(context).text.points3,style:EstiloTextoBranco.text14),
            const SizedBox(width: 10),
            Text(Translation(context).text.goalsFor3,style:EstiloTextoBranco.text14),
            const SizedBox(width: 15),
            Text(Translation(context).text.goalsAgainst,style:EstiloTextoBranco.text14),
            const SizedBox(width: 15),
            Text(Translation(context).text.goalDifference3,style:EstiloTextoBranco.text14),
            const SizedBox(width: 15),
            Text(Translation(context).text.ovr3,style: EstiloTextoBranco.text14),
          ],
        ),
      ),

      //TABELA DE CLASSIFICAÇÃO
      Container(
        color: AppColors().greyTransparent,
        child: Table(
          columnWidths: const {
            0: FractionColumnWidth(.06),
            1: FractionColumnWidth(.07),
            2: FractionColumnWidth(.4),
            7: FractionColumnWidth(.1)
          },
          children: [
            for(int i=0; i<league.nClubs;i++)
              rowTableNacionalLayout(context, i,classificationClubsIndexes[i], league)
          ],
        ),
      ),
    ],
  );
}

TableRow rowTableNacionalLayout(BuildContext context, int position, int indexClub, League league) {
  Club clubClass = Club(index: indexClub);
  String clubName = clubClass.name;
  int points = clubClass.leaguePoints;
  int golsMarcados = clubClass.leagueGM;
  int golsSofridos = clubClass.leagueGS;
  int saldo = golsMarcados - golsSofridos;
  double overall = clubClass.getOverall();

  Color backgroundColor = backgroundTextColor(position,league,clubName);

  return TableRow(
    children: [
      Text((position+1).toString()+'-',style: EstiloTextoBranco.text14),
      GestureDetector(
        onTap: (){
          goToClubProfilePage(context,clubClass);
          },
          child: Images().getEscudoWidget(clubClass.name,25,25)),
      GestureDetector(
        onTap: (){
          goToClubProfilePage(context,clubClass);
        },
        child: Container(
            width:170,
            padding: const EdgeInsets.all(2),
            color: backgroundColor,
            child: Text(clubName,style: EstiloTextoBranco.text16)
        ),
      ),
      Center(child: Text(points.toString(),style: EstiloTextoBranco.text14)),
      Center(child: Text(golsMarcados.toString(),style: EstiloTextoBranco.text14)),
      Center(child: Text(golsSofridos.toString(),style: EstiloTextoBranco.text14)),
      Center(child: Text(saldo.toString(),style: EstiloTextoBranco.text14)),
      Text(overall.toStringAsFixed(2),style: EstiloTextoBranco.text14),

    ],
  );
}

goToClubProfilePage(BuildContext context, Club clubClass){
  Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: clubClass.index)));
}

Color backgroundTextColor(int position, League league, String teamName){

  String leagueName = league.name;
  Color backgroundColor = Colors.transparent;


  //CLASSIFICAÇÃO
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().inglaterra1, LeagueOfficialNames().championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().italia1, LeagueOfficialNames().championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().espanha1, LeagueOfficialNames().championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().franca1, LeagueOfficialNames().championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().alemanha1, LeagueOfficialNames().championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().portugal, LeagueOfficialNames().championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().holanda, LeagueOfficialNames().championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().turquiaGrecia, LeagueOfficialNames().championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().ligaEuropa, LeagueOfficialNames().championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().lesteEuropeu, LeagueOfficialNames().championsLeague, position, backgroundColor);

  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().brasil1, LeagueOfficialNames().libertadores, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().argentina, LeagueOfficialNames().libertadores, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().mercosul, LeagueOfficialNames().libertadores, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().colombia, LeagueOfficialNames().libertadores, position, backgroundColor);


  //INTERNACIONAL 2
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().inglaterra1, LeagueOfficialNames().europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().italia1, LeagueOfficialNames().europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().espanha1, LeagueOfficialNames().europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().franca1, LeagueOfficialNames().europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().alemanha1, LeagueOfficialNames().europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().portugal, LeagueOfficialNames().europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().holanda, LeagueOfficialNames().europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().turquiaGrecia, LeagueOfficialNames().europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().ligaEuropa, LeagueOfficialNames().europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().lesteEuropeu, LeagueOfficialNames().europaLeagueOficial, position, backgroundColor);

  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().brasil1, LeagueOfficialNames().copaSulAmericana, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().argentina, LeagueOfficialNames().copaSulAmericana, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().mercosul, LeagueOfficialNames().copaSulAmericana, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().colombia, LeagueOfficialNames().copaSulAmericana, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().mexico, LeagueOfficialNames().copaSulAmericana, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,LeagueOfficialNames().estadosUnidos, LeagueOfficialNames().copaSulAmericana, position, backgroundColor);

  //1ºCOLOCADO
  if(position==0){backgroundColor = Colors.yellowAccent.withOpacity(0.7);}

  //ACESSO 1ªDivisão
  List<String> divisionsNames = Divisions().leagueDivisionsStructure(leagueName);
  if(divisionsNames.length > 1 && leagueName != divisionsNames.first){
    if(position==1){backgroundColor = Colors.blue;}
    if(position==2){backgroundColor = Colors.blue;}
  }

  //REBAIXAMENTO
  if(divisionsNames.length > 1 && leagueName != divisionsNames.last){
    if(position==league.nClubs-3){backgroundColor = Colors.red;}
    if(position==league.nClubs-2){backgroundColor = Colors.red;}
    if(position==league.nClubs-1){backgroundColor = Colors.red;}
  }

  if(teamName==My().clubName){backgroundColor = Colors.teal;}

  return backgroundColor;
}

Color colorLeague(String leagueName,String leagueNameCompare, String internationalName, int position,Color backgroundColor){
    if(leagueName == leagueNameCompare){
      NTeamsIntLeague nTeamsIntLeague = NTeamsIntLeague(leagueName: leagueNameCompare,internationalName: internationalName);
      for(int i = nTeamsIntLeague.offset; i < nTeamsIntLeague.offset+nTeamsIntLeague.nTeamsClassifiedValue; i++){
        if(position==i){
          if(internationalName == LeagueOfficialNames().championsLeague ||
              internationalName == LeagueOfficialNames().libertadores){
            return Colors.indigo;
          }
          return Colors.blue;
        }
      }
    }
    return backgroundColor;
  }
