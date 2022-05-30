import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/league_divisions.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

Widget tabelaClassificacaoWidget(BuildContext context,int choosenLeagueIndex){
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
            for(int i=0; i<League(index:choosenLeagueIndex).nClubs;i++)
              rowTableNacional(context, i,choosenLeagueIndex),
          ],
        ),
      ),
    ],
  );
}

TableRow rowTableNacional(BuildContext context, int i,int choosenLeagueIndex){
  List classificationClubsIndexes = Classification(leagueIndex: choosenLeagueIndex).classificationClubsIndexes;
  int fullClubIndex = classificationClubsIndexes[i];
  return rowTableNacionalLayout(context, i,fullClubIndex, choosenLeagueIndex);
}

TableRow rowTableNacionalLayout(BuildContext context, int position, int indexClub, choosenLeagueIndex) {
  Club clubClass = Club(index: indexClub);
  String clubName = clubClass.name;
  int points = clubClass.leaguePoints;
  int golsMarcados = clubClass.leagueGM;
  int golsSofridos = clubClass.leagueGS;
  int saldo = golsMarcados - golsSofridos;
  double overall = clubClass.getOverall();

  Color backgroundColor = backgroundTextColor(position,choosenLeagueIndex,clubName);

  return TableRow(
    children: [
      Text((position+1).toString()+'-',style: EstiloTextoBranco.text14),
      GestureDetector(
        onTap: (){
          goToClubProfilePage(context,clubClass);
          },
          child: Image.asset(Images().getEscudo(clubClass.name),height: 25,width: 25)),
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

Color backgroundTextColor(int position, int choosenLeagueIndex , String teamName){

  League league = League(index: choosenLeagueIndex);
  String leagueName = league.name;
  Color backgroundColor = Colors.transparent;

  //1ºCOLOCADO
  if(position==0){backgroundColor = Colors.yellowAccent.withOpacity(0.7);}

  //CLASSIFICAÇÃO
  if(leagueName==LeagueOfficialNames().turquiaGrecia){
    if(position==1){backgroundColor = Colors.indigo;}
  }
  if( Divisions().is2ndDivision(leagueName) || Divisions().is3ndDivision(leagueName)
      || leagueName==LeagueOfficialNames().lesteEuropeu || leagueName==LeagueOfficialNames().ligaEuropa
  ){
    if(position==1){backgroundColor = Colors.indigo;}
    if(position==2){backgroundColor = Colors.indigo;}
  }
  if(leagueName==LeagueOfficialNames().inglaterra1 || leagueName==LeagueOfficialNames().italia1
      || leagueName==LeagueOfficialNames().espanha1 || leagueName==LeagueOfficialNames().franca1
      || leagueName==LeagueOfficialNames().alemanha1 || leagueName==LeagueOfficialNames().ptHol
  ){
    if(position==1){backgroundColor = Colors.indigo;}
    if(position==2){backgroundColor = Colors.indigo;}
    if(position==3){backgroundColor = Colors.indigo;}
  }
  if(leagueName==LeagueOfficialNames().argentina  || leagueName==LeagueOfficialNames().colombia){
    for(int i=1; i<6; i++){
      if(position==i){backgroundColor = Colors.indigo;}
    }
  }
  if(leagueName==LeagueOfficialNames().brasil1){
    for(int i=1; i<8; i++){
      if(position==i){backgroundColor = Colors.indigo;}
    }
  }
  if(leagueName==LeagueOfficialNames().sulamericano){
    for(int i=1; i<12; i++){
      if(position==i){backgroundColor = Colors.indigo;}
    }
  }

  //REBAIXAMENTO
  List<String> divisionsNames = Divisions().leagueDivisionsStructure(leagueName);
  if(divisionsNames.length > 1 && leagueName != divisionsNames.last){
    if(position==league.nClubs-3){backgroundColor = Colors.red;}
    if(position==league.nClubs-2){backgroundColor = Colors.red;}
    if(position==league.nClubs-1){backgroundColor = Colors.red;}
  }
  if(teamName==My().clubName){backgroundColor = Colors.teal;}

  return backgroundColor;
}