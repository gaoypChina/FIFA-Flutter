import 'package:fifa/classes/adversario.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/menu/b_home.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/calendar.dart';
import 'package:fifa/pages/ranking_clubs.dart';
import 'package:fifa/pages/save/choose_save.dart';
import 'package:fifa/pages/simulacao/not_play.dart';
import 'package:fifa/pages/table/table_international.dart';
import 'package:fifa/pages/table/table_nacional.dart';
import 'package:fifa/pages/transfers.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/values/images.dart';
import 'package:flutter/scheduler.dart';
import '../../classes/classification.dart';
import '../../classes/club.dart';
import '../../classes/geral/dificuldade.dart';
import '../../classes/my.dart';
import '../my_team.dart';
import '../../popup/popup_expectativa.dart';
import '../change_club.dart';
import '../historic/my_historic.dart';
import '../simulacao/play.dart';
import '../../theme/textstyle.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Menu({Key? key}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  My myClass = My();
  Adversario adversario = Adversario();
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

    adversario.getAdversario();

    setState(() {});
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

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
                        Image.asset(Images().getMyEscudo(),height: 90,width: 90),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width:180,child: Text(myClass.clubName,textAlign: TextAlign.center,style: EstiloTextoBranco.text20)),
                            Text('\nAno: '+ ano.toString(),style: EstiloTextoBranco.text14),
                            Text('Semana: '+ semana.toString(),style: EstiloTextoBranco.text14),
                            Text('Dinheiro: \$'+ myClass.money.toStringAsFixed(2)+'mi',style: EstiloTextoBranco.text14),
                            Text('Overall da Equipe: ' + Club(index: myClass.clubID).getOverall().toStringAsFixed(2),style: EstiloTextoBranco.text14),
                            Text('Valor da Equipe: \$' + myClass.getClubValue().toStringAsFixed(2)+'mi',style: EstiloTextoBranco.text14),
                          ],
                        ),

                        //UNIFORME
                        Image.asset(Images().getMyUniform(),height: 100,width: 100),

                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          menuButton('Jogar',(){
                            if(adversario.clubName.isNotEmpty){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Play(adversarioClubID: adversario.clubID, visitante: adversario.visitante)));
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
                                    //Mostra a competição internacional que o time está participando 1º
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TableInternational(leagueInternational: My().getMyInternationalLeague())));
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
                              adversario.clubName.isNotEmpty ? Image.asset('assets/clubs/${FIFAImages().imageLogo(adversario.clubName)}.png',height: 50,width: 50) : Container(),
                              adversario.clubName.isNotEmpty ? Text(adversario.clubName,style: EstiloTextoBranco.text14) : Container(),
                              adversario.clubName.isNotEmpty
                                  ? Semana().isJogoMataMataInternacional
                                      ? Text(Semana().semanaStr,style: EstiloTextoBranco.text14)
                                  : Text('Posição: '+adversario.posicao.toString()+'º',style: EstiloTextoBranco.text14)
                                  : Container(),
                              adversario.clubName.isNotEmpty ? adversario.visitante ? const Text('Fora',style: EstiloTextoBranco.text14) : const Text('Casa',style: EstiloTextoBranco.text14) : Container(),

                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Rodada: '+rodada.toString(),style: EstiloTextoBranco.text16),
                            const Text('Classificação',style: EstiloTextoBranco.text14),
                            Text(Classification(leagueIndex: myClass.campeonatoID).getClubPosition(myClass.clubID).toString()+'º',style: EstiloTextoBranco.text30),
                            Text('Expectativa: '+myClass.getLastYearExpectativa().toString()+'ºlugar',style: EstiloTextoBranco.text14),
                          ],
                        ),

                        //CAMPEONATO
                        Images().getMyCampeonatoLogo().isNotEmpty
                            ? Image.asset(Images().getMyCampeonatoLogo(),height: 90,width: 90)
                            : const SizedBox(height: 90,width: 90),
                    ]),

                    const SizedBox(height: 4),
                    //ESTÁDIO
                    Expanded(
                      child: Stack(
                        children: [

                          Image.asset(Images().getMyStadium(),height:  double.maxFinite, width: double.maxFinite,fit: BoxFit.fill,),

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
                                child: Text('Dificuldade: '+DificuldadeClass().getName(),style: EstiloTextoBranco.text12),
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
    if(rodada == 1){
      //DEMITIDO

      //show POPUP
      popUpExpectativa(context: context);

    }

  }


}