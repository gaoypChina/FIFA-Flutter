import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/widgets/field_static.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class Substitution extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Substitution({Key? key}) : super(key: key);
  @override
  _SubstitutionState createState() => _SubstitutionState();
}

class _SubstitutionState extends State<Substitution> {

  int dragPlayer = -1;
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    My my = My();
    Club myClub = Club(index: my.clubID);

    return Scaffold(

        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

              Column(
                children: [

                  const SizedBox(height: 40),
                  const Text('Substituição',style: EstiloTextoBranco.text30),

                  const SizedBox(height: 8),
                  Stack(
                    children: [
                      //Estádio
                      Image.asset('assets/clubs/${FIFAImages().imageLogo(My().clubName)}0.jpg',height: 420,width: double.infinity,fit:BoxFit.fill),

                      fieldGameplay442(My().clubID),

                    ],
                  ),

                  const Text('Reservas',style: EstiloTextoBranco.text20),
                  Container(
                    height: 90,
                    color: AppColors().greyTransparent,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount:  myClub.nJogadores>11 ? myClub.nJogadores> 18 ? 7 : myClub.nJogadores -11 : 0,
                        itemBuilder: (BuildContext context, int index) {
                          index = index+11;
                          return draggable(my.jogadores[index]);
                        }
                    ),
                  ),

                  const Spacer(),
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
  Widget draggable(int playerIndex){
    return LongPressDraggable (
      data: playerIndex,
      child: playerWidgetOVR(playerIndex),
      feedback: playerWidgetOVR(playerIndex),
      childWhenDragging: Container(height:60, width: 60,color:AppColors().greyTransparent),
      onDragStarted: (){
        dragPlayer=playerIndex;
        setState(() {});
      },
      onDragCompleted: (){dragPlayer=-1;},
    );
  }

  Widget playerWidgetOVR(int playerIndex){
    Jogador player = Jogador(index: playerIndex);

    String name = player.name;
    String position = player.position;
    double imageSize = 50;

    String circleShow = player.overall.toStringAsFixed(0);

    return GestureDetector(
      onTap:(){
        //PLAYER INFOS
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
                      child: Image.asset('assets/clubs/${FIFAImages().imageLogo(My().clubName)}1.png')
                  )
                      : Image.asset('assets/clubs/${FIFAImages().imageLogo(My().clubName)}1.png'),

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

}