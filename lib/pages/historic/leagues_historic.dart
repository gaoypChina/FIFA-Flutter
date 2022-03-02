import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/historic.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/my_historic.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

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

              Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

              Column(
                children: [

                  const SizedBox(height: 40),
                  const Text('Histórico das ligas',style: EstiloTextoBranco.text22),
                  const SizedBox(height: 8),

                  //TABELA
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for(int year=anoInicial;year<ano;year++)
                            yearRow(year),
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
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HistoricMy()));
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
    return Column(
      children: [
        Text(year.toString(),style: EstiloTextoBranco.text16),

        for(int i=0;i<league.nClubs;i++)
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
        Text('${(position+1).toString()}- ',style: EstiloTextoBranco.text14),
        Image.asset('assets/clubs/${FIFAImages().imageLogo(club.name)}.png',height: 20,width: 20),
        Text(club.name,style: EstiloTextoBranco.text14),
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
        child: Image.asset('assets/icons/${FIFAImages().campeonatoLogo(leagueID)}.png',height: 50,width: 50,),
      ),
    );
  }

}
