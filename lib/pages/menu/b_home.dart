import 'package:fifa/database/shared_preferences.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/functions/update_data_year.dart';
import 'package:fifa/pages/customize_players.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button_continue.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'c_menu.dart';
import '../../classes/geral/dificuldade.dart';
import '../../classes/league.dart';
import '../../values/club_names.dart';
import 'package:csv/csv.dart';

import '../../functions/func_change_club.dart';

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

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }
  doThisOnLaunch() async {
    //RESETA LISTA A MOSTRAR CLUBES

    clubNameMap = Map.from(clubNameMapPermanent);

    ano = anoInicial;
    await openCSV();
    try {
      await SharedPreferenceHelper().getDatabase();
    }catch(e){
      print('ERROR ON GET DATABASE MAIN MENU'+e.toString());
    }
    globalSaveNumber = (await SharedPreferenceHelper().getsharedSaveNumber())!;
    getCustomizedData();
    setState(() {});
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    indexLeague = leaguesListRealIndex[posicaoPais];
    leagueName = League(index: indexLeague).getName();
    teamName = League(index: indexLeague).getClubName(posicao);
    nLeagueTeams = League(index: indexLeague).getNTeams();

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

                      InkWell(
                        onTap: (){
                          if(posicaoPais>0) {
                            posicaoPais --;
                            posicao = 0;
                          }else{
                            posicaoPais = leaguesListRealIndex.length-1;
                          }
                          setState(() {});
                        },
                        child: Image.asset('assets/icons/button_left.png',height: buttonSize,width: buttonSize),
                      ),

                      Column(
                        children: [
                          //Escudo
                          Image.asset('assets/icons/${FIFAImages().campeonatoLogo(indexLeague)}.png',height: 200,width: 200),
                          Text(leagueName,style:EstiloTextoBranco.text16),
                        ],
                      ),

                      InkWell(
                        onTap: (){
                          if(posicaoPais< leaguesListRealIndex.length-1) {
                            posicaoPais ++;
                            posicao = 0;
                          }else{
                            posicaoPais = 0;
                          }
                          setState(() {});
                        },
                        child: Image.asset('assets/icons/button_right.png',height: buttonSize,width: buttonSize),
                      ),

                    ],
                  ),



                  const SizedBox(height: 10),
                  ///////////
                  //TIME
                  //////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      InkWell(
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

                      Column(
                        children: [

                          //ESCUDO E UNIFORME
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: Stack(
                              children: [
                                //Escudo
                                Image.asset('assets/clubs/${FIFAImages().imageLogo(teamName)}.png',height: 200,width: 200),
                                //Uniforme
                                Container(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset('assets/clubs/${FIFAImages().imageLogo(teamName)}1.png',height: 100,width: 100)
                                ),
                              ],
                            ),
                          ),

                          Text(teamName,style:EstiloTextoBranco.text25),
                        ],
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

                  const SizedBox(height: 12),


                  const SizedBox(height: 16),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[

                      //DATABASE
                      GestureDetector(
                        onTap:() async{
                          globalSaveNumber++;
                          if(globalSaveNumber==4){globalSaveNumber=0;}
                          await getCustomizedData();
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
                          int clubID = League(index: indexLeague).getClubRealIndex(posicao);
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

  getCustomizedData() async {

    if(globalSaveNumber>0) {

      try{
        globalJogadoresIndex =[];
        //TIRA OS ESPAÇOS DAS STRINGS
        for (int i = 0; i < globalSaveData[globalSaveNumber][1].length; i++) {
          globalSaveData[globalSaveNumber][0][i] = globalSaveData[globalSaveNumber][0][i].toString().trim();
          globalSaveData[globalSaveNumber][1][i] = globalSaveData[globalSaveNumber][1][i].toString().trim();
          globalSaveData[globalSaveNumber][2][i] = globalSaveData[globalSaveNumber][2][i].toString().trim();
          globalSaveData[globalSaveNumber][3][i] = globalSaveData[globalSaveNumber][3][i].toString().trim();
          globalSaveData[globalSaveNumber][4][i] = globalSaveData[globalSaveNumber][4][i].toString().trim();

          globalJogadoresIndex.add(i);
        }

      globalJogadoresName = globalSaveData[globalSaveNumber][0];
      globalJogadoresClubIndex = globalSaveData[globalSaveNumber][1].map(int.parse).toList(); //convert list<string> to list<int>
      globalJogadoresAge = globalSaveData[globalSaveNumber][2].map(int.parse).toList();//convert list<string> to list<int>
      globalJogadoresOverall = globalSaveData[globalSaveNumber][3].map(int.parse).toList();//convert list<string> to list<int>
      globalJogadoresPosition = globalSaveData[globalSaveNumber][4];

      }catch(e){
        //SE der erro vai pro database padrão
        print('ERRO');
        globalSaveNumber = 0;
        await openCSV();
      }
    }else{
      await openCSV();
    }

    await SharedPreferenceHelper().savesharedSaveNumber(globalSaveNumber);
    setState(() {});

  }

  openCSV() async{

    resetPlayersData();
    resetData();

    //READ CSV
    await readCSVfunc("brasil");
    await readCSVfunc("brasil2");
    await readCSVfunc("inglaterra");
    await readCSVfunc("italia");
    await readCSVfunc("espanha");
    await readCSVfunc("alemanha");
    await readCSVfunc("franca");
    await readCSVfunc("outros");
    await readCSVfunc("oriental");
    await readCSVfunc("championship");
    await readCSVfunc("argentina");
    await readCSVfunc("america");
    await readCSVfunc("colombia");
    await readCSVfunc("adicionados");
    await readCSVfunc("eua");

  }
  readCSVfunc(String filename) async {
    List<List<dynamic>> _data = [];
    try{
      final _rawData   = await rootBundle.loadString("assets/csv/$filename.csv");
      List<List<dynamic>> _listData = const CsvToListConverter().convert(_rawData);
      _data = _listData;
    }catch(e){
      customToast('Arquivo Inexistente: '+ filename);
    }

    if(_data.length==1){
      customToast('Erro no arquivo '+ filename);
    }

    int indexJog = 0;
    for(int line=1;line<29;line++){//*Linha 0 é o nome dos times
      for(int team=0;team<16;team++) {
        //Se tiver nome salva o jogador
        try {
          String club = _data[0][team * 5 + 1];
          String name = _data[line][team * 5 + 1].toString();
          String position = _data[line][team * 5 + 2].toString();//VOLMCZAG =>VOL
          int age = int.parse(_data[line][team * 5 + 3].toString());
          int overall = int.parse(_data[line][team * 5 + 4].toString().substring(0,2));
          if (name.isNotEmpty && position.isNotEmpty && age > 10) {

            //REMOVE L form last character
            if(name[name.length-1]=='L'){name = name.substring(0, name.length - 1);}
            name = name.replaceFirst('Mintikkis', 'De Jong');
            if(position.length>3){position = position.substring(0,3);}
            if(position.contains('LD')){position='LD';}
            if(position.contains('ADD')){position='LD';}
            if(position.contains('ADE')){position='LE';}
            if(position.contains('LE')){position='LE';}
            if(position.contains('ZAG')){position='ZAG';}
            if(position.contains('VOL')){position='VOL';}
            if(position.contains('MEI')){position='MEI';}
            if(position.contains('MC')){position='MC';}
            if(position.contains('ATA')){position='ATA';}
            if(position.contains('SA')){position='ATA';}
            if(position.contains('PD')){position='PD';}
            if(position.contains('PE')){position='PE';}
            if(position.contains('MD')){position='MD';}
            if(position.contains('ME')){position='ME';}


            //RB Leipzig problema na importação
            //Se tiver uma posição que não existe da pau na hora de organizar a escalação ideal dos times
            if(position.contains('CAM')){position='MEI';}
            if(position.contains('CDM')){position='VOL';}
            if(position.contains('RBC')){position='ZAG';}
            if(position.contains('CBR')){position='LD';}
            if(position.contains('CBL')){position='LE';}
            if(position.contains('LWB')){position='LE';}
            if(position.contains('RBL')){position='LE';}
            if(position.contains('CB')){position='ZAG';}
            if(position.contains('ST')){position='ATA';}
            if(position.contains('GK')){position='GOL';}
            if(position.contains('CM')){position='MC';}

            //VARIAVEIS GLOBAIS
            int clubIndex = clubsAllNameList.indexOf(club);
            globalJogadoresClubIndex.add(clubIndex);

            globalJogadoresIndex.add(indexJog);
            globalJogadoresName.add(name);
            globalJogadoresPosition.add(position);
            globalJogadoresAge.add(age);
            globalJogadoresOverall.add(overall);
            indexJog++;

          }
        }catch(e){
          //print('ERROR LOADING DATA: ' +e.toString());
        }

      }
    }

  }

}