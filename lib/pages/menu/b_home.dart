import 'package:fifa/classes/get_database/local_database.dart';
import 'package:fifa/classes/get_database/read_csv.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/database/shared_preferences.dart';
import 'package:fifa/functions/change_club_control.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/customize_players.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'c_menu.dart';
import '../../classes/geral/dificuldade.dart';
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
  late String teamName;
  late int nLeagueTeams;

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

    globalJogadoresCarrerMatchs = List.filled(globalMaxPlayersPermitted, 0);
    globalJogadoresCarrerGoals = List.filled(globalMaxPlayersPermitted, 0);
    globalJogadoresCarrerAssists = List.filled(globalMaxPlayersPermitted, 0);

    ano = anoInicial;
    await ReadCSV().openCSV();
    try {
      await SharedPreferenceHelper().getPlayersDatabase();
    }catch(e){
      print('ERROR ON GET DATABASE MAIN MENU'+e.toString());
    }
    globalSaveNumber = (await SharedPreferenceHelper().getsharedSaveNumber())!;
    GetLocalDatabase().getCustomizedData();
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
    teamName = leagueClass.getClubName(posicao);
    nLeagueTeams = leagueClass.nClubs;

    return Scaffold(

        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill,),

              Column(
                children: [

                  const SizedBox(height: 80),
                  const Text('FIFA 22',style: EstiloTextoBranco.text40),
                  const SizedBox(height: 20),

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
                            child: InkWell(
                              onTap: (){
                                if(posicaoPais>0) {
                                  posicaoPais --;
                                  posicao = 0;
                                }else{
                                  posicaoPais = leaguesListRealIndex.length-1;
                                  posicao = 0;
                                }
                                setState(() {});
                              },
                              child: Image.asset('assets/icons/button_left.png',height: buttonSize,width: buttonSize),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              if(posicaoPais< leaguesListRealIndex.length-1) {
                                posicaoPais ++;
                                posicao = 0;
                              }else{
                                posicaoPais = 0;
                                posicao = 0;
                              }
                              setState(() {});
                            },
                            child: Image.asset('assets/icons/button_right.png',height: buttonSize,width: buttonSize),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          //LOGO CAMPEONATO
                          Image.asset(FIFAImages().campeonatoLogo(indexLeague),height: 170,width: 170),
                          Text(leagueName,style:EstiloTextoBranco.text16),
                        ],
                      ),



                    ],
                  ),



                  const SizedBox(height: 40),
                  ///////////
                  //TIME
                  //////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: (){
                                if(posicao>0) {
                                  posicao --;
                                }else{
                                  posicao = nLeagueTeams-1;
                                }
                                setState(() {});
                              },
                              child: Image.asset('assets/icons/button_left.png',height: buttonSize,width: buttonSize),
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              if(posicao<nLeagueTeams-1) {
                                posicao ++;
                              }else{
                                posicao = 0;
                              }
                              setState(() {});
                            },
                            child: Image.asset('assets/icons/button_right.png',height: buttonSize,width: buttonSize),
                          ),

                        ],
                      ),

                      Column(
                        children: [

                          //ESCUDO E UNIFORME
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: Stack(
                              children: [
                                //Escudo
                                Image.asset(Images().getEscudo(teamName),height: 200,width: 200),
                                //Uniforme
                                Container(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(Images().getUniform(teamName),height: 100,width: 100)
                                ),
                              ],
                            ),
                          ),

                          Text(teamName,style:EstiloTextoBranco.text25),
                        ],
                      ),

                    ],
                  ),


                  const SizedBox(height: 30),

                  ////////////////
                  //BOTAO PRA CONTINUAR
                  customButtonContinue(
                      title: 'Continuar',
                      function: () async{
                        saveMyData();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Menu()));
                      }
                  ),

                  const SizedBox(height: 28),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[

                      //DATABASE
                      GestureDetector(
                        onTap:() async{
                          customToast('Carregando Database...');
                          globalSaveNumber++;
                          if(globalSaveNumber == globalMaxSavesPermitted+1){
                            globalSaveNumber=0;
                          }
                          await SharedPreferenceHelper().getPlayersDatabase();
                          await GetLocalDatabase().getCustomizedData();
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
                      ),

                      //////////////
                      // CUSTOMIZAR
                      GestureDetector(
                        onTap: (){
                          int clubID = League(index: indexLeague).getClubRealID(posicao);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomizePlayers(clubID: clubID)));
                        },
                        child: Column(
                          children: const [
                            Icon(Icons.miscellaneous_services,color:Colors.white,size:40),
                            Text('Customizar',style: EstiloTextoBranco.underline14)
                          ],
                        ),
                      ),

                      //DIFICULDADE
                      GestureDetector(
                        onTap:(){
                          globalDificuldade++;
                          if(globalDificuldade==5){
                            globalDificuldade=0;
                          }
                          setState(() {});
                        },
                        child: SizedBox(
                          width:70,
                          child: Column(
                            children: [
                              const Icon(Icons.star,color:Colors.white,size:40),
                              const Text('Dificuldade',style: EstiloTextoBranco.underline14),
                              Text(DificuldadeClass().getName(),style: EstiloTextoBranco.underline14),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              )

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
  saveMyData(){
    funcChangeClub(teamName,indexLeague);
  }



}