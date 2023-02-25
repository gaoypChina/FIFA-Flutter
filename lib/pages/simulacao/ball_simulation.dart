import 'dart:async';
import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/game_simulation/physics.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/match/adversario.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/kits_crests/crest.dart';
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
    super.initState();
    onInit();
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
    print(circles.length);
    timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if(match.ticks==0){
        field = Field(context);
        ball.x = field.limitXmiddle;
        ball.y = field.limitYmiddle;
        for (Circle circle in circles) {
          defaultPosition(circle, field);
        }
      }
      update();
      if(match.minutes>=90){
        match.ticks=0;
        endMatch();
      }
    });
    loaded = true;

  }

  void endMatch(){
    Navigator.pop(context);
  }

  void update() {
    setState(() {});
    match.updateTime();
    setState(() {

      // Move the ball
      ball.x += ball.dx;
      ball.y += ball.dy;

      isGoal();

      bounceBall();

      bool touch = false;
      for (Circle circle in circles) {
        double dist = sqrt(pow(circle.x - ball.x, 2) + pow(circle.y - ball.y, 2));
        if (dist <= circle.r + ball.r) {
          double angle = atan2(ball.y - circle.y, ball.x - circle.x);
          ball.dx = speed * cos(angle);
          ball.dy = speed * sin(angle);
          touch = true;
          isPassCorrect(circle);
          match.lastTouch = circle.player;
          touchBallCount();
          break;
        }
      }

      if(!touch){
        slowDownBall();
      }

      // Move the circles every second
      if (timer.tick % 1 == 0) {
        for (Circle circle in circles) {
          double direction = Random().nextInt(5)-2;
          double distance = 2;
          if(circle.player.position != "GOL") {
            direction = (ball.x - circle.x) / ((ball.x - circle.x).abs());
            direction += Random().nextDouble()*2-1;
            double velocity = calculateBallCircleDistance(circle);
            circle.x += direction * distance * velocity;
            direction = (ball.y - circle.y) / ((ball.y - circle.y).abs());
            circle.y += direction * distance * velocity;
          }else{
            direction = (ball.x - circle.x) / ((ball.x - circle.x).abs());
            if(circle.x >= field.startGoal && circle.x <= field.startGoal+field.lengthGoal){
              circle.x += direction * distance;
            }
          }
          //BOUNCE OFF THE WALL
          bounceWall(circle, distance, direction);

        }
      }
    });
  }

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

  double calculateBallCircleDistance(Circle circle){
    double directionX = ((ball.x - circle.x).abs());
    double directionY = ((ball.y - circle.y).abs());
    double distance = sqrt(pow(directionX, 2) + pow(directionY, 2));

    // ANEIS DE VELOCIDADE
    double velocity = 0;
    if(distance<30){
      velocity = 1;
    }else if(distance<50){
      velocity = 0.7;
    }else if(distance<100){
      velocity = 0.5;
    }else if(distance<200){
      velocity = 0.3;
    }else if(distance<400){
      velocity = 0.1;
    }
    return velocity;
  }
  void resetPlayersPositions(){
    for(Circle circle in circles){
      defaultPosition(circle, field);
    }
  }
  void defaultPosition(Circle circle, Field field){
    GravityPosition gravityPosition = GravityPosition(context, circle.position);
    circle.x = gravityPosition.gravityCenter.x;
    circle.y = gravityPosition.gravityCenter.y;
    if(circle.player.clubID == advClub.index){
      double invert = (circle.y-field.limitYtop);
      circle.y = field.limitYbottom - invert;
    }
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

  void bounceBall(){
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Game Page")),
      body: Container(
        color: Colors.white,
        child: loaded ? Stack(
          children: [

            Images().getWallpaper(),

            Image.asset('assets/icons/campo.png',height: Sized(context).height, width: Sized(context).width, fit: BoxFit.fill),


            header(match, myClub, advClub),
            Text(match.lastTouch.name,style: EstiloTextoBranco.text16),

            for (Circle circle in circles)
              Positioned(
                left: circle.x - circle.r,
                top: circle.y - circle.r,
                child: GestureDetector(
                  onTap: (){
                    customToast(circle.player.name);
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
              ),

            ballWidget(ball),

            goalLine(field, field.limitYtop),
            goalLine(field, field.limitYbottom),

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
      const SizedBox(width: 45),
      Text(match.getPossesionPercentage().toStringAsFixed(2)+"%",style: EstiloTextoBranco.text16),
      Images().getEscudoWidget(myClub.name,50,50),
      Text(match.goal1.toString()+"x"+match.goal2.toString(),style: EstiloTextoBranco.text16),
      Images().getEscudoWidget(advClub.name,50,50),
      Text(match.minutes.toString()+":",style: EstiloTextoBranco.text16),
      Text(match.seconds.toString()+"'",style: EstiloTextoBranco.text16),
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

}
