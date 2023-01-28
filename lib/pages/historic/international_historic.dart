import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/countries/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/historic_champions/historic_champions.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
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
  bool isLoaded = false;
  bool isMataMata = true;
  bool isList = false;
////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    initialSelectedYear();
    super.initState();
  }
  initialSelectedYear(){
    if(ano<=anoInicial){
      selectedYear = (anoInicial-1).toString();
    }
    isLoaded = true;
    setState((){});
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    possibleYears = [];
    Iterable<double> yearsKeys = mapChampions(leagueInternational).keys;
    for(int year=0;year<mapChampions(leagueInternational).length;year++){
      possibleYears.add((year+yearsKeys.last.toInt()).toString());
    }
    for(int year=anoInicial;year<ano;year++){
      possibleYears.add(year.toString());
    }
    if(!possibleYears.contains(selectedYear)){
      selectedYear = possibleYears.first;
    }
    return Scaffold(
        body:  Container(
          decoration: Images().getWallpaperContainerDecoration(),
          child: isLoaded ? Column(
            children: [
              backButtonText(context, leagueInternational),

              !isList ?
              int.parse(selectedYear) >= anoInicial ?
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                            isMataMata
                                ? internationalHistoricColumnSimulation(int.parse(selectedYear),leagueInternational)
                                : groupsClassificationColumnSimulation(int.parse(selectedYear),leagueInternational)

                      ],
                    ) ,
                  ),
                ),
              ) : internationalHistoricColumn(int.parse(selectedYear))
                : listViewChampions(),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    internationalLogoSelection(),
                    const SizedBox(width: 6),
                    !isList ? dropDownButton() : Container(),
                    const SizedBox(width: 6),
                    !isList && int.parse(selectedYear)>=anoInicial ? phaseSelection() : Container(),
                    inListForm(),
                  ],
                ),
              ),
              const SizedBox(height: 10),

            ],
          ) : Container(),

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
        child: isMataMata ? Text(Translation(context).text.knockoutStage.toUpperCase(),style: EstiloTextoPreto.text16)
        : Text(Translation(context).text.groupStage.toUpperCase(),style: EstiloTextoPreto.text16),
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
                if(isList){
                  customToast(Translation(context).text.loading);
                }
                setState(() {});
              },
              child: Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().championsLeague), width: 50,height: 50)
          ): GestureDetector(
              onTap: (){
                leagueInternational = LeagueOfficialNames().championsLeague;
                if(isList){
                  customToast(Translation(context).text.loading);
                }
                setState(() {});
              },
              child: Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().libertadores),width: 50,height: 50)
          ),
        ],
      ),
    );
  }
  Widget inListForm(){
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color:Colors.white, //background color of dropdown button
        border: Border.all(color: Colors.black38, width:2), //border of dropdown button
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 4),
      child: GestureDetector(
          onTap: (){
            customToast(Translation(context).text.loading);
            isList = !isList;
            setState(() {});
          },
          child: Center(child: Text(Translation(context).text.lista.toUpperCase(),textAlign:TextAlign.center,style: EstiloTextoPreto.text16))
      ),
    );
  }
  Widget internationalHistoricColumnSimulation(int ano,String internationalLeagueName){
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

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Images().getEscudoWidget(clubName1,25,25),
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
          Images().getEscudoWidget(clubName2,25,25),
        ],
      ),
    );
  }

  Widget groupsClassificationColumnSimulation(int ano,String internationalLeagueName){
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
                          Images().getEscudoWidget(Club(index: clubsID[i]).name,25,25),
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
                          Images().getEscudoWidget(Club(index: clubsID[i]).name,25,25),
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


  Widget internationalHistoricColumn(int year){
    Map map = mapChampions(leagueInternational);
    List list = map[year.toDouble()];
    return Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (c,i){
                    String nationality = ClubDetails().getCountry(list[i]);
                    int position = i+1;
                  return         Container(
                    padding: const EdgeInsets.only(left: 12),
                    margin: (position == 2 || position == 4 || position == 8 || position == 16)
                        ? const EdgeInsets.only(bottom:16) : EdgeInsets.zero,
                    child: Row(
                      children: [
                        SizedBox(width:30, child: Text('${(i+1).toString()}º ',style: EstiloTextoBranco.text16)),
                        const SizedBox(width: 4),
                        funcFlagsList(nationality, 15, 25),
                        const SizedBox(width: 8),
                        Images().getEscudoWidget(list[i],30,30),
                        const SizedBox(width: 8),
                        Text(list[i],style: EstiloTextoBranco.text16),
                      ],
                    ),
                  );
                },
              ),
            );
  }

  Widget listViewChampions(){
    Map map = mapChampions(leagueInternational);
    List mapKeys = [];
    map.forEach((key, value) {
      mapKeys.add(key);
    });
    return
      Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                //ANO
                for(double key in map.keys)
                  Container(
                      height: 30,
                      width: 97,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: Center(child: Text(key.toStringAsFixed(0),style: EstiloTextoBranco.negrito18)),
                  ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    for(double key in map.keys)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4,horizontal: 6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for(var position in map[key])
                              positionListClub(map[key], map[key].indexOf(position))
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget positionListClub(List list, int position){
    String nationality = ClubDetails().getCountry(list[position]);
    return Container(
      width: 85,
      margin: (position+1 == 2 || position+1 == 4 || position+1 == 8 || position+1 == 16)
        ? const EdgeInsets.only(bottom:16) : EdgeInsets.zero,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width:30, child: Text('${(position+1).toString()}º ',style: EstiloTextoBranco.text16)),
              const SizedBox(width: 4),
              funcFlagsList(nationality, 12, 15),
              Images().getEscudoWidget(list[position],25,25),
              const SizedBox(width: 8),
              //Text(list[position],style: EstiloTextoBranco.text16),
            ],
          ),
          Text(list[position],style: EstiloTextoBranco.text8),
        ],
      ),
    );
  }
}