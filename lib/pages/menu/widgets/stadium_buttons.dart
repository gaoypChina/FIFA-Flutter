import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/pages/home/b_home.dart';
import 'package:fifa/pages/negotiation/negotiation_list.dart';
import 'package:fifa/pages/save/choose_save.dart';
import 'package:fifa/pages/train/train.dart';
import 'package:flutter/material.dart';

Widget close(BuildContext context){
  return Container(
    alignment: Alignment.bottomLeft,
    child: GestureDetector(
        onTap:(){
          navigatorPush(context, const HomePage());
        },
        child: const Icon(Icons.close,color:Colors.red,size: 50)
    ),
  );
}

Widget negotiationButton(BuildContext context){
  return Container(
    alignment: Alignment.bottomRight,
    child: GestureDetector(
        onTap:(){
          navigatorPush(context, const NegotiationListPage());
        },
        child: const Icon(Icons.transfer_within_a_station,color:Colors.white,size: 50)
    ),
  );
}

Widget save(BuildContext context){
  return Container(
    alignment: Alignment.bottomRight,
    child: GestureDetector(
        onTap:(){
          navigatorPush(context, const ChooseSave());
        },
        child: const Icon(Icons.save,color:Colors.white,size: 50)
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