import 'dart:async';
import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/game_simulation/physics.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/match/adversario.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/kits_crests/crest.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final Adversario adversario;
  const GamePage({Key? key, required this.adversario}) : super(key: key);
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  List<Circle> circles = [];
  late Ball ball;
  late Timer timer;
  final double speed = 6;
  Club myClub = Club(index: globalMyClubID);
  late Club advClub;
  late Field field;
  Match match = Match();
  bool loaded = false;

  @override
  void initState() {
    onInit();
    super.initState();
  }

  void onInit(){
    advClub = Club(index: widget.adversario.clubID);
    ball = Ball(0, 0, speed, speed);

    for (int i=0; i<11; i++){
      circles.add(Circle(Random().nextDouble()*360+20, Random().nextDouble()*320+30,
          myClub.colors,
          CrestWidgets(size: 0).getGradient(myClub.name),
          Jogador(index: myClub.escalacao[i]),
          i
      ));
      circles.add(Circle(Random().nextDouble()*360+20, Random().nextDouble()*320 + 350,
          advClub.colors,
          CrestWidgets(size: 0).getGradient(advClub.name),
          Jogador(index: advClub.escalacao[i]),
          i
      ));
    }

    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if(match.ticks==0){
        for (Circle circle in circles) {
          circle.setGravity(context);
        }
        field = Field(context);
        match.setGravityTeam(field);
        ball.x = field.limitXmiddle;
        ball.y = field.limitYmiddle;
        resetPlayersPositions();
      }

      if(!match.isPaused){
        update();
      }

      if(match.minutes == 45){
        resetPlayersPositions();
      }

      if(match.minutes>=90){
        match.ticks=0;
        endMatch();
      }
    });
    loaded = true;

  }

  void endMatch(){
    match.isPaused = true;
    //Navigator.pop(context);
  }

  void update() {
    setState(() {});
    match.updateTime();
    setState(() {

      moveBall();

      isGoal();

      bounceBallWalls();

      //SE UM JOGADOR TOCAR NA BOLA
      bool touch = false;
      for (Circle circle in circles) {
        double dist = sqrt(pow(circle.x - ball.x, 2) + pow(circle.y - ball.y, 2));
        if (dist <= circle.r + ball.r) {
          double angle = atan2(ball.y - circle.y, ball.x - circle.x);
          //MOVIMENTOS POSSÍVEIS
          angle = gradtorad(playerVision(circle));
          angle = calcAngleOriginalSystemRad(angle);
          //Atualiza direção da bola
          ball.dx = speed * cos(angle);
          ball.dy = speed * sin(angle);

          // Move the ball
          ball.x += ball.dx + Random().nextInt(9)-2;
          ball.y += ball.dy;

          touch = true;
          isPassCorrect(circle);
          match.lastTouch = circle.player;
          touchBallCount();
          break;
        }
      }

      //If nobody touchs the ball
      if(!touch){
        slowDownBall();
      }

      match.gravityTeam1.moveGravityCenter(ball, field, true);
      match.gravityTeam2.moveGravityCenter(ball, field, false);
      for (Circle circle in circles){
        if(circle.isMyPlayer){
          circle.gravityCenter.updateGravityCenter(match.gravityTeam1);
        }else{
          circle.gravityCenter.updateGravityCenter(match.gravityTeam2);
        }
      }

      // Move the circles every second
      if (timer.tick % 1 == 0) {
        movePlayers();
      }




    });
  }

  //////////////////////////////////////////////////////////////////////////////
  // MOVEMENTS
  //////////////////////////////////////////////////////////////////////////////
  void moveBall(){
    // Move the ball
    ball.x += ball.dx;
    ball.y += ball.dy;
  }
  void movePlayers(){
    for (Circle circle in circles) {
      playerMovement(circle);
      //BOUNCE OFF THE WALL
      double distance = 2;
      double direction = Random().nextInt(5)-2;
      bounceWall(circle, distance, direction);
      bouncePlayers(circle);
    }
  }

  void playerMovement(Circle circle){
    double distanceGravity = 0;
    if(circle.x != circle.gravityCenter.x && circle.y != circle.gravityCenter.y){
      distanceGravity =  sqrt(pow(circle.x - circle.gravityCenter.x, 2) + pow(circle.y - circle.gravityCenter.y, 2));
    }
    double distanceBall =  sqrt(pow(circle.x - ball.x, 2) + pow(circle.y - ball.y, 2));

    //MOVE PARA O QUE ESTIVER MAIS PERTO
    // A BOLA OU A POSIÇÃO DO JOGADOR (CENTRO DE GRAVIDADE)
    double destinyX = ball.x;
    double destinyY = ball.y;
    if((distanceBall > 100 || distanceGravity > 100) && distanceGravity != 0){
      destinyX = circle.gravityCenter.x;
      destinyY = circle.gravityCenter.y;
    }

    //Player Velocity
    double distance2 = calculateBallCircleDistance(circle, destinyX, destinyY);
    double velocity = calculateBallCircleVelocity(distance2);
    velocity *= 3;

    double distance = 2;
    double direction = (destinyX - circle.x) / ((destinyX - circle.x).abs());
    circle.x += (direction * distance * velocity) + Random().nextInt(3)-1;

    direction = (destinyY - circle.y) / ((destinyY - circle.y).abs());
    circle.y += direction * distance * velocity;
  }

  void goalkeeperMovement(Circle circle){
    //GOLEIRO
    double distance = 2;
    double direction = (ball.x - circle.x) / ((ball.x - circle.x).abs());
    if(circle.x >= field.startGoal && circle.x <= field.startGoal+field.lengthGoal){
      circle.x += direction * distance;
    }if(calculateBallCircleDistance(circle, ball.x, ball.y)<45){
      direction = (ball.y - circle.y) / ((ball.y - circle.y).abs());
      circle.y += direction * distance;
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  // PLAYER VISION
  //////////////////////////////////////////////////////////////////////////////
  double radtograd(double rad){
    return rad*180/pi;
  }
  double gradtorad(double grad){
    return grad*pi/180;
  }
  double negativeAngleTo360(double originalAngle) {
    double convertedAngle = originalAngle + 360;
    while (convertedAngle >= 360) {
      convertedAngle -= 360;
    }
    return convertedAngle;
  }
  double negativeAngleFrom360(double originalAngle) {
    if(originalAngle > 180) {
      return  originalAngle - 360;
    }
    if(originalAngle < -180) {
      return  originalAngle + 360;
    }
    return originalAngle;
  }
  double rotateAngleGrad(double originalAngleGrad, double angleOfRotationGrad) {
    double originalAngle360 = negativeAngleTo360(originalAngleGrad);
    double angleOfRotation360 = negativeAngleTo360(angleOfRotationGrad);
    double convertedAngle = originalAngle360 - angleOfRotation360;
    while (convertedAngle < 0) {
      convertedAngle += 360;
    }
    convertedAngle = negativeAngleFrom360(convertedAngle);
    return convertedAngle;
  }

  double calcAngleOriginalSystemRad(double angleRad){
    return angleRad - pi/2;
  }
  double calcAngleGrad(double x, double xRef, double y, double yRef){
    double angle = atan2(y - yRef, x - xRef)+pi/2;
    angle = negativeAngleFrom360(radtograd(angle));
    return angle;
  }
  double calcAngleRad(double x, double xRef, double y, double yRef){
    double angleGrad = calcAngleGrad(x, xRef, y, yRef);
    return gradtorad(angleGrad);
  }

  double playerVision(Circle circle1){
    //ball.x = 100;
    //ball.y = 350;
    //circle1.x = ball.x-circle1.r;
    //circle1.y = ball.y-circle1.r;
    double angleBall = calcAngleGrad(ball.x, circle1.x, ball.y, circle1.y);
    late double angleGoalStart;
    late double angleGoalEnd;
    if(circle1.player.clubID == myClub.index){
      angleGoalStart = calcAngleGrad(field.startGoal, circle1.x, field.limitYbottom, circle1.y);
      angleGoalEnd = calcAngleGrad(field.endGoal, circle1.x, field.limitYbottom, circle1.y);
    }else{
      angleGoalStart = calcAngleGrad(field.startGoal, circle1.x, field.limitYtop, circle1.y);
      angleGoalEnd = calcAngleGrad(field.endGoal, circle1.x, field.limitYtop, circle1.y);
    }
    double angleGoalStartBallReference = rotateAngleGrad(angleGoalStart, angleBall);
    //print("\nLOOP");
    //print(circle1.player.name);
    //print(angleGoalStart);
    //print(angleBall);
    //print(angleGoalStartBallReference);

    //Se o gol estiver no campo de visao entao chuta pra frente
    if(angleGoalStartBallReference.abs()<90){
      return angleGoalStart;
    }else {
      //Se não estiver na direção do gol, procura passe
      for (Circle circle in circles) {
        if (circle.player.clubID == circle1.player.clubID) {
            double anglePasse = calcAngleGrad(circle.x, circle1.x, circle.y, circle1.y);
            //Mudança do eixo de coordenada de referencia para a bola.
            double anglePasseBallReference = rotateAngleGrad(anglePasse, angleBall);
            if (anglePasseBallReference.abs() < 90) {//jogador no campo de visao
              return anglePasse;
            }
          }
        }
      }

    return angleBall;
  }

  //////////////////////////////////////////////////////////////////////////////
  // BOUNCE
  //////////////////////////////////////////////////////////////////////////////
  void bounceWall(Circle circle, double distance, double direction){
    // Bounce off the left and right walls
    if (circle.x <= field.limitXleft || circle.x >= field.limitXright) {
      direction = (field.limitXleft - circle.x) / ((field.limitXleft - circle.x).abs());
      circle.x += direction * distance;
    }
    // Bounce off the top and bottom walls
    if (circle.y <= field.limitYtop || circle.y >= field.limitYbottom) {
      direction = (field.limitYtop - circle.y) / ((field.limitYtop - circle.y).abs());
      circle.y += direction * distance;
    }
  }

  double calculateBallCircleDistance(Circle circle, double destinyX, double destinyY) {
    double directionX = ((destinyX - circle.x).abs());
    double directionY = ((destinyY - circle.y).abs());
    double distance = sqrt(pow(directionX, 2) + pow(directionY, 2));
  return distance;
  }

  double calculateBallCircleVelocity(double distance) {
    // ANEIS DE VELOCIDADE
    double velocity = 0;
    if(distance<30){
      velocity = 1;
    }else if(distance<60){
      velocity = 0.8;
    }else if(distance<100){
      velocity = 0.7;
    }else if(distance<200){
      velocity = 0.5;
    }else if(distance<400){
      velocity = 0.2;
    }
    return velocity;
  }
  //////////////////////////////////////////////////////////////////////////////
  // PLAYERS POSITION
  //////////////////////////////////////////////////////////////////////////////
  void resetPlayersPositions(){
    for(Circle circle in circles){
      defaultPosition(circle, field);
    }
  }
  void defaultPosition(Circle circle, Field field){
    GravityPosition gravityPosition = GravityPosition(context, circle.position, circle.isMyPlayer);
    circle.x = gravityPosition.gravityCenter.x;
    circle.y = gravityPosition.gravityCenter.y;
  }
  void isPassCorrect(Circle circle){
    if(match.lastTouch.clubID == circle.player.clubID){
      circles
          .where((circle) => circle.player.index == match.lastTouch.index)
          .forEach((circle) {
        circle.passesRight++;
      });
    }else{
      circles
          .where((circle) => circle.player.index == match.lastTouch.index)
          .forEach((circle) {
        circle.passesWrong++;
      });
    }
  }

  void touchBallCount(){
    circles
        .where((circle) => circle.player.index == match.lastTouch.index)
        .forEach((circle) {
      circle.touchs++;
    });
  }
  void slowDownBall(){
    if(ball.dx>0){
      ball.dx -= ball.ax;
    }else{
      ball.dx += ball.ax;
    }
    if(ball.dy>0){
      ball.dy -= ball.ay;
    }else{
      ball.dy += ball.ay;
    }
  }

  void bouncePlayers(Circle circle){
    //VE SE TEM OUTRO JOGADOR MUITO PRÓXIMO
    for (Circle circle1 in circles){
      if(circle1 != circle){
        double dist = sqrt(pow(circle.x - circle1.x, 2) + pow(circle.y - circle1.y, 2));
        if(dist<10){
          if (circle.x <= circle1.x+4 && circle.x >= circle1.x-4) {
            circle.x += -8;
          }
          if (circle.y <= circle1.y+4 && circle.y >= circle1.y-4) {
            circle.y -= -8;
          }
        }
      }
    }
  }
  void bounceBallWalls(){
    // Bounce off the left and right walls
    if (ball.x + ball.r <= field.limitXleft || ball.x - ball.r >= field.limitXright) {
      ball.dx *= -1;
      lateral();
    }
    // Bounce off the top and bottom walls
    if (ball.y + ball.r  <= field.limitYtop
        || ball.y - ball.r >= field.limitYbottom ) {
      ball.dy *= -1;
      escanteio();
    }
  }
  void isGoal(){
    //GOAL TEAM 1
    if(ball.y - ball.r >= field.limitYbottom && ball.x - ball.r >= field.startGoal && ball.x - ball.r <= field.startGoal+field.lengthGoal){

      circles
          .where((circle) => circle.player.index == match.lastTouch.index)
          .forEach((circle) {
        circle.goals++;
        customToast('GOAL 1 '+circle.player.name);
      });
      match.goal1 += 1;
      ball.x = field.limitXmiddle;
      ball.y = field.limitYmiddle;
      resetPlayersPositions();
    }

    //GOAL TEAM 2
    if(ball.y - ball.r <= field.limitYtop && ball.x - ball.r >= field.startGoal && ball.x - ball.r <= field.startGoal+field.lengthGoal){
        circles
            .where((circle) => circle.player.index == match.lastTouch.index)
            .forEach((circle) {
              circle.goals++;
              customToast('GOAL 2 '+circle.player.name);
            });

      match.goal2 += 1;
      ball.x = field.limitXmiddle;
      ball.y = field.limitYmiddle;
      resetPlayersPositions();
    }
  }
  void escanteio(){
    if(ball.x > field.limitXmiddle){
      ball.x = field.limitXright-5;
    }else{
      ball.x = field.limitXleft+5;
    }

    for (int i=0; i<circles.length; i++){
      for (Circle circle in circles) {
        defaultPosition(circle, field);
      }
    }
  }
  void lateral(){
    if(ball.x < field.limitXleft){
      ball.x = field.limitXleft+1;
    }else{
      ball.x = field.limitXright-1;
    }
    for (int i=0; i<circles.length; i++){
      for (Circle circle in circles) {
        //defaultPosition(circle, field);
      }
    }
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

                header(match, myClub, advClub),

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

                for (Circle circle in circles)
                  circlePlayer(circle),

                for (Circle circle in circles)
                  gravityPoint(circle.gravityCenter, 3),

                gravityPoint(match.gravityTeam1.gravityCenter, 5, Colors.red),
                gravityPoint(match.gravityTeam2.gravityCenter, 5, Colors.blue),

                ballWidget(ball),

                goalLine(field, field.limitYtop),
                goalLine(field, field.limitYbottom),

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
    return               Positioned(
      left: circle.x - circle.r,
      top: circle.y - circle.r,
      child: GestureDetector(
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


}
