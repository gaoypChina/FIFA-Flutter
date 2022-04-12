
import 'package:fifa/classes/historic.dart';
import 'package:fifa/classes/historic/top_players_ovr.dart';
import 'package:fifa/classes/historic/top_scorers.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_trophy_image.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'leagues_historic.dart';

class Historic extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Historic({Key? key}) : super(key: key);
  @override
  _HistoricState createState() => _HistoricState();
}

class _HistoricState extends State<Historic> {

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

              Column(
                children: [

                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      trophyWidget(0),
                      trophyWidget(1),
                      trophyWidget(2),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Text('Meu Histórico',style: EstiloTextoBranco.text22),
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

                  SizedBox(
                    height: 140,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for(int year=anoInicial;year<ano;year++)
                            yearRowTopScorers(year),
                        ],
                      ),
                    ),
                  ),

                  //VOLTAR
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child:  customButtonContinue(
                        title: 'PRÓXIMO',
                        function: (){
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HistoricLeague()));
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
Widget myHistoricRow(int index){
    int ano = index + anoInicial;
    int position = 5;
    String teamName = 'Guarani';
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(ano.toString()+': '+position.toString()+'º c/'+teamName,style: EstiloTextoBranco.text14),
      Image.asset('assets/clubs/${FIFAImages().imageLogo(teamName)}.png',height: 15,width: 15),
    ],
  );
}

///////////////////////////
Widget trophyWidget(int i){
    late String name;
    late String image;
    late int qntd;

    if(i==0){
      name = 'Campeonatos Nacionais';
      image = getTrophyImage(My().campeonatoName);
      qntd = HistoricFunctions().myLeagueTitles();
    }
    if(i==1){
      name = 'Campeonatos Internacionais';
      image = getTrophyImage(My().getMyInternationalLeague());
      qntd = 0;
    }
    if(i==2){
      name = 'Campeonatos 2ªDivisão';
      image = 'trophy2division';
      qntd = 0;
    }
    return Column(
      children: [
        SizedBox(
          width: 100,
            child: Text(name,textAlign:TextAlign.center,style: EstiloTextoBranco.text14)
        ),
        Image.asset('assets/trophy/$image.png',height: 100,width: 100),
        Text(qntd.toString(),style: EstiloTextoBranco.text20),
      ],
    );
}



  Widget yearRow(int year){

    HistoricClubYear myClubData = HistoricClubYear(year);

    return Row(
      children: [
        Text(year.toString(),style: EstiloTextoBranco.text16),
        Image.asset('assets/clubs/${FIFAImages().imageLogo(myClubData.clubName)}.png',height: 20,width: 20,),
        SizedBox(
            width: 150,
            child: Text(myClubData.clubName,style: EstiloTextoBranco.text14)
        ),
        Text('${myClubData.leagueName}: \n${myClubData.internationalLeagueName}: ',style: EstiloTextoBranco.text12),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text('${myClubData.position}º\nVazio',style: EstiloTextoBranco.text14),
        ),
      ],
    );
  }

  Widget yearRowTopScorers(int year){
    Map topScorersMap = TopScorers().getDataYear(year);
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Column(
        children: [
          Text('Artilheiros $year e Melhores Jogadores',style: EstiloTextoBranco.text14),
          for(int position=0;position<25 && position< topScorersMap.values.length;position++)
            yearRowTopScorersRow(year,position)

        ],
      ),
    );
  }
  Widget yearRowTopScorersRow(int year, int position){
    TopScorers topScorers = TopScorers();
    topScorers.getInPosition(year, position);
    TopPlayersOVR topPlayersOVR = TopPlayersOVR();
    topPlayersOVR.getInPosition(year, position);
    return             Row(
      children: [
        Text('${(position+1).toString()}-',style: EstiloTextoBranco.text14),
        Image.asset('assets/clubs/${FIFAImages().imageLogo(topScorers.clubName)}.png',height: 20,width: 20),
        SizedBox(width:130,
          child: Text(topScorers.playerName,style: EstiloTextoBranco.text14),
        ),
        Text(topScorers.playerGoals.toString(),style: EstiloTextoBranco.text14),
        const SizedBox(width: 15),

        Text('${(position+1).toString()}-',style: EstiloTextoBranco.text14),
        Image.asset('assets/clubs/${FIFAImages().imageLogo(topPlayersOVR.clubName)}.png',height: 20,width: 20),
        SizedBox(width:130,
          child: Text(topPlayersOVR.playerName,style: EstiloTextoBranco.text14),
        ),
        Text(topPlayersOVR.playerOVR.toString(),style: EstiloTextoBranco.text14),
      ],
    );
  }
}