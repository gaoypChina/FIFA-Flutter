import 'dart:math';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/club_details.dart';
import 'package:flutter/material.dart';

class Match{
  int goal1 = 0;
  int goal2 = 0;
  int ticks = 0;
  int seconds = 0;
  String secondsStr = "00";
  String minutesStr = "00";
  int minutes = 0;
  bool isPaused = false;
  late GravityTeam gravityTeam1;
  late GravityTeam gravityTeam2;
  My my = My();
  Jogador lastTouch = Jogador(index: 0);
  int ballPossesionTime1 = 0;

  setGravityTeam(Field field){
    gravityTeam1 = GravityTeam(field, true);
    gravityTeam2 = GravityTeam(field, false);
  }

  getPossesionPercentage(){
    return ballPossesionTime1/ticks*100;
  }

  updateTime(){
    int gameVelocity = 3;
    ticks += gameVelocity;
    seconds = ticks % 60;
    minutes = (ticks / 60).ceil();

    if(lastTouch.clubID == my.clubID){
      ballPossesionTime1 += gameVelocity;
    }

    secondsStr = seconds.toString();
    if(seconds<10){
      secondsStr = "0"+secondsStr;
    }
    minutesStr = minutes.toString();
    if(minutes<10){
      minutesStr = "0"+minutesStr;
    }

  }
  endTime(){
    ticks = 0;
    seconds = 0;
    minutes = 90;
  }
}

class Circle {
  bool isMyPlayer = false;
  double x;
  double y;
  double r = 15;
  late double dx;
  late double dy;
  late double sightLeft;
  late double sightRight;
  late double sightLeftRad;
  late double sightRightRad;
  ClubColors colors;
  LinearGradient gradient;
  Jogador player;
  int position;
  int touchs = 0;
  int passesRight = 0;
  int passesWrong = 0;
  int goals = 0;
  int assists = 0;
  late GravityCenter gravityCenter;

  Circle(this.x, this.y, this.colors, this.gradient, this.player, this.position){
    dx = (player.overallDynamic^3).toDouble()/100;
    dy = (player.overallDynamic^3).toDouble()/100;
    if(player.clubID == globalMyClubID){
      isMyPlayer = true;
    }

    double angle = atan2(dy, dx) * 180 / pi;
    sightLeft = angle - 30;
    sightRight = angle + 30;

    sightRightRad = sightRight * pi /180;
    sightLeftRad = sightLeft * pi /180;

  }
  setGravity(context){
  GravityPosition gravityPosition = GravityPosition(context, position, isMyPlayer);
  gravityCenter = gravityPosition.gravityCenter;
  }
}

class Field {
  late double limitXleft;
  late double limitXright;
  late double limitXmiddle;
  late double limitYbottom;
  late double limitYtop;
  late double limitYmiddle;
  late double sizeY;

  double lengthGoal = 150;
  late double startGoal;
  late double endGoal;

  Field(BuildContext context){
    limitXleft = 30;
    limitXright = MediaQuery.of(context).size.width-27;
    limitXmiddle = MediaQuery.of(context).size.width/2;
    sizeY = MediaQuery.of(context).size.height;
    limitYtop = sizeY*0.076;
    limitYbottom = sizeY-(sizeY*0.115);
    limitYmiddle = sizeY/2;
    startGoal = limitXmiddle - lengthGoal/2;
    endGoal = startGoal + lengthGoal;
  }
}

class Ball {
  double x;
  double y;
  double r = 6;
  double dx;
  double dy;
  double ax = 0.1;
  double ay = 0.1;
  Ball(this.x, this.y, this.dx, this.dy);
}

class GravityCenter {
  late double x;
  late double y;
  late double startY;
  late double startX;
  late int position;
  GravityCenter(this.x, this.y, this.position){
    startY = y;
    startX = x;
  }

  invertYAxis(Field field, bool isMyPlayer){
    if(!isMyPlayer){
      double invert = (y-field.limitYtop);
      y = field.limitYbottom - invert;
      startY = y;
    }
  }

  updateGravityCenter(GravityTeam gravityTeam){
    if(position != 0){
      y = (gravityTeam.gravityCenter.y - gravityTeam.gravityCenter.startY) + startY;
    }
  }

}
class GravityTeam{
  late GravityCenter gravityCenter;

  GravityTeam(Field field, bool isMyPlayer){
    //Centro de gravidade do time
    gravityCenter = GravityCenter(field.limitXmiddle, field.limitYtop+160, -1);

    gravityCenter.invertYAxis(field, isMyPlayer);
  }

  moveGravityCenter(Ball ball, Field field, bool isMyPlayer){

    double distance = (ball.y - gravityCenter.y) / (ball.y - gravityCenter.y).abs();
    double gravityLimitSup = field.limitYtop * 1.3;
    double gravityLimitInf = field.limitYbottom * 0.9;
    if (isMyPlayer){
      gravityLimitSup = field.limitYtop * 1.2;
      gravityLimitInf = field.limitYbottom * 0.7;
    }

    double velocity = 3;
    if(gravityCenter.y >= gravityLimitSup && gravityCenter.y <= gravityLimitInf){
      gravityCenter.y += velocity * distance;
    }else if(gravityCenter.y < gravityLimitSup){
      gravityCenter.y += velocity;
    }else if(gravityCenter.y > gravityLimitInf){
      gravityCenter.y -= velocity;
    }

  }


}


class GravityPosition{
  late GravityCenter gravityCenter;

  GravityPosition(BuildContext context, int position, isMyPlayer){
    Field field = Field(context);

    if(position == 0){
      gravityCenter = GravityCenter(field.limitXmiddle, field.limitYtop+30, position);
    }else if(position == 1){
      gravityCenter = GravityCenter(field.limitXleft+30, field.limitYtop+100, position);
    }else if(position == 2){
      gravityCenter = GravityCenter(field.limitXmiddle-30, field.limitYtop+100, position);
    }else if(position == 3){
      gravityCenter = GravityCenter(field.limitXmiddle+30, field.limitYtop+100, position);
    }else if(position == 4){
      gravityCenter = GravityCenter(field.limitXright-30, field.limitYtop+100, position);
    }
    else if(position == 5){
      gravityCenter = GravityCenter(field.limitXleft+30, field.limitYtop+180, position);
    }else if(position == 6){
      gravityCenter = GravityCenter(field.limitXmiddle-30, field.limitYtop+180, position);
    }else if(position == 7){
      gravityCenter = GravityCenter(field.limitXmiddle+30, field.limitYtop+180, position);
    }else if(position == 8){
      gravityCenter = GravityCenter(field.limitXright-30, field.limitYtop+180, position);
    }
    else if(position == 9){
      gravityCenter = GravityCenter(field.limitXmiddle-30, field.limitYtop+250, position);
    }else if(position == 10){
      gravityCenter = GravityCenter(field.limitXmiddle+30, field.limitYtop+250, position);
    }

    gravityCenter.invertYAxis(field, isMyPlayer);
  }




}
