import 'package:fifa/global/images.dart';
import 'package:fifa/pages/table/widget_bottom.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';

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
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return WillPopScope(//IF GO BACK TO PREVIOUS PAGE
        onWillPop: () async{
          return true;
        },
        child: Scaffold(

          resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
          body:  Stack(
              children: [

          leagueInternational == 'Champions'
          ? Image.asset('assets/icons/fundochampions.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill)
                : Image.asset('assets/icons/fundolibertadores.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

                Column(
                    children: [
                      const SizedBox(height: 40),

                      //TABELA
                      Expanded(
                        child: Center(
                          child: Container(
                              color: AppColors().greyTransparent,
                              height: _height*0.9,
                              width: _width*0.9,
                              child: tableWidget()
                          ),
                        ),
                      ),


                      customWidgetBottomBar(
                          context,
                          leagueInternational,
                              (value){
                            setState(() {});
                            leagueInternational=value;
                          }
                      ),

                    ]),

              ]),
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget tableWidget() {
    return Column(
      children: [

      for (int groupNumber = 0; groupNumber < 8; groupNumber++)
        for (int i = 0; i <= 2; i++)
          Table(
            columnWidths: const{0: FractionColumnWidth(.35),4: FractionColumnWidth(.35)},
            children: [
              if (i == 0)
                groupTitle(groupNumber)
              else
                groupRow(groupNumber,i,'Palmeiras','Santos')
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
        Text('\nGrupo ' + groupLetter,style: EstiloTextoBranco.text16),
        Container(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }
  TableRow groupRow(int groupNumber, int i, String teamNameA, String teamNameB){
    int golsA = 0;
    int golsB = 2;
    return  TableRow(
      children: [
        Text(teamNameA,textAlign: TextAlign.left,style: EstiloTextoBranco.text16),
        //Escudo
        Image.asset('assets/clubs/${FIFAImages().imageLogo(teamNameA)}.png',height: 20,width: 20),

        Text(golsA.toString()+'x'+golsB.toString(),style: EstiloTextoBranco.text16),
        //Escudo
        Image.asset('assets/clubs/${FIFAImages().imageLogo(teamNameB)}.png',height: 20,width: 20),

        Text(teamNameB,style: EstiloTextoBranco.text16),
      ],
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////


}