import 'dart:async';
import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:flutter/material.dart';

class Circle {
  double x;
  double y;
  double r = 18;
  double dx;
  double dy;
  Jogador player;
  Circle(this.x, this.y, this.dx, this.dy, this.player);
}

class Goal {
  late Field field;
  late double start;
  double length = 46;

  Goal(Field this.field){
    start = ((field.limitXright - field.limitXleft) /2) + field.limitXleft - length/2;
  }
}
class Field {
  late double limitXleft;
  late double limitXright;
  late double limitYtop;
  late double limitYbottom;

  Field(BuildContext context){
    limitXleft = 30;
    limitXright = MediaQuery.of(context).size.width-27;
    limitYtop = 60;
    limitYbottom = MediaQuery.of(context).size.height-144;
  }
}

class Ball {
  double x;
  double y;
  double r;
  double dx;
  double dy;
  Ball(this.x, this.y, this.r, this.dx, this.dy);
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Circle> circles = [];
  late Ball ball;
  late Timer timer;
  final double ballRadius = 8;
  final double speed = 6;
  Club myClub = Club(index: globalMyClubID);
  Club advClub = Club(index: 44);
  late Field field;
  late Goal goal;

  @override
  void initState() {
    super.initState();
    onInit();
  }

  void onInit(){

    for (int i=0; i<11; i++){
      circles.add(Circle(Random().nextDouble()*360+20, Random().nextDouble()*320+30,
          speed, speed,
          Jogador(index: myClub.jogadores[i])
      ));
      circles.add(Circle(Random().nextDouble()*360+20, Random().nextDouble()*320 + 350,
          speed, speed,
          Jogador(index: advClub.jogadores[i])
      ));
    }
    ball = Ball(180, 320, ballRadius, speed, speed);
    timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      update();
    });
  }
  void update() {
    setState(() {});
    field = Field(context);
    goal = Goal(field);
    setState(() {
      // Move the ball
      ball.x += ball.dx;
      ball.y += ball.dy;
      // Bounce off the left and right walls
      if (ball.x - ballRadius <= field.limitXleft || ball.x + ballRadius >= field.limitXright) {
        ball.dx *= -1;
      }
      // Bounce off the top and bottom walls
      if (ball.y - ballRadius <= field.limitYtop || ball.y + ballRadius >= field.limitYbottom) {
        ball.dy *= -1;
      }

      //GOAL TEAM 2
      if(ball.y - ballRadius <= goal.field.limitYtop && ball.x - ballRadius >= goal.start && ball.x - ballRadius <= goal.start+goal.length){
        customToast('GOAL 1');
        ball.x = 150;
        ball.y = 340;
      }
      if(ball.y - ballRadius >= goal.field.limitYbottom && ball.x - ballRadius >= goal.start && ball.x - ballRadius <= goal.start+goal.length){
        customToast('GOAL 2');
        ball.x = 150;
        ball.y = 340;
      }

      for (Circle circle in circles) {
        double dist = sqrt(pow(circle.x - ball.x, 2) + pow(circle.y - ball.y, 2));
        if (dist <= circle.r + ballRadius) {
          double angle = atan2(ball.y - circle.y, ball.x - circle.x);
          ball.dx = speed * cos(angle);
          ball.dy = speed * sin(angle);
          break;
        }
      }

      // Move the circles in a random direction every second
      if (timer.tick % 1 == 0) {
        for (Circle circle in circles) {
          double direction = Random().nextInt(5)-2;
          var distance = 2;
          if (Random().nextBool()) {
            direction = (ball.x - circle.x)/((ball.x - circle.x).abs());
            circle.x += direction * distance;
          } else {
            direction = (ball.y - circle.y)/((ball.y - circle.y).abs());
            circle.y += direction * distance;
          }
          // Bounce off the left and right walls
          if (circle.x - circle.r <= field.limitXleft || circle.x + circle.r >= field.limitXright) {
            circle.x += -direction * distance;
          }
          // Bounce off the top and bottom walls
          if (circle.y - circle.r <= field.limitYtop || circle.y + circle.r >= field.limitYbottom) {
            circle.y += -direction * distance;
          }

        }
      }
    });
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
        child: Stack(
          children: [

            Images().getWallpaper(),

            Image.asset('assets/icons/campo.png',height: Sized(context).height, width: Sized(context).width, fit: BoxFit.fill),

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
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: circle.player.clubName == myClub.name ? myClub.colors.primaryColor : advClub.colors.primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: circle.player.clubName == myClub.name ? myClub.colors.secondColor : advClub.colors.secondColor, width: 2),
                    ),
                    child: Images().getPlayerPictureWidget(circle.player,circle.r,circle.r),
                  ),
                ),
              ),
            Positioned(
              left: ball.x - ball.r,
              top: ball.y - ball.r,
              child: SizedBox(
                width: ball.r * 2,
                height: ball.r * 2,
                child: Image.asset('assets/icons/bola.png',height: ball.r, width: ball.r,),
              ),
            ),

            Positioned(
              left: goal.start,
              top: goal.field.limitYtop,
              child: Container(
                width: goal.length,
                height: 2,
                color: Colors.white,
              ),
            ),

            Positioned(
              left: goal.start,
              top: goal.field.limitYbottom,
              child: Container(
                width: goal.length,
                height: 2,
                color: Colors.white,
              ),
            ),

          ],
        ),
      ),
    );
  }

}
