import 'package:fifa/classes/club.dart';
import 'package:fifa/global/global_variables.dart';
import 'package:fifa/global/globalfunctions.dart';
import 'package:fifa/global/images.dart';
import 'package:fifa/pages/table/widget_bottom.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';

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
  }
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

          resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
          body:  Stack(
              children: [

                leagueInternational == 'Champions'
                    ? Image.asset('assets/icons/fundochampions.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill)
                    : Image.asset('assets/icons/fundolibertadores.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

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
                        leagueInternational,
                            (value){
                          setState(() {});
                          leagueInternational=value;
                          selectTeams();
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
  selectTeams(){
    clubsID = [];
    if(leagueInternational=='Champions'){
      if(semana<semanasJogosInternacionais[0] && ano==anoInicial){
        for(int i=0; i<32; i++) {
          clubsID.add(GlobalFunctions().getClubIndexFromName(defaultChampionsLeagueClubs[i]));
        }
      }else{
        clubsID = globalInternational32ClubsID[0];
      }
    }
    if(leagueInternational=='Libertadores'){
      if(semana<semanasJogosInternacionais[0] && ano==anoInicial){
        for(int i=0; i<32; i++) {
          clubsID.add(GlobalFunctions().getClubIndexFromName(defaultLibertadoresClubs[i]));
        }
      }else{
        clubsID = globalInternational32ClubsID[1];
      }
    }

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
          child: Text('\nGrupo ' + groupLetter,style: EstiloTextoBranco.text16),
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
    String teamName = clubClass.name;
    int points = clubClass.internationalPoints;
    int golsMarcados = clubClass.internationalGM;
    int golsSofridos = clubClass.internationalGS;
    int saldoGols = golsMarcados - golsSofridos;
    double overall = clubClass.getOverall();
    return  TableRow(
      children: [
        Text(i.toString()+'-',style: EstiloTextoBranco.text16),
        //Escudo
        Image.asset('assets/clubs/${FIFAImages().imageLogo(teamName)}.png',height: 20,width: 20),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(teamName,style: EstiloTextoBranco.text16),
        ),
        Text(points.toString(),style: EstiloTextoBranco.text14),
        Text(golsMarcados.toString(),style: EstiloTextoBranco.text14),
        Text(golsSofridos.toString(),style: EstiloTextoBranco.text14),
        Text(saldoGols.toString(),style: EstiloTextoBranco.text14),
        Text(overall.toStringAsFixed(2),style: EstiloTextoBranco.text14),
      ],
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////


}