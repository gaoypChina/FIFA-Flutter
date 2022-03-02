import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/Jogador.dart';
import 'package:fifa/popup/popup_player_info.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/button_return.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';
import '../values/images.dart';

class ClubProfile extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final int clubID;
  const ClubProfile({Key? key, required this.clubID}) : super(key: key);
  @override
  _ClubProfileState createState() => _ClubProfileState();
}

class _ClubProfileState extends State<ClubProfile> {

  late Club clubClass;

  String show = 'OVR';
  late double averageAge;

  List jogadoresOrganizados = [];
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    setClass();
    setTitularesEReservas();
    setAverageAge();
    setState(() {});
    super.initState();
  }
  setClass(){
    clubClass = Club(index: widget.clubID);
  }
  setTitularesEReservas(){
    jogadoresOrganizados = clubClass.escalacao;
  }
  setAverageAge(){
    averageAge = 0;
    for(int i=0; i<clubClass.nJogadores; i++){
      averageAge += Jogador(index: clubClass.jogadores[i]).age;
    }
    averageAge = averageAge / clubClass.nJogadores;
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(

        body:  Stack(
            children: [

              Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill,),

              Column(
                children: [

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      //Escudo da Equipe
                      Image.asset('assets/clubs/${FIFAImages().imageLogo(clubClass.name)}.png',height: 80,width: 80),

                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Overall: '+clubClass.getOverall().toStringAsFixed(2), style: EstiloTextoBranco.text16),
                            Text('Média Idade: '+averageAge.toStringAsFixed(2), style: EstiloTextoBranco.text16),
                          ],
                        ),
                      ),

                    ],
                  ),

                  //Widget do campo
                  fieldGameplay442(),

                  const       SizedBox(height: 4),
                  Container(
                      width: _width,
                      color: AppColors().greyTransparent,
                      child: const Text('RESERVAS:', style: EstiloTextoBranco.text22)
                  ),

                  Container(
                    height: 110,
                    color: AppColors().greyTransparent,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount:  clubClass.nJogadores>11 ? 7 : 0,
                        itemBuilder: (BuildContext context, int index) {
                          index = index+11;
                          return playerWidgetOVR(jogadoresOrganizados[index]);
                        }
                    ),
                  ),

                  Container(
                    height: 110,
                    color: AppColors().greyTransparent,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: clubClass.nJogadores>18 ? clubClass.nJogadores-18 : 0,
                        itemBuilder: (BuildContext context, int index) {
                          index = index+18;
                          return playerWidgetOVR(jogadoresOrganizados[index]);
                        }
                    ),
                  ),

                  //FILTRAR POR TÓPICOS
                  Padding(
                    padding: const EdgeInsets.only(top:4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        button(title: 'OVR', function: (){setState(() {});show = 'OVR';}),
                        button(title: 'Idade', function: (){setState(() {});show = 'Idade';}),
                        button(title: 'Jogos', function: (){setState(() {});show = 'Jogos';}),
                        button(title: 'Gols', function: (){setState(() {});show = 'Gols';}),
                        button(title: 'Assists.', function: (){setState(() {});show = 'Assists';}),
                      ],
                    ),
                  ),

                ],
              ),

              //BOTAO DE VOLTAR
              returnButton(context),

            ]
        ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
  comprarJogador(Jogador player){
    popUpOkShowPlayerInfos(
        context: context,
        playerID: player.index,
      funcSetState: (){setState(() {});},
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

  button({required String title, required Function()? function}) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: EstiloTextoBranco.text16,
            ),
          ],
        ),
      ),
    );
  }


  Widget playerWidgetOVR(int playerIndex){
    Jogador player = Jogador(index: playerIndex);

    String name = player.name;
    String position = player.position;
    double imageSize = 50;

    String circleShow = player.overall.toStringAsFixed(0);
    if(show == 'Jogos'){circleShow = player.matchs.toStringAsFixed(0);}
    else if(show == 'Gols'){circleShow = player.goals.toStringAsFixed(0);}
    else if(show == 'Assists'){circleShow = player.assists.toStringAsFixed(0);}
    else if(show == 'Idade'){circleShow = player.age.toStringAsFixed(0);}

    return GestureDetector(
      onTap:(){
        //PLAYER INFOS
        comprarJogador(player);
      },
      onDoubleTap: (){
        comprarJogador(player);
      },
      child: Center(
        child: Column(
          children: [

            //OVR
            SizedBox(
              height: imageSize-5,
              width: imageSize,
              child: Stack(
                children: [

                  //Uniforme
                  (player.injury >0 || player.redCard >0)
                      ? Opacity(
                      opacity: 0.4,
                      child: Image.asset('assets/clubs/${FIFAImages().imageLogo(clubClass.name)}1.png')
                  )
                      : Image.asset('assets/clubs/${FIFAImages().imageLogo(clubClass.name)}1.png'),

                  //CIRCULO
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Image.asset('assets/icons/circulo.png',height: 22),
                  ),

                  //OVR
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(circleShow,style: EstiloTextoPreto.text14),
                    ),
                  ),

                  //POSIÇÃO
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(position,style: EstiloTextoBranco.text14),
                    ),
                  ),

                ],
              ),
            ),
            //Nome do jogador
            Container(
                color: AppColors().greyTransparent,
                width: 80,
                child: Text(name,textAlign: TextAlign.center,style: EstiloTextoBranco.text10)
            ),

          ],
        ),
      ),
    );
  }


  Widget fieldGameplay442(){
    List jogadoresTitulares = jogadoresOrganizados;
    return SizedBox(
      height: 360,
      child: Stack(
        children: [

          //Campo
          Image.asset('assets/icons/campo metade.png',height:double.infinity,width:double.infinity,fit:BoxFit.fill),

          Column(
            children: [
              //ATACANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  playerWidgetOVR(jogadoresTitulares[9]),
                  playerWidgetOVR(jogadoresTitulares[10]),
                ],
              ),
              //MEIAS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  playerWidgetOVR(jogadoresTitulares[7]),
                  playerWidgetOVR(jogadoresTitulares[8]),
                ],
              ),
              //VOLANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  playerWidgetOVR(jogadoresTitulares[5]),
                  playerWidgetOVR(jogadoresTitulares[6]),
                ],
              ),
              //ZAGUEIROS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  playerWidgetOVR(jogadoresTitulares[1]),
                  playerWidgetOVR(jogadoresTitulares[2]),
                  playerWidgetOVR(jogadoresTitulares[3]),
                  playerWidgetOVR(jogadoresTitulares[4]),
                ],
              ),

              //GOLEIRO
              playerWidgetOVR(jogadoresTitulares[0]),

            ],
          ),
        ],
      ),
    );

  }

}