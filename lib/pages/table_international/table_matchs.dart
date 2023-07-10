import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/table/table_matchs_control.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/background_color/match_x_testyle.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/decoration/my_team_gradient.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/background_image/backimage_international_league.dart';
import 'package:fifa/widgets/match_row.dart';
import 'package:flutter/material.dart';

class TableMatchs extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final String leagueInternational;
  const TableMatchs({Key? key, required this.leagueInternational}) : super(key: key);
  @override
  _TableMatchsState createState() => _TableMatchsState();
}

class _TableMatchsState extends State<TableMatchs> {

  My my = My();
  int rodadaShow = semanasGruposInternacionais.contains(semana)
                    ? semanasGruposInternacionais.indexOf(semana)+1
                    : semana > semanasGruposInternacionais.last
                      ? 6 : 1;

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
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

            backgroundInternationalLeague(widget.leagueInternational),

            Column(
                children: [

                  //TABELA
                  Expanded(
                    child: Container(
                        color: AppColors().greyTransparent,
                        width: Sized(context).width*0.94,
                        child: SingleChildScrollView(
                            padding: EdgeInsets.zero,
                            child: tableWidget()
                        )
                    ),
                  ),

                  chooseRodada(),


                ]),

          ]),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget tableWidget() {

    My my = My();

    return Column(
      children: [

      for (int groupNumber = 0; groupNumber < 8; groupNumber++)
        for (int nConfronto = -1; nConfronto < 2; nConfronto++) //Tem linha com título
          Column(
            children: [
              if (nConfronto == -1)
                groupTitle(groupNumber)
              else
                matchRowWidget(
                    MatchResultInternational(
                      rodadaNumber: rodadaShow-1,
                      groupNumber: groupNumber,
                      nConfronto: nConfronto,
                      competitionName: widget.leagueInternational
                  ).confronto,
                  my)
            ],
          )
      ],
    );
  }

  Row groupTitle(int groupNumber){
    String groupLetter = 'A';
    if(groupNumber==1){groupLetter='B';}
    if(groupNumber==2){groupLetter='C';}
    if(groupNumber==3){groupLetter='D';}
    if(groupNumber==4){groupLetter='E';}
    if(groupNumber==5){groupLetter='F';}
    if(groupNumber==6){groupLetter='G';}
    if(groupNumber==7){groupLetter='H';}
    return Row(
      children: [
        Text('\n${Translation(context).text.group} ' + groupLetter,style: EstiloTextoBranco.negrito16),
        Container(),
        Container(),
        Container(),
        Container(),
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