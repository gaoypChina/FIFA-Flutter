import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/classes/table_matchs_control.dart';
import 'package:fifa/pages/table_international/widget_bottom.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/background_image/backimage_international_league.dart';
import 'package:flutter/material.dart';

class TableMatchs extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final String leagueInternational;
  const TableMatchs({Key? key, required this.leagueInternational}) : super(key: key);
  @override
  _TableMatchsState createState() => _TableMatchsState();
}

class _TableMatchsState extends State<TableMatchs> {

  String leagueInternational = '';
  int rodadaShow = semanasGruposInternacionais.contains(semana)
                    ? semanasGruposInternacionais.indexOf(semana)+1
                    : semana > semanasGruposInternacionais.last
                      ? 6 : 1;

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    leagueInternational = widget.leagueInternational;
    super.initState();
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

                  //TABELA
                  Expanded(
                    child: Container(
                        color: AppColors().greyTransparent,
                        height: Sized(context).height*0.9,
                        width: Sized(context).width*0.92,
                        child: SingleChildScrollView(child: tableWidget())
                    ),
                  ),

                  chooseRodada(),

                  customWidgetBottomBar(
                      context,
                      WidgetBottomInternational().partidas,
                      leagueInternational,
                          (value){
                        setState(() {});
                        leagueInternational=value;
                      }
                  ),

                ]),

          ]),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget tableWidget() {
    return Column(
      children: [

      for (int groupNumber = 0; groupNumber < 8; groupNumber++)
        for (int nConfronto = -1; nConfronto < 2; nConfronto++) //Tem linha com título
          Table(
            columnWidths: const{0: FractionColumnWidth(.35),4: FractionColumnWidth(.35)},
            children: [
              if (nConfronto == -1)
                groupTitle(groupNumber)
              else
                groupRow(groupNumber,nConfronto)
            ],
          )
      ],
    );
  }

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
        Text('\n${Translation(context).text.group} ' + groupLetter,style: EstiloTextoBranco.text16),
        Container(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }
  TableRow groupRow(int groupNumber, int nConfronto){
    MatchResultInternational match = MatchResultInternational(rodadaNumber: rodadaShow-1,groupNumber: groupNumber, nConfronto: nConfronto, competitionName: leagueInternational);
    My my = My();

    String teamNameA = match.clubName1;
    String teamNameB =  match.clubName2;
    int golsA = match.goals1;
    int golsB = match.goals2;

    return  TableRow(
      children: [
        Container(
          color: teamNameA == my.clubName ? Colors.green : Colors.transparent,
            child: Text(teamNameA,textAlign: TextAlign.right,style: EstiloTextoBranco.text16)),
        //Escudo
        Images().getEscudoWidget(teamNameA,20,20),

        match.isAlreadyPlayed
            ? Text(golsA.toString()+'x'+golsB.toString(),style: EstiloTextoBranco.text16)
            : const Center(child: Text('x',style: EstiloTextoBranco.text16)),

        //Escudo
        Images().getEscudoWidget(teamNameB,20,20),

        Container(
            color: teamNameB == my.clubName ? Colors.green : Colors.transparent,
            child: Text(teamNameB,style: EstiloTextoBranco.text16)),
      ],
    );
  }

  Widget chooseRodada(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //BOTAO ESQUERDA
        GestureDetector(
          onTap: (){
            rodadaShow--;
            if(rodadaShow<=1){
              rodadaShow = 1;
            }
            setState(() {});
          },child: const Icon(Icons.arrow_left,color:Colors.white,size: 50),
        ),

        //RODADA
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('${Translation(context).text.matchWeek}: $rodadaShow',style: EstiloTextoBranco.text22),
        ),

        //BOTAO DIREITA
        GestureDetector(
          onTap: (){
            rodadaShow++;
            if(rodadaShow>=6){
              rodadaShow = 6;
            }
            setState(() {});
          },child: const Icon(Icons.arrow_right,color:Colors.white,size: 50),
        ),
      ],
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////


}