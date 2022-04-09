import 'package:fifa/classes/club.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/historic.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

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

        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

              Column(
                children: [

                  const SizedBox(height: 40),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        internationalLogoSelection(),
                        const SizedBox(width: 6),
                        dropDownButton(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                                internationalInternationalHistoricColumn(int.parse(selectedYear),leagueInternational),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //PRÓXIMO
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child:  customButtonContinue(
                        title: 'PRÓXIMO',
                        function: (){
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Historic()));
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
  Widget internationalLogoSelection(){
    return Container(
      decoration: BoxDecoration(
        color:Colors.white, //background color of dropdown button
        border: Border.all(color: Colors.black38, width:2), //border of dropdown button
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
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
      ),
    );
  }
  Widget internationalInternationalHistoricColumn(int ano,String internationalLeagueName){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        const Text('FINAL',style: EstiloTextoBranco.text14),
        for(int idaVolta=0;idaVolta<1;idaVolta++)
          for(int i=0;i<2;i+=2)
            internationalInternationalHistoricRow(internationalLeagueName,'Final', i, idaVolta, ano),

        const Text('',style: EstiloTextoBranco.text16),
        const Text('SEMIFINAL',style: EstiloTextoBranco.text14),
        for(int idaVolta=0;idaVolta<2;idaVolta++)
          for(int i=0;i<4;i+=2)
            internationalInternationalHistoricRow(internationalLeagueName,'Semi', i, idaVolta, ano),

        const Text('',style: EstiloTextoBranco.text16),
        const Text('QUARTAS',style: EstiloTextoBranco.text14),
        for(int idaVolta=0;idaVolta<2;idaVolta++)
          for(int i=0;i<8;i+=2)
            internationalInternationalHistoricRow(internationalLeagueName,'Quartas', i, idaVolta, ano),

        const Text('',style: EstiloTextoBranco.text16),
        const Text('OITAVAS',style: EstiloTextoBranco.text14),
        for(int idaVolta=0;idaVolta<2;idaVolta++)
          for(int i=0;i<16;i+=2)
            internationalInternationalHistoricRow(internationalLeagueName,'Oitavas', i, idaVolta, ano),

        const Text('',style: EstiloTextoBranco.text16),
        const Text('',style: EstiloTextoBranco.text16),
      ],
    );
  }
  Widget internationalInternationalHistoricRow(String internationalLeague, String phase, int position, int idaVolta, int ano){
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
          Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName1)}.png',height: 25,width: 25),
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
          Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName2)}.png',height: 25,width: 25),
        ],
      ),
    );
  }

}