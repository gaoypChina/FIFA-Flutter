import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/international.dart';
import 'package:fifa/classes/international_league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/table_international/widget_bottom.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/background_image/backimage_international_league.dart';
import 'package:flutter/material.dart';

class TableInternational extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final String leagueInternational;
  const TableInternational({Key? key, required this.leagueInternational}) : super(key: key);
  @override
  _TableInternationalState createState() => _TableInternationalState();
}

class _TableInternationalState extends State<TableInternational> {

  String leagueInternational = '';
  List clubsID = [];

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    onStart();
    selectTeams();
    super.initState();
  }
  onStart(){
    leagueInternational = widget.leagueInternational;
    if(leagueInternational == LeagueOfficialNames().resto){
      leagueInternational = LeagueOfficialNames().championsLeague;
    }
  }
  selectTeams(){
    clubsID = [];
    //ANO INICIAL, COM TIMES DEMO
      if(semana<semanasJogosInternacionais[0] && ano==anoInicial || semanasJogosInternacionais[0]==1){
        clubsID = InternationalLeague().getClubs(leagueInternational);
      //SE JÁ TIVER OS CLUBES DO CAMPEONATO CONFIGURADO
      }else{
        clubsID = International(leagueInternational).getClassification();
        if(leagueInternational == LeagueOfficialNames().europaLeagueOficial ||
            leagueInternational == LeagueOfficialNames().copaSulAmericana){
          clubsID =  InternationalLeague().getClubs(leagueInternational);
        }
      }

  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body:  Stack(
            children: [

              backgroundInternationalLeague(leagueInternational),

              Column(
                children: [
                  const SizedBox(height: 30),

                      //CLASSIFICAÇÃO
                      Expanded(
                        child: Container(
                          color: AppColors().greyTransparent,
                          child: SingleChildScrollView(
                            child: Table(
                              columnWidths: const{0: FractionColumnWidth(.05),1: FractionColumnWidth(.05),2: FractionColumnWidth(.4)},
                              children: [
                            for (int groupNumber = 0; groupNumber < 8; groupNumber++)
                              for (int i = 0; i < 5; i++)
                                  if (i == 0)
                                    groupTitle(groupNumber)
                                   else
                                    groupRow(i,4*groupNumber+(i-1))
                              ],
                            ),
                          ),
                        ),
                      ),


                  customWidgetBottomBar(
                      context,
                      WidgetBottomInternational().classificacao,
                      leagueInternational,
                          (value){
                        setState(() {});
                        leagueInternational=value;
                        selectTeams();
                      }
                  ),

              ]),

        ]),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
TableRow groupTitle(int groupNumber){
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
  TableRow groupRow(int i, int index032){
    int clubIndex = clubsID[index032];
    Club clubClass = Club(index: clubIndex);
    My my = My();
    int saldoGols = clubClass.internationalGM - clubClass.internationalGS;

    return  TableRow(
      children: [
        Text(i.toString()+'-',style: EstiloTextoBranco.text16),
        //Escudo
        Images().getEscudoWidget(clubClass.name,20,20),
        GestureDetector(
          onTap:(){
            clickClubProfilePage(context, clubClass);
          },
          child: Container(
            color: clubClass.name == my.clubName
                ? Colors.green
                : i==1 || i==2 ? Colors.deepPurple
                      : Colors.transparent,
            padding: const EdgeInsets.all(2.0),
            child: Text(clubClass.name,style: EstiloTextoBranco.text16),
          ),
        ),
        Text(' ${clubClass.internationalPoints.toString()}',style: EstiloTextoBranco.text14),
        Text(clubClass.internationalGM.toString(),style: EstiloTextoBranco.text14),
        Text(clubClass.internationalGS.toString(),style: EstiloTextoBranco.text14),
        Text(saldoGols.toString(),style: EstiloTextoBranco.text14),
        Text(clubClass.getOverall().toStringAsFixed(2),style: EstiloTextoBranco.text14),
      ],
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////


}