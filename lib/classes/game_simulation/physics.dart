
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/values/club_details.dart';
import 'package:flutter/material.dart';

class Match{
  int goal1 = 0;
  int goal2 = 0;
  int ticks = 0;
  int seconds = 0;
  int minutes = 0;
  My my = My();
  Jogador lastTouch = Jogador(index: 0);

  int ballPossesionTime1 = 0;

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
  }
  endTime(){
    ticks = 0;
    seconds = 0;
    minutes = 90;
  }
}

class Circle {
  double x;
  double y;
  double r = 15;
  late double dx;
  late double dy;
  ClubColors colors;
  LinearGradient gradient;
  Jogador player;
  int touchs = 0;
  int passesRight = 0;
  int passesWrong = 0;
  int goals = 0;
  int assists = 0;
  Circle(this.x, this.y, this.colors, this.gradient, this.player){
    dx = (player.overallDynamic^3).toDouble()/50;
    dy = (player.overallDynamic^3).toDouble()/50;
  }
}

class Field {
  late double limitXleft;
  late double limitXright;
  late double limitXmiddle;
  late double limitYbottom;
  late double limitYtop;
  late double limitYmiddle;

  double lengthGoal = 150;
  late double startGoal;

  Field(BuildContext context){
    limitXleft = 30;
    limitXright = MediaQuery.of(context).size.width-27;
    limitXmiddle = MediaQuery.of(context).size.width/2;
    limitYtop = 57;
    limitYbottom = MediaQuery.of(context).size.height-142;
    limitYmiddle = MediaQuery.of(context).size.height/2;
    startGoal = limitXmiddle - lengthGoal/2;
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
