import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/database/local_database/shared_preferences.dart';
import 'package:fifa/database/select_database.dart';
import 'package:fifa/classes/functions/change_club_control.dart';
import 'package:fifa/classes/functions/func_number_clubs_total.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/configuration/configuration.dart';
import 'package:fifa/pages/configuration/customize_players.dart';
import 'package:fifa/pages/tournament_mode/tournament.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/stars.dart';
import 'package:flutter/material.dart';
import 'c_menu.dart';
import '../../classes/league.dart';

class HomePage extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double buttonSize = 60;

  int posicao=0;
  int posicaoPais=0;

  late String leagueName;
  late int nLeagueTeams;
  late int clubID;
  late Club club;
  late int indexLeague;
  int indexJog = 0;


////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }
  Map getCloneMap(Map data) {
    return data.map((k, v) => MapEntry(k, v is Map ? getCloneMap(v) : v));
  }
  doThisOnLaunch() async {
    //RESETA LISTA ORIGINAL A MOSTRAR CLUBES
    clubNameMap = getCloneMap(clubNameMapImmutable); //Mapa sem mudar mapa original
    //Pontos do treinador zera
    globalCoachPoints = 0;

    globalHistoricCoachResults = {};

    globalJogadoresCarrerMatchs = List.filled(globalMaxPlayersPermitted, 0);
    globalJogadoresCarrerGoals = List.filled(globalMaxPlayersPermitted, 0);
    globalJogadoresCarrerAssists = List.filled(globalMaxPlayersPermitted, 0);

    ano = anoInicial;
    setState(() {});
    await SelectDatabase().load();

    globalNumberClubsTotal = funcNumberClubsTotal(); //get number of total clubs

    setState(() {});
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    indexLeague = leaguesListRealIndex[posicaoPais];
    League leagueClass = League(index: indexLeague);
    leagueName = leagueClass.name;
    clubID = leagueClass.getClubRealID(posicao);
    nLeagueTeams = leagueClass.nClubs;
    club = Club(index: clubID);

    return Scaffold(
        body:  Container(
          height: Sized(context).height,
          decoration: Images().getWallpaperContainerDecoration(),
          child: SingleChildScrollView(
            child: Column(
              children: [

                const SizedBox(height: 70),
                //TITLE
                Stack(
                  children: const [
                    Text('FIFA 23',style: EstiloRowdies.textWhite50),
                    Padding(
                      padding: EdgeInsets.only(left:2.0,top: 1),
                      child: Text('FIFA 23',style: EstiloRowdies.textGreen50),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                ////////////
                //PAIS
                ////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: leftButton(onTap: (){
                            if(posicaoPais>0) {
                              posicaoPais --;
                              posicao = 0;
                            }else{
                              posicaoPais = leaguesListRealIndex.length-1;
                              posicao = 0;
                            }
                          }),
                        ),

                        rightButton(
                            onTap: (){
                          if(posicaoPais< leaguesListRealIndex.length-1) {
                            posicaoPais ++;
                            posicao = 0;
                          }else{
                            posicaoPais = 0;
                            posicao = 0;
                          }
                        }),
                      ],
                    ),


                    leagueLogoAndName(),
                  ],
                ),

                const SizedBox(height: 40),
                /////////////////////////////////////////
                //TIME
                /////////////////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: leftButton(onTap: (){
                            if(posicao>0) {
                              posicao --;
                            }else{
                              posicao = nLeagueTeams-1;
                            }
                          }),
                        ),

                        rightButton(onTap: (){
                          if(posicao<nLeagueTeams-1) {
                            posicao ++;
                          }else{
                            posicao = 0;
                          }
                        }),

                      ],
                    ),

                        //ESCUDO E UNIFORME
                        clubLogoAndKitStack(club),

                  ],
                ),


                const SizedBox(height: 30),
                continueButton(),
                const SizedBox(height: 28),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    database(),
                    editClub(),
                    configurations(),
                    openTournament(),
                  ],
                ),


              ],
            ),
          ),
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget rightButton({required Function onTap}){
    return Stack(
      children: [
        Image.asset('assets/icons/button_right.png',height: buttonSize,width: buttonSize),
        SizedBox(
          height: buttonSize,width: buttonSize,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonSize)),
              onTap: (){
                onTap();
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }
  Widget leftButton({required Function onTap}){
    return Stack(
      children: [
        Image.asset('assets/icons/button_left.png',height: buttonSize,width: buttonSize),
        SizedBox(
        height: buttonSize,width: buttonSize,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonSize)),
              onTap: (){
                onTap();
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }
  Widget leagueLogoAndName(){
    String leagueName = League(index: indexLeague).getName();
    return Column(
      children: [
        //LOGO CAMPEONATO
        Image.asset(FIFAImages().campeonatoLogo(leagueName),height: 160,width: 160),
        const SizedBox(height: 8),
        Text(leagueName,style:EstiloTextoBranco.text16),
      ],
    );
  }


Widget clubLogoAndKitStack(Club club){
  double imageSize = 200;
    return  Column(
      children: [
        SizedBox(
          height: imageSize,
          width: imageSize,
          child: Stack(
            children: [
              //Image.asset(Images().getStadium(club.name),height: imageSize,width: imageSize,fit: BoxFit.fill,),
              //Escudo
              Images().getEscudoWidget(club.name,imageSize,imageSize),
              //Uniforme
              Container(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                      height: imageSize/2,
                      width: imageSize/2,
                      child: Images().getUniformWidget(club.name,imageSize/2,imageSize/2)),
              ),
            ],
          ),
        ),
        Text(club.name,style:EstiloTextoBranco.text25),
        starsWidgetFromOverall(club.getOverall()),
      ],
    );
}


Widget continueButton(){
    return
      customButtonContinue(
          title: Translation(context).text.continueButton,
          function: () {
            funcChangeClub(club.name,indexLeague);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Menu()));
          }
      );
}

Widget database(){
    return
      GestureDetector(
        onTap:() async{
          bool sucessLoadingDatabase = false;
          while(!sucessLoadingDatabase){
            globalSaveNumber++;
            if(globalSaveNumber == globalMaxSavesPermitted+1){
              globalSaveNumber=0;
            }
            await SharedPreferenceHelper().savesharedSaveNumber(globalSaveNumber);

            customToast('${Translation(context).text.loading} Database $globalSaveNumber...');
            try {
              await SelectDatabase().load();
              sucessLoadingDatabase = true;
            }catch(e){
              customToast('Erro no carregamento do Database $globalSaveNumber');
            }

          }

          setState(() {});
        },
        child: Column(
          children: [
            const Icon(Icons.save,color:Colors.white,size:40),
            globalSaveNumber==0
                ? const Text('Database padrão',style: EstiloTextoBranco.underline14)
                : Text('Database: '+globalSaveNumber.toString(),style: EstiloTextoBranco.underline14),
          ],
        ),
      );
}


Widget editClub(){
  return
    GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomizePlayers(clubID: clubID)));
      },
      child: Column(
        children: [
          const Icon(Icons.edit,color:Colors.white,size:40),
          Text(Translation(context).text.editTeam,style: EstiloTextoBranco.underline14)
        ],
      ),
    );
}

Widget configurations(){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Configuration()));
      },
      child: Column(
        children: [
          const Icon(Icons.miscellaneous_services,color:Colors.white,size:40),
          Text(Translation(context).text.configuration,style: EstiloTextoBranco.underline14),
        ],
      ),
    );
}

  Widget openTournament(){
    return
      GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Tournament()));
        },
        child: Column(
          children: const [
            Icon(Icons.gamepad,color:Colors.white,size:40),
            Text('Single Match',style: EstiloTextoBranco.underline14)
          ],
        ),
      );
  }

////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////


}