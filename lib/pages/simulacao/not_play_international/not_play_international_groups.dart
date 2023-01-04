import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/international.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';


Widget notPlayShowInternationalGroups(BuildContext context, String internationalLeagueName){

return Expanded(
  child: Container(
    color: AppColors().greyTransparent,
    child: SingleChildScrollView(
      child: Table(
        columnWidths: const{0: FractionColumnWidth(.05),1: FractionColumnWidth(.05),2: FractionColumnWidth(.4)},
        children: [
          for (int groupNumber = 0; groupNumber < 8; groupNumber++)
            for (int i = 0; i < 5; i++)
              if (i == 0)
                groupTitle(context, groupNumber)
              else
                groupRow(i,internationalLeagueName,4*groupNumber+(i-1))
        ],
      ),
    ),
  ),
);
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
TableRow groupTitle(BuildContext context, int groupNumber){
  String groupLetter = 'A';
  if(groupNumber==1){groupLetter='B';}
  if(groupNumber==2){groupLetter='C';}
  if(groupNumber==3){groupLetter='D';}
  if(groupNumber==4){groupLetter='E';}
  if(groupNumber==5){groupLetter='F';}
  if(groupNumber==6){groupLetter='G';}
  if(groupNumber==7){groupLetter='H';}
  return TableRow(
    children: [
      const Text('',style: EstiloTextoBranco.text16),
      const Text('',style: EstiloTextoBranco.text16),
      SizedBox(
        width: 200,
        child: Text('\n${Translation(context).text.group} ' + groupLetter,style: EstiloTextoBranco.text16),
      ),
      const Text('\nPTS ',style: EstiloTextoBranco.text16),
      const Text('\n GM ',style: EstiloTextoBranco.text16),
      const Text('\n GS ',style: EstiloTextoBranco.text16),
      const Text('\n SG ',style: EstiloTextoBranco.text16),
      const Text('\nOVR ',style: EstiloTextoBranco.text16),
    ],
  );
}
TableRow groupRow(int i, internationalLeagueName, int index032){
  List clubsID = selectTeams(internationalLeagueName);
  int clubIndex = clubsID[index032];
  Club clubClass = Club(index: clubIndex);
  My my = My();
  int saldoGols = clubClass.internationalGM - clubClass.internationalGS;

  return  TableRow(
    children: [
      Text(i.toString()+'-',style: EstiloTextoBranco.text16),
      //Escudo
      Images().getEscudoWidget(clubClass.name,20,20),
      Container(
        color: clubClass.name == my.clubName
            ? Colors.green
            : i==1 || i==2 ? Colors.deepPurple
            : Colors.transparent,
        padding: const EdgeInsets.all(2.0),
        child: Text(clubClass.name,style: EstiloTextoBranco.text16),
      ),
      Text(' ${clubClass.internationalPoints.toString()}',style: EstiloTextoBranco.text14),
      Text(clubClass.internationalGM.toString(),style: EstiloTextoBranco.text14),
      Text(clubClass.internationalGS.toString(),style: EstiloTextoBranco.text14),
      Text(saldoGols.toString(),style: EstiloTextoBranco.text14),
      Text(clubClass.getOverall().toStringAsFixed(2),style: EstiloTextoBranco.text14),
    ],
  );
}

List selectTeams(String internationalLeagueName){
  List clubsID = [];
  //ANO INICIAL, COM TIMES DEMO
  if(semana<semanasJogosInternacionais[0] && ano==anoInicial){
    for(int i=0; i<32; i++) {
      if(internationalLeagueName == LeagueOfficialNames().championsLeague) {
        clubsID.add(clubsAllNameList.indexOf(defaultChampionsLeagueClubs[i]));
      }
      if(internationalLeagueName == LeagueOfficialNames().libertadores){
        clubsID.add(clubsAllNameList.indexOf(defaultLibertadoresClubs[i]));
      }
    }
  }else{
    clubsID = International(internationalLeagueName).getClassification();
  }
  return clubsID;
}



