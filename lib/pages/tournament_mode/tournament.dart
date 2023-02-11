import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/functions/change_club_control.dart';
import 'package:fifa/pages/simulacao/play.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

class Tournament extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Tournament({Key? key}) : super(key: key);
  @override
  _TournamentState createState() => _TournamentState();
}

class _TournamentState extends State<Tournament> {

  int posicao1=0;
  int posicaoPais1=0;
  late String leagueName1;
  late Club club1;

  int posicao2=0;
  int posicaoPais2=0;
  late String leagueName2;
  late Club club2;

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
  }
  Club getClub(int posicaoPais, int posicao){
    int indexLeague = leaguesListRealIndex[posicaoPais];
    League leagueClass = League(index: indexLeague);
    int clubID = leagueClass.getClubRealID(posicao);
    Club club = Club(index: clubID);
    return club;
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    club1 = getClub(posicaoPais1,posicao1);
    club2 = getClub(posicaoPais2,posicao2);

    return Scaffold(
        body:  Stack(
            children: [

            Image.asset('assets/icons/wallpaper blue.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

        SizedBox(
        height: Sized(context).height,
        width: Sized(context).width,
        child: Column(
        children: [
              const SizedBox(height: 260),

              const Text('Jogo Único',style:EstiloTextoBranco.negrito22),
              const SizedBox(height: 40),
              //LIGAS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  leagueLogoAndName(1,posicaoPais1),
                  leagueLogoAndName(2,posicaoPais2),
                ],
              ),

          //ESCUDO E UNIFORME
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              clubLogoAndKitStack(1,club1, posicaoPais1),
              clubLogoAndKitStack(2,club2, posicaoPais2),
            ],
          ),

          menuButton('Play Match',(){
            funcChangeClub(club1.name,leaguesListRealIndex[posicaoPais1]);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Play(adversarioClubID: club2.index, visitante: false)));
          }),


        ]),

        )
    ])
    );
  }
  

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget menuButton(String text, Function() function){
  return  Container(
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: AppColors().greyTransparent,
      border: Border.all(
        width: 2.0,
        color: Colors.green,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: function,
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text22))),
    ),
  );
}

Widget leagueLogoAndName(int selection, int posicaoPais){
  String leagueName = League(index: leaguesListRealIndex[posicaoPais]).getName();
  double imageSize = 100;

  return Stack(
    children: [
      Column(
        children: [
          //LOGO CAMPEONATO
          Image.asset(FIFAImages().campeonatoLogo(leagueName),height: imageSize,width: imageSize),
          const SizedBox(height: 8),
          Text(leagueName,style:EstiloTextoBranco.text16),
        ],
      ),
      Row(
        children: [
          //ESQUERDA
          SizedBox(height: imageSize,width: imageSize*0.6,
            child: InkWell(onTap: (){

              if(selection==1){
                if(posicaoPais1>0) {
                  posicaoPais1 --;
                  posicao1 = 0;
                }else {
                  posicaoPais1 = leaguesListRealIndex.length - 1;
                  posicao1 = 0;
                }
              }

              else{
                if(posicaoPais2>0) {
                  posicaoPais2 --;
                  posicao2 = 0;
                }else{
                  posicaoPais2 = leaguesListRealIndex.length-1;
                  posicao2 = 0;
                }
              }

              setState(() {});
            }),
          ),
          //DIREITA
          SizedBox(height: imageSize,width: imageSize*0.6,
            child: InkWell(onTap: (){

              if(selection==1){
                if(posicaoPais1< leaguesListRealIndex.length-1) {
                  posicaoPais1 ++;
                  posicao1 = 0;
                }else{
                  posicaoPais1 = 0;
                  posicao1 = 0;
                }
              }

              else{
                if(posicaoPais2< leaguesListRealIndex.length-1) {
                  posicaoPais2 ++;
                  posicao2 = 0;
                }else{
                  posicaoPais2 = 0;
                  posicao2 = 0;
                }
              }

              setState(() {});
            }),
            ),
        ],
      ),
    ],
  );
}
Widget clubLogoAndKitStack(int selection, Club club, int posicaoPais){
  int indexLeague = leaguesListRealIndex[posicaoPais];
  double imageSize = 120;
  return  Column(
    children: [
      SizedBox(
        height: imageSize,
        width: imageSize,
        child: Stack(
          children: [
            //Image.asset(Images().getStadium(club.name),height: 200,width: 200,fit: BoxFit.fill,),
            //Escudo
            Images().getEscudoWidget(club.name,imageSize,imageSize),
            //Uniforme
            Container(
                alignment: Alignment.bottomRight,
                child: Images().getUniformWidget(club.name,imageSize/2,imageSize/2)
            ),

            Row(
              children: [
                SizedBox(height: imageSize,width: imageSize*0.5,
                  child: InkWell(onTap: (){
                    if(selection == 1){
                      if(posicao1>0) {
                        posicao1 --;
                      }else{
                        posicao1 = League(index: indexLeague).nClubs-1;
                      }
                    }

                    else{
                      if(posicao2>0) {
                        posicao2 --;
                      }else{
                        posicao2 = League(index: indexLeague).nClubs-1;
                      }
                    }

                    setState(() {});
                  }),
                ),
                SizedBox(height: imageSize,width: imageSize*0.5,
                  child: InkWell(onTap: (){

                    if(selection == 1){
                      if(posicao1 < League(index: indexLeague).nClubs-1) {
                        posicao1 ++;
                      }else{
                        posicao1 = 0;
                      }
                    }

                    else{
                      if(posicao2 < League(index: indexLeague).nClubs-1) {
                        posicao2 ++;
                      }else{
                        posicao2 = 0;
                      }
                    }

                    setState(() {});
                  }),
                ),
              ],
            ),
          ],
        ),
      ),


      SizedBox(width:imageSize,
          child: Text(club.name,overflow: TextOverflow.clip,textAlign:TextAlign.center,style:EstiloTextoBranco.text20)
        ),

    ],
  );
}


}