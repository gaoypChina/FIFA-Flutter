import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

Widget tabelaClassificacaoWidget(int choosenLeagueIndex){
  return Column(
    children: [
      Container(
        color: AppColors().greyTransparent,
        child: Row(
          children: const [
            SizedBox(width: 220),
            Text('PTS',style:EstiloTextoBranco.text14),
            SizedBox(width: 8),
            Text('GM ',style:EstiloTextoBranco.text14),
            SizedBox(width: 8),
            Text('GS ',style:EstiloTextoBranco.text14),
            SizedBox(width: 8),
            Text('SG ',style:EstiloTextoBranco.text14),
            SizedBox(width: 12),
            Text('OVR',style: EstiloTextoBranco.text14),
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
              rowTableNacional(i,choosenLeagueIndex),
          ],
        ),
      ),
    ],
  );
}

TableRow rowTableNacional(int i,int choosenLeagueIndex){
  List classificationClubsIndexes = Classification(leagueIndex: choosenLeagueIndex).classificationClubsIndexes;
  int fullClubIndex = classificationClubsIndexes[i];
  return rowTableNacionalLayout(i,fullClubIndex, choosenLeagueIndex);
}

TableRow rowTableNacionalLayout(int position, int indexClub, choosenLeagueIndex) {
  Club clubClass = Club(index: indexClub);
  String clubName = clubClass.name;
  String image = clubClass.picture;
  int points = clubClass.leaguePoints;
  int golsMarcados = clubClass.leagueGM;
  int golsSofridos = clubClass.leagueGS;
  int saldo = golsMarcados - golsSofridos;
  double overall = clubClass.getOverall();

  Color backgroundColor = backgroundTextColor(position,choosenLeagueIndex,clubName);

  return TableRow(
    children: [
      Text((position+1).toString()+'-',style: EstiloTextoBranco.text14),
      Image.asset('assets/clubs/$image.png',height: 25,width: 25),
      Container(
          width:170,
          padding: const EdgeInsets.all(2),
          color: backgroundColor,
          child: Text(clubName,style: EstiloTextoBranco.text16)
      ),
      Center(child: Text(points.toString(),style: EstiloTextoBranco.text14)),
      Center(child: Text(golsMarcados.toString(),style: EstiloTextoBranco.text14)),
      Center(child: Text(golsSofridos.toString(),style: EstiloTextoBranco.text14)),
      Center(child: Text(saldo.toString(),style: EstiloTextoBranco.text14)),
      Text(overall.toStringAsFixed(2),style: EstiloTextoBranco.text14),

    ],
  );
}



Color backgroundTextColor(int position, int choosenLeagueIndex , String teamName){

  String leagueName = League(index: choosenLeagueIndex).name;
  Color backgroundColor = Colors.transparent;

  //1ºCOLOCADO
  if(position==0){backgroundColor = Colors.yellowAccent.withOpacity(0.7);}

  //CLASSIFICAÇÃO
  if(leagueName==LeagueOfficialNames().inglaterra1 || leagueName==LeagueOfficialNames().italia1
      || leagueName==LeagueOfficialNames().espanha1 || leagueName==LeagueOfficialNames().franca1
      || leagueName==LeagueOfficialNames().alemanha1  || leagueName==LeagueOfficialNames().estadosUnidos
  ){
    if(position==1){backgroundColor = Colors.indigo;}
    if(position==2){backgroundColor = Colors.indigo;}
    if(position==3){backgroundColor = Colors.indigo;}
  }

  if(leagueName==LeagueOfficialNames().inglaterra2  || leagueName==LeagueOfficialNames().espanha2
      || leagueName==LeagueOfficialNames().italia2 || leagueName==LeagueOfficialNames().franca2
      || leagueName==LeagueOfficialNames().alemanha2
      || leagueName==LeagueOfficialNames().brasil2 || leagueName==LeagueOfficialNames().brasil3
  ){
    if(position==1){backgroundColor = Colors.indigo;}
    if(position==2){backgroundColor = Colors.indigo;}
  }

  if(leagueName==LeagueOfficialNames().lesteEuropeu || leagueName==LeagueOfficialNames().ligaEuropa
      || leagueName==LeagueOfficialNames().argentina  || leagueName==LeagueOfficialNames().colombiaMexico
  ){
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
  if(leagueName==LeagueOfficialNames().inglaterra1 || leagueName==LeagueOfficialNames().brasil1){
    if(position==13){backgroundColor = Colors.red;}
    if(position==14){backgroundColor = Colors.red;}
    if(position==15){backgroundColor = Colors.red;}
  }
  if(teamName==My().clubName){backgroundColor = Colors.teal;}

  return backgroundColor;
}