import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/pages/table/widgets/table_widget.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class FimCampeonato extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const FimCampeonato({Key? key}) : super(key: key);
  @override
  _FimCampeonatoState createState() => _FimCampeonatoState();
}

class _FimCampeonatoState extends State<FimCampeonato> {

  //late double _height, _width;
  My myClub = My();
  late League myLeague = League(index: myClub.leagueID);

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    //_height = MediaQuery.of(context).size.height;
    return WillPopScope(//IF GO BACK TO PREVIOUS PAGE
      onWillPop: () async{
        return true;
      },
      child: Scaffold(
          body:  Stack(
              children: [

                Images().getWallpaper(),

                Column(
                  children: [

                    const SizedBox(height: 40),

                    Text(Translation(context).text.finalClassification,style:EstiloTextoBranco.text20),
                    const SizedBox(height: 8),

                    //TABELA
                    tabelaClassificacaoWidget(context,myLeague),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //Escudo
                        Images().getMyEscudo(size: 60),

                        const SizedBox(width: 10),

                        //EXPECTATIVA
                        Column(
                          children: [
                            Text('${Translation(context).text.expectation}:',style: EstiloTextoBranco.text14),
                            Text(myClub.getLastYearExpectativa().toString()+'º',style: EstiloTextoBranco.text30),
                          ],
                        ),

                        const Icon(Icons.arrow_right,size:40,color:Colors.white),

                        //CLASSIFICAÇÃO FINAL
                        Column(
                          children: [
                            Text(Translation(context).text.classification,style: EstiloTextoBranco.text14),
                            Text(Classification(leagueIndex: myClub.leagueID).getClubPosition(myClub.clubID).toString()+'º',style: EstiloTextoBranco.text30),
                          ],
                        ),

                      ],
                    ),

                    const Spacer(),
                    //VOLTAR
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child:  customButtonContinue(
                          title: Translation(context).text.nextMatchWeek,
                          function: (){
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));
                          }
                      ),
                    ),


                  ],
                ),

              ]
          )
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

}