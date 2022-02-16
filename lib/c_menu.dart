import 'package:fifa/b_home.dart';
import 'package:fifa/global/global_variables.dart';
import 'package:fifa/pages/calendar.dart';
import 'package:fifa/pages/ranking_clubs.dart';
import 'package:fifa/pages/save/choose_save.dart';
import 'package:fifa/global/fim_campeonato_functions.dart';
import 'package:fifa/pages/simulacao/not_play.dart';
import 'package:fifa/pages/table/table_international.dart';
import 'package:fifa/pages/table/table_nacional.dart';
import 'package:fifa/pages/transfers.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:flutter/scheduler.dart';
import 'classes/classification.dart';
import 'classes/club.dart';
import 'classes/league.dart';
import 'classes/my.dart';
import 'global/globalfunctions.dart';
import 'pages/my_team.dart';
import 'popup/popup_expectativa.dart';
import 'global/update_data_year.dart';
import 'pages/change_club.dart';
import 'pages/historic/historic.dart';
import 'global/images.dart';
import 'pages/simulacao/play.dart';
import 'theme/textstyle.dart';

import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Menu({Key? key}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  My myClass = My();
  String adversarioClubName = '';
  int adversarioClubID = 1;
  int adversarioPosicao = 1;
  bool visitante = false;
  late int indexAdv; //de 0-16
////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }
  doThisOnLaunch() {
    //POPUP DE EXPECTATIVA QUANDO COMEÇA NOVA TEMPORADA
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      popupexpectativaCall();
    });

    if(semana == semanasJogosInternacionais[0]){
      FimDoCampeonato().redistribuirTimes();
    }

    adversarios();
    if(semana == ultimasemana){
      funcUpdateDataAfterSeason();
    }
    setState(() {});
  }


  adversarios(){
    //ADVERSARIO CAMPEONATO
    if(semanasJogosNacionais.contains(semana) && semana < League(index: My().campeonatoID).nClubs){
    List chaves = GlobalFunctions().obterChave(semana,myClass.campeonatoID);
    if(chaves.isNotEmpty) {

      if (chaves.indexOf(myClass.posicaoChave) % 2 == 0) {
        indexAdv = chaves[chaves.indexOf(myClass.posicaoChave) + 1];
      } else {
        indexAdv = chaves[chaves.indexOf(myClass.posicaoChave) - 1];
        visitante = true;
      }
      adversarioClubID = League(index: myClass.campeonatoID).getClubIndex(indexAdv);//indice entre todos os clube
      adversarioClubName = Club(index: adversarioClubID).name;
      adversarioPosicao = Classification(leagueIndex: myClass.campeonatoID).getClubPosition(adversarioClubID);
    }
    }
    //ADVERSARIO CHAMPIONS OU LIBERTADORES
    if(My().playingInternational.isNotEmpty  && semanasJogosInternacionais.contains(semana)){
      List chaves = GlobalFunctions().obterChave(semana,0);
      late int indexAdv; //0-4
      int minhaPosicaoChave = My().getMyClubInternationalGroupPosition();
      if (chaves.indexOf(minhaPosicaoChave) % 2 == 0) {
        indexAdv = chaves[chaves.indexOf(minhaPosicaoChave) + 1];
      } else {
        indexAdv = chaves[chaves.indexOf(minhaPosicaoChave) - 1];
        visitante = true;
      }
      int indexAdv032 = 4*My().getMyClubInternationalGroup()+indexAdv;
      if(My().playingInternational == 'Champions'){
        adversarioClubID = globalInternational32ClubsID[0][indexAdv032];
      }
      if(My().playingInternational == 'Libertadores'){
        adversarioClubID = globalInternational32ClubsID[1][indexAdv032];
      }
      adversarioClubName = Club(index: adversarioClubID).name;
      adversarioPosicao = Classification(leagueIndex: myClass.campeonatoID).getClubPosition(adversarioClubID);
    }

  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    //_height = MediaQuery.of(context).size.height;
    myClass = My();

    return WillPopScope(//IF GO BACK TO PREVIOUS PAGE
      onWillPop: () async{
        return false;
      },
      child: Scaffold(

          resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
          body:  Stack(
              children: [

                Image.asset('assets/icons/wallpaper blue.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

                Column(

                  children: [

                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        //Escudo
                        Image.asset('assets/clubs/${FIFAImages().imageLogo(myClass.clubName)}.png',height: 90,width: 90),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(myClass.clubName,style: EstiloTextoBranco.text20),
                            Text('\nAno: '+ ano.toString(),style: EstiloTextoBranco.text14),
                            Text('Semana: '+ semana.toString(),style: EstiloTextoBranco.text14),
                            Text('Overall da Equipe: ' + Club(index: myClass.clubID).getOverall().toStringAsFixed(2),style: EstiloTextoBranco.text14),
                            Text('Dinheiro: \$'+ myClass.money.toStringAsFixed(2)+'mi',style: EstiloTextoBranco.text14),
                            Text('Valor da Equipe: \$' + myClass.getClubValue().toStringAsFixed(2)+'mi',style: EstiloTextoBranco.text14),
                          ],
                        ),

                        //UNIFORME
                        Image.asset('assets/clubs/${FIFAImages().imageLogo(myClass.clubName)}1.png',height: 100,width: 100),

                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          menuButton('Jogar',(){
                            if(adversarioClubName.isNotEmpty){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Play(adversarioClubID: adversarioClubID, visitante: visitante, chavePosAdv: indexAdv)));
                            }else{
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const NotPlay()));
                            }
                          }),
                          menuButton('Tabela',(){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TableNacional()));
                          }),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: menuButton('Mudar de clube',(){
                                    if(!alreadyChangedClubThisSeason){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChangeClub()));
                                    }else{
                                      customToast('Você já mudou de clube essa temporada');
                                    }
                                  }
                                  ),
                                ),
                                Expanded(
                                  child: menuButton('Meu Time',(){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyTeam()))
                                        .then((value) {setState(() {});});
                                  }),
                                ),

                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: menuButton('Histórico',(){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Historic()));
                                  }),
                                ),
                                Expanded(
                                  child: menuButton('Ranking',(){
                                    customToast('Carregando...');
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RankingClubs()))
                                        .then((value) {setState(() {});});
                                  }),
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: menuButton('Internacional',(){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TableInternational(leagueInternational: 'Champions')));
                                  }),
                                ),
                                Expanded(
                                  child: menuButton('Transferências',(){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Transfers()))
                                        .then((value) {setState(() {});});
                                  }),
                                ),
                              ]),


                        ]),
                    ),


                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const Calendar()));
                          },
                          child: Column(
                            children: [
                              const Text('Próximo Adversário',style: EstiloTextoBranco.text14),
                              //Escudo
                              adversarioClubName.isNotEmpty ? Image.asset('assets/clubs/${FIFAImages().imageLogo(adversarioClubName)}.png',height: 50,width: 50) : Container(),
                              adversarioClubName.isNotEmpty ? Text(adversarioClubName,style: EstiloTextoBranco.text14) : Container(),
                              adversarioClubName.isNotEmpty ? Text('Posição: '+adversarioPosicao.toString()+'º',style: EstiloTextoBranco.text14) : Container(),
                              adversarioClubName.isNotEmpty ? visitante ? const Text('Fora',style: EstiloTextoBranco.text14) : const Text('Casa',style: EstiloTextoBranco.text14) : Container(),

                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Rodada: '+rodada.toString(),style: EstiloTextoBranco.text16),
                            const Text('Classificação',style: EstiloTextoBranco.text14),
                            Text(Classification(leagueIndex: myClass.campeonatoID).getClubPosition(myClass.clubID).toString()+'º',style: EstiloTextoBranco.text30),
                            Text('Expectativa: '+myClass.expectativa.toString()+'ºlugar',style: EstiloTextoBranco.text14),
                          ],
                        ),

                        //CAMPEONATO
                        Image.asset('assets/icons/${FIFAImages().campeonatoLogo(myClass.campeonatoID)}.png',height: 90,width: 90),
                    ]),

                    //ESTÁDIO
                    Expanded(
                      child: Stack(
                        children: [

                          Image.asset('assets/clubs/${FIFAImages().imageLogo(myClass.clubName)}0.jpg',width: 400,fit: BoxFit.fill,),

                          Container(
                            alignment: Alignment.bottomLeft,
                            child: GestureDetector(
                                onTap:(){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage()));
                                },
                                child: const Icon(Icons.close,color:Colors.red,size: 50)
                            ),
                          ),

                          //DIFICULDADE
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                                onTap:(){
                                },
                                child: Text('Dificuldade: '+GlobalFunctions().getDificuldadeNome(),style: EstiloTextoBranco.text12),
                            ),
                          ),

                            //SAVE
                            Container(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                  onTap:(){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => const ChooseSave()));
                                  },
                                  child: const Icon(Icons.save,color:Colors.white,size: 50)
                              ),
                          ),

                        ],
                      ),
                    ),



                  ],
                )

              ]
          )
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget menuButton(String text, Function() function){
  return  InkWell(
    onTap: function,
    child: Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors().greyTransparent,
        border: Border.all(
        width: 2.0,
        color: Colors.green,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text22),
    ),
  );
}
////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
  popupexpectativaCall(){
    //IF RODADA==1
    if(rodada == semanasJogosNacionais[0]){
      //DEMITIDO

      //Expectativa variables
      int expectativa = myClass.expectativa;
      String expNacional = expectativa.toString()+'º';
      String expCompInternacional = GlobalFunctions().qualCopaInternacional(myClass.campeonatoID);
      String expInternacional = 'Oitavas';
      String expLastSeason = 'TEMPORADA PASSADA: RUIM';
      //show POPUP
      popUpExpectativa(
          context: context,
          title: 'Expectativa para a temporada',
          content: expNacional+"\n\n"+expCompInternacional+"\n"+expInternacional+"\n\n\n"+expLastSeason
      );

    }

  }


}