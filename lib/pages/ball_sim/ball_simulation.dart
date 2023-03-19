import 'dart:async';
import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/match/adversario.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/ball_sim/physics.dart';
import 'package:fifa/pages/ball_sim/sim_functions.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final Adversario adversario;
  const GamePage({Key? key, required this.adversario}) : super(key: key);
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  late Timer timer;
  late Field field;
  Match match = Match();
  bool loaded = false;
  SimFunctions simFunctions = SimFunctions();

  @override
  void initState() {
    onInit();
    super.initState();
  }

  void onInit(){

    simFunctions.onInit(match, Club(index: globalMyClubID), context);
    simFunctions.initParameters(widget.adversario.clubID);

    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if(match.ticks==0){
        for (Circle circle in simFunctions.circles) {
          circle.setGravity(context);
        }
        field = Field(context);
        simFunctions.field = field;
        simFunctions.setGravityTeam(field);


        simFunctions.resetBallPosition();
        loaded = true;
        simFunctions.resetPlayersPositions();
      }

      if(!match.isPaused){
        update();
      }

      if(match.minutes == 45){
        simFunctions.resetPlayersPositions();
      }

      if(match.minutes>=90){
        match.ticks=0;
        endMatch();
      }
    });

  }

  void endMatch(){
    match.isPaused = true;
  }

  void update() {
    setState(() {});
    match.updateTime();
    match.updateData();
    setState(() {

      simFunctions.moveBall();

      simFunctions.moveGravityCenter();

      simFunctions.movePlayers();

      simFunctions.playerTouchBall();

      simFunctions.isGoal();

      simFunctions.bounceBallWalls();

    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  //////////////////////////////////////////////////////////////////////////////
  // MAIN
  //////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: loaded ? Column(
          children: [
            const SizedBox(height: 30),
            Stack(
              children: [

                Image.asset('assets/icons/campo.png',height: Sized(context).height-30, width: Sized(context).width, fit: BoxFit.fill),

                header(match, simFunctions.myClub, simFunctions.advClub),

                SizedBox(
                  height: Sized(context).height-35,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Images().getEscudoWidget(match.lastTouch.clubName,20,20),
                        Container(
                          color: colorPositionBackground(match.lastTouch.position),
                          child: Text(match.lastTouch.position, style: EstiloTextoBranco.text14),
                        ),
                        Text(match.lastTouch.name,style: EstiloTextoBranco.text14),
                      ],
                    ),
                  ),
                ),

                loaded ? Stack(
                  children: [
                    for (Circle circle in simFunctions.circles)
                      circlePlayer(circle),

                    for (Circle circle in simFunctions.circles)
                      visionLine(circle, field),

                    for (Circle circle in simFunctions.circles)
                      gravityPoint(circle.gravityCenter, 3),

                    gravityPoint(simFunctions.gravityTeam1.gravityCenter, 5, Colors.red),
                    gravityPoint(simFunctions.gravityTeam2.gravityCenter, 5, Colors.blue),

                    ballWidget(simFunctions.ball),

                    goalLine(field, field.limitYtop),
                    goalLine(field, field.limitYbottom),
                  ],
                ) : Container(),


                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: IconButton(
                      onPressed: (){
                        match.isPaused = !match.isPaused;
                        },
                      icon: Icon(match.isPaused ? Icons.play_arrow : Icons.pause,color: Colors.white,size: 32,)
                  ),
                ),
              ],
            ),
          ],
        ) : Container(),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget header(Match match, Club myClub, Club advClub){
  return             Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(match.getPossesionPercentage().toStringAsFixed(2)+"%",style: EstiloTextoBranco.text16),
      Images().getEscudoWidget(myClub.name,50,50),
      Text(match.goal1.toString()+"x"+match.goal2.toString(),style: EstiloTextoBranco.negrito18),
      Images().getEscudoWidget(advClub.name,50,50),
      Text(match.minutesStr+":",style: EstiloTextoBranco.text16),
      Text(match.secondsStr+"'",style: EstiloTextoBranco.text16),
    ],
  );
}
Widget goalLine(Field field, double topDistance){
  return             Positioned(
    left: field.startGoal,
    top: topDistance,
    child: Container(
      width: field.lengthGoal,
      height: 2,
      color: Colors.white,
    ),
  );
}

Widget ballWidget(Ball ball){
  return Positioned(
    left: ball.x - ball.r,
    top: ball.y - ball.r,
    child: SizedBox(
      width: ball.r * 2,
      height: ball.r * 2,
      child: Image.asset('assets/icons/bola.png',height: ball.r, width: ball.r,),
    ),
  );
}

Widget circlePlayer(Circle circle){
    return Positioned(
      left: circle.x - circle.r - 25,
      top: circle.y - circle.r - 10,
      child: SizedBox(
        width: circle.r * 2+50,
        height: circle.r * 2+25,
        child: Column(
          children: [
            Text(circle.player.name,style: match.lastTouch==circle.player ? EstiloTextoPreto.text12 : EstiloTextoBranco.text8),
            GestureDetector(
              onTap: (){
                customToast(circle.player.position+" "+circle.touchs.toString()+" "+circle.player.name);
              },
              onDoubleTap: (){
                popUpOkShowPlayerInfos(context: context, playerID: circle.player.index, funcSetState: (){});
              },
              child: Container(
                width: circle.r * 2,
                height: circle.r * 2,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: circle.colors.primaryColor,
                  shape: BoxShape.circle,
                  gradient: circle.gradient,
                  border: Border.all(color: circle.colors.secondColor, width: 2),
                ),
                child: Images().getPlayerPictureWidget(circle.player,circle.r,circle.r),
              ),
            ),
          ],
        ),
      ),
    );
}

Widget gravityPoint(GravityCenter gravityCenter, double size, [Color cor = Colors.white]){
    return               Positioned(
      left: gravityCenter.x,
      top: gravityCenter.y,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: cor,
          shape: BoxShape.circle,
        ),
      ),
    );
}

Widget visionLine(Circle circle, Field field){
    circle.getSightVision();
    return  CustomPaint(
      painter: DiagonalLinePainter(circle: circle),
      child:  SizedBox(
        width: field.limitXright,
        height: field.limitYbottom,
      ),
    );
}

}

class DiagonalLinePainter extends CustomPainter {
  final Circle circle;
  DiagonalLinePainter({
    required this.circle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double lineLength = 20;
    double xl = lineLength * cos(circle.sightLeftRad) + circle.x;
    double yl = lineLength * sin(circle.sightLeftRad) + circle.y;
    double xr = lineLength * cos(circle.sightRightRad) + circle.x;
    double yr = lineLength * sin(circle.sightRightRad) + circle.y;
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;


    canvas.drawLine(
        Offset(circle.x, circle.y), Offset(xl, yl), paint);
    canvas.drawLine(
        Offset(circle.x, circle.y), Offset(xr, yr), paint);
  }

  @override
  bool shouldRepaint(DiagonalLinePainter oldDelegate) => false;
}
