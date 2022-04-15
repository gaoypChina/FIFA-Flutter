import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/historic.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/my_historic.dart';
import 'package:fifa/pages/historic/international_historic.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

import '../../values/historic_champions.dart';

class HistoricLeague extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const HistoricLeague({Key? key}) : super(key: key);
  @override
  _HistoricLeagueState createState() => _HistoricLeagueState();
}

class _HistoricLeagueState extends State<HistoricLeague> {

  int choosenLeagueIndex = My().campeonatoID;
  late int nClubs;
  late League league;
  bool isOnlyChampion = false;
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    league = League(index: choosenLeagueIndex);
    nClubs = league.nClubs;

    return Scaffold(

        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Images().getWallpaper(),

              Column(
                children: [

                  const SizedBox(height: 40),
                  const Text('Histórico das ligas',style: EstiloTextoBranco.text22),
                  const SizedBox(height: 8),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text('Só Campeões',style: EstiloTextoBranco.text16),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              isOnlyChampion = !isOnlyChampion;
                              setState(() {});
                            },
                            child: isOnlyChampion
                            ? const Icon(Icons.radio_button_checked,color: Colors.white, size: 30)
                            : const Icon(Icons.radio_button_off,color: Colors.white, size: 30),
                          ),
                        )
                      ],
                    ),
                  ),
                  //TABELA
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          for(int year=ano-1;year>=anoInicial;year--)
                            yearRow(year),

                          for(int year=ano-1;year>ano-60;year--)
                            yearRowPast(year),
                        ],
                      ),
                    ),
                  ),

                  ////////////////////////////////////
                  //SELECT LEAGUE
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                          for(int i=0;i<leaguesListRealIndex.length;i++)
                            leagueSelectionRow(i)
                      ],
                    ),
                  ),

                  //VOLTAR
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child:  customButtonContinue(
                        title: 'PRÓXIMO',
                        function: (){
                          if(ano>anoInicial){
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const InternationalHistoric()));
                          }else{
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Historic()));
                          }
                          }
                    ),
                  ),
                  //VOLTAR
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child:  customButtonContinue(
                        title: 'VOLTAR',
                        function: (){
                          Navigator.pop(context);
                        }
                    ),
                  ),


                ],
              ),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget yearRow(int year){
    int nRows = league.nClubs;
    if(isOnlyChampion){
      nRows = 1;
    }
    return Column(
      children: [
        Text(year.toString(),style: EstiloTextoBranco.text16),

        for(int i=0;i<nRows;i++)
          classificationRow(year,i),

      ],
    );
  }
  Widget classificationRow(int year, int position){
    List classification = HistoricFunctions().funcHistoricListAll(year, league.name);
    int clubID = classification[position];

    Club club = Club(index: clubID);
    return Row(
      children: [
        position+1<10
            ? Text('  ${(position+1).toString()}- ',style: EstiloTextoBranco.text14)
            : Text('${(position+1).toString()}- ',style: EstiloTextoBranco.text14),
        Image.asset('assets/clubs/${FIFAImages().imageLogo(club.name)}.png',height: 20,width: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(club.name,style: EstiloTextoBranco.text14),
        ),
      ],
    );
  }

  //////////////////////////////////////////
  //HISTORICOS PASSADOS
  Widget yearRowPast(int ano){
    if(isOnlyChampion){
      return validacao(0, ano);
    }
    return Column(
      children: [
        for(int position=0;position<16;position++)
          validacao(position, ano),
      ],
    );
  }
  Widget validacao(int position, int ano){
    try {
      Map results = mapChampions(league.name);
      String clubName = results[ano][position];
      if(position == 0){
        return Column(
          children: [

            Text(ano.toString(),style: EstiloTextoBranco.text16),
            classificationPastRow(position,clubName),
          ],
        );
      }
      return classificationPastRow(position,clubName);
    }catch(e){
      return Container();
    }
  }
  Widget classificationPastRow(int position, String clubName){

   return Row(
     children: [
       position+1<10
           ? Text('  ${(position+1).toString()}- ',style: EstiloTextoBranco.text14)
           : Text('${(position+1).toString()}- ',style: EstiloTextoBranco.text14),
       Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName)}.png',height: 20,width: 20),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 4.0),
         child: Text(clubName,style: EstiloTextoBranco.text14),
       ),
     ],
   );
  }
  Widget leagueSelectionRow(int i){
    int leagueID = leaguesListRealIndex[i];

    return GestureDetector(
      onTap: (){
        choosenLeagueIndex = leagueID;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        color: choosenLeagueIndex == leagueID ? Colors.redAccent: Colors.white54,
        child: Image.asset(FIFAImages().campeonatoLogo(leagueID),height: 50,width: 50,),
      ),
    );
  }

}
