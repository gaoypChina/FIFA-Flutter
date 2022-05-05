import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/players_historic.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

import '../../classes/geral/name.dart';

class InternationalHistoric extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const InternationalHistoric({Key? key}) : super(key: key);
  @override
  _InternationalHistoricState createState() => _InternationalHistoricState();
}

class _InternationalHistoricState extends State<InternationalHistoric> {

  List<String> possibleYears = [];
  String selectedYear = anoInicial.toString();
  String leagueInternational = LeagueOfficialNames().championsLeague;
  bool isMataMata = true;

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    possibleYears = [];
    for(int year=anoInicial;year<ano;year++){
      possibleYears.add(year.toString());
    }
    return Scaffold(
        body:  Container(
          decoration: Images().getWallpaperContainerDecoration(),
          child: Column(
            children: [

              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    internationalLogoSelection(),
                    const SizedBox(width: 6),
                    dropDownButton(),
                    const SizedBox(width: 6),
                    phaseSelection(),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                            isMataMata
                                ? internationalHistoricColumn(int.parse(selectedYear),leagueInternational)
                                : groupsClassificationColumn(int.parse(selectedYear),leagueInternational),
                      ],
                    ),
                  ),
                ),
              ),

              //PRÓXIMO
              Padding(
                padding: const EdgeInsets.all(6),
                child:  customButtonContinue(
                    title: Translation(context).text.next,
                    function: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const PlayersHistoric()));
                    }
                ),
              ),
              //VOLTAR
              Padding(
                padding: const EdgeInsets.all(6),
                child:  customButtonContinue(
                    title: Translation(context).text.returnTo,
                    function: (){
                      Navigator.pop(context);
                    }
                ),
              ),


            ],
          ),
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget dropDownButton(){
    return                   Container(
      decoration: BoxDecoration(
        color:Colors.white, //background color of dropdown button
        border: Border.all(color: Colors.black38, width:2), //border of dropdown button
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 4),
        child: DropdownButton<String>(
          value: selectedYear,
          style: const TextStyle(fontSize: 18, color: Colors.white),
          iconEnabledColor: Colors.black, //Icon color
          underline: Container(), //empty line
          dropdownColor: Colors.white,
          items: possibleYears.map((value) {
            return DropdownMenuItem(
              child: Text(value,style: EstiloTextoPreto.text16),
              value: value,
            );
          }).toList(),
          onChanged: (value) {
            setState(() {});
            selectedYear = value.toString();
          },
        ),
      ),
    );
  }
  Widget phaseSelection(){
    return GestureDetector(
      onTap: (){
        isMataMata = !isMataMata;
        setState(() { });
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color:Colors.white, //background color of dropdown button
          border: Border.all(color: Colors.black38, width:2), //border of dropdown button
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(4.0),
        alignment: Alignment.center,
        child: isMataMata ? Text(Translation(context).text.knockoutStage.toUpperCase(),style: EstiloTextoPreto.text20)
        : Text(Translation(context).text.groupStage.toUpperCase(),style: EstiloTextoPreto.text20),
      ),
    );
  }
  Widget internationalLogoSelection(){
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color:Colors.white, //background color of dropdown button
        border: Border.all(color: Colors.black38, width:2), //border of dropdown button
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          //LIBERTADORES OU CHAMPIONS LEAGUE
          leagueInternational == LeagueOfficialNames().championsLeague ? GestureDetector(
              onTap: (){
                leagueInternational = LeagueOfficialNames().libertadores;
                setState(() {});
              },
              child: Image.asset(FIFAImages().campeonatoInternacionalLogo(LeagueOfficialNames().championsLeague),width: 50,height: 50)
          ): GestureDetector(
              onTap: (){
                leagueInternational = LeagueOfficialNames().championsLeague;
                setState(() {});
              },
              child: Image.asset(FIFAImages().campeonatoInternacionalLogo(LeagueOfficialNames().libertadores),width: 50,height: 50)
          ),
        ],
      ),
    );
  }
  Widget internationalHistoricColumn(int ano,String internationalLeagueName){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Text(Name().showTranslated(context, Name().finale).toUpperCase(),style: EstiloTextoBranco.text14),
        for(int idaVolta=0;idaVolta<1;idaVolta++)
          for(int i=0;i<2;i+=2)
            internationalHistoricRow(internationalLeagueName,Name().finale, i, idaVolta, ano),

        const Text('',style: EstiloTextoBranco.text16),
        Text(Name().showTranslated(context, Name().semifinal).toUpperCase(),style: EstiloTextoBranco.text14),
        for(int idaVolta=0;idaVolta<2;idaVolta++)
          for(int i=0;i<4;i+=2)
            internationalHistoricRow(internationalLeagueName,Name().semifinal, i, idaVolta, ano),

        const Text('',style: EstiloTextoBranco.text16),
        Text(Name().showTranslated(context, Name().quartas).toUpperCase(),style: EstiloTextoBranco.text14),
        for(int idaVolta=0;idaVolta<2;idaVolta++)
          for(int i=0;i<8;i+=2)
            internationalHistoricRow(internationalLeagueName,Name().quartas, i, idaVolta, ano),

        const Text('',style: EstiloTextoBranco.text16),
        Text(Name().showTranslated(context, Name().oitavas).toUpperCase(),style: EstiloTextoBranco.text14),
        for(int idaVolta=0;idaVolta<2;idaVolta++)
          for(int i=0;i<16;i+=2)
            internationalHistoricRow(internationalLeagueName,Name().oitavas, i, idaVolta, ano),

        const Text('',style: EstiloTextoBranco.text16),
        const Text('',style: EstiloTextoBranco.text16),
      ],
    );
  }
  Widget internationalHistoricRow(String internationalLeague, String phase, int position, int idaVolta, int ano){
    Map map = globalHistoricInternationalGoalsAll[ano][internationalLeague][phase];

    int clubID1 = map.keys.elementAt(position);
    if(idaVolta==1){
      clubID1 = map.keys.elementAt(position+1);
    }
    String clubName1 = Club(index: clubID1).name;
    String goal1 = globalHistoricInternationalGoalsAll[ano][internationalLeague][phase][clubID1][idaVolta].toString();

    int clubID2 = map.keys.elementAt(position+1);
    if(idaVolta==1){
      clubID2 = map.keys.elementAt(position);
    }
    String clubName2 = Club(index: clubID2).name;
    String goal2 = globalHistoricInternationalGoalsAll[ano][internationalLeague][phase][clubID2][idaVolta].toString();

    if(idaVolta==1){

    }
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images().getEscudo(clubName1),height: 25,width: 25),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(clubName1,style: EstiloTextoBranco.text14),
              ],
            ),
          ),
          Text(' $goal1 x $goal2 ',style: EstiloTextoBranco.text14),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('$clubName2 ',style: EstiloTextoBranco.text14),
              ],
            ),
          ),
          Image.asset(Images().getEscudo(clubName2),height: 25,width: 25),
        ],
      ),
    );
  }

  Widget groupsClassificationColumn(int ano,String internationalLeagueName){
    List clubsID = globalHistoricInternationalClassification[ano][internationalLeagueName];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Column(
            children: [
              for(int i=0; i< clubsID.length/2; i++)
                Padding(
                  padding: EdgeInsets.only(top: i%4==0 ? 16.0 : 0),
                  child: Column(
                    children: [
                      i%4==0 ? Text('${Translation(context).text.group} ${(i/4+1).floor()}',style: EstiloTextoBranco.text16) : Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(Images().getEscudo(Club(index: clubsID[i]).name),width: 25,height: 25),
                          Container(
                            width: 140,
                            color: Club(index: clubsID[i]).name == My().clubName
                                ? Colors.teal
                                : i%4==0 || i%4==1 ? Colors.deepPurple
                                : Colors.transparent,
                              child: Text(Club(index: clubsID[i]).name,style: EstiloTextoBranco.text16),
                          ),
                        ],
                      ),
                    ],
                  ),
                )

            ],
          ),
        ),

        Flexible(
          child: Column(
            children: [
              for(int i=(clubsID.length/2).round(); i< clubsID.length; i++)
                Padding(
                  padding: EdgeInsets.only(top: i%4==0 ? 16.0 : 0),
                  child: Column(
                    children: [
                      i%4==0 ? Text('${Translation(context).text.group} ${(i/4+1).floor()}',style: EstiloTextoBranco.text16) : Container(),
                      Row(
                        children: [
                          Image.asset(Images().getEscudo(Club(index: clubsID[i]).name),width: 25,height: 25),
                          Container(
                            width: 140,
                            color: Club(index: clubsID[i]).name == My().clubName
                                ? Colors.teal
                                : i%4==0 || i%4==1 ? Colors.deepPurple
                                : Colors.transparent,
                            child: Text(Club(index: clubsID[i]).name,style: EstiloTextoBranco.text16),
                          ),
                        ],
                      ),
                    ],
                  ),
                )

            ],
          ),
        ),
      ],
    );
  }

}