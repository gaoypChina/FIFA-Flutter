import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/pages/home/homepage.dart';
import 'package:fifa/pages/negotiation/negotiation_list.dart';
import 'package:fifa/pages/save/choose_save.dart';
import 'package:fifa/pages/train/train.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:flutter/material.dart';

Widget close(BuildContext context){
  return Container(
    alignment: Alignment.bottomLeft,
    child: PressableButton(
        onTap:(){
          navigatorPush(context, const HomePage());
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.close, color:Colors.red,size: 32),
        )
    ),
  );
}

Widget negotiationButton(BuildContext context){
  return Container(
    alignment: Alignment.bottomRight,
    child: PressableButton(
        onTap:(){
          navigatorPush(context, const NegotiationListPage());
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.transfer_within_a_station,color:Colors.white,size: 32),
        )
    ),
  );
}

Widget save(BuildContext context){
  return Container(
    alignment: Alignment.bottomRight,
    child: PressableButton(
        onTap:(){
          navigatorPush(context, const ChooseSave());
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.save,color:Colors.white,size: 32),
        )
    ),
  );
}

Widget train(BuildContext context){
  return Container(
    alignment: Alignment.topLeft,
    child: GestureDetector(
        onTap:(){
          navigatorPush(context, const TrainPlayersPage());
        },
        child: const Icon(Icons.run_circle_outlined,color:Colors.white,size: 50)
    ),
  );
}