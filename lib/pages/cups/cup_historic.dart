import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/historic_champions/internationals.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class CupHistoric extends StatefulWidget {
  const CupHistoric({Key? key}) : super(key: key);

  @override
  State<CupHistoric> createState() => _CupHistoricState();
}

class _CupHistoricState extends State<CupHistoric> {

  Map<double,dynamic> results = mapInternationals[LeagueOfficialNames().mundial];

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
      body: Stack(
        children: [

          Images().getWallpaper(),

          Column(
            children: [

              backButtonText(context,'Cup Historic'),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        matchBox(),
                        matchBox(),
                        matchBox(),
                        matchBox(),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        matchBox(),
                        matchBox(),
                      ],
                    ),

                    SizedBox(
                      width: Sized(context).width,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: Sized(context).width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                matchBox(),
                                const SizedBox(height: 8),
                                matchBox(),
                              ],
                            ),
                          ),

                          Container(
                              margin: const EdgeInsets.only(top:70,left: 60),
                              child: selectYearButton(ano),
                          ),

                          Container(
                            padding: const EdgeInsets.only(top:50),
                            child: Row(
                              children: [
                                const Spacer(),
                                matchBox(),
                                Stack(
                                  children: [
                                    Image.asset('assets/trophy/trophylibertadores.png',height: 95,width: 50),
                                    Container(
                                        height: 95,width: 50,
                                        alignment: Alignment.bottomRight,
                                        child: Images().getEscudoWidget('Milan',40,40)),
                                  ],
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        matchBox(),
                        matchBox(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        matchBox(),
                        matchBox(),
                        matchBox(),
                        matchBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget selectYearButton(int year){
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors().greyTransparent,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
            color: Colors.greenAccent,
            width: 1.0,
        ),
      ),
      child: Text(year.toString(),style: EstiloTextoBranco.negrito18),
    );
  }
Widget matchBox(){
    Confronto confronto = Confronto(clubName1: 'Peñarol', clubName2: 'Milan', goal1: 1, goal2: 3);
    confronto.setPenalties(penaltis1: 2, penaltis2: 3);
    double imageSize = 35;
    return Container(
      height: 90,
      width: 80,
      padding: const EdgeInsets.all(4),
      color: AppColors().greyTransparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
                    Images().getEscudoWidget(confronto.clubName1,imageSize,imageSize),
              Images().getEscudoWidget(confronto.clubName2,imageSize,imageSize),
            ],
          ),
          Text('${confronto.goal1.toString()}  x  ${confronto.goal2.toString()}',style: EstiloTextoBranco.text16),

          confronto.hasPenaltis
              ? Text('Pen: (${confronto.penaltis1.toString()} x ${confronto.penaltis2.toString()})',style: EstiloTextoBranco.text10)
              : Container(),
        ],
      ),
    );
}

}


