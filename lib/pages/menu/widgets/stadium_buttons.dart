import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/home/b_home.dart';
import 'package:fifa/pages/save/choose_save.dart';
import 'package:fifa/pages/train/train.dart';
import 'package:flutter/material.dart';

Widget close(BuildContext context){
  return Container(
    alignment: Alignment.bottomLeft,
    child: GestureDetector(
        onTap:(){
          Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage()));
        },
        child: const Icon(Icons.close,color:Colors.red,size: 50)
    ),
  );
}

Widget leagueLogo(){
  return
    //CAMPEONATO
    Container(
      margin: const EdgeInsets.only(right: 8),
      alignment: Alignment.topRight,
      child: Images().getMyActualCampeonatoLogo().isNotEmpty
          ? Image.asset(Images().getMyActualCampeonatoLogo(),height: 60,width: 60)
          : const SizedBox(height: 60,width: 60),
    );
}

Widget save(BuildContext context){
  return Container(
    alignment: Alignment.bottomRight,
    child: GestureDetector(
        onTap:(){
          Navigator.push(context,MaterialPageRoute(builder: (context) => const ChooseSave()));
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
          Navigator.push(context,MaterialPageRoute(builder: (context) => const TrainPlayersPage()));
        },
        child: const Icon(Icons.run_circle_outlined,color:Colors.white,size: 50)
    ),
  );
}