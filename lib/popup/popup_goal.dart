import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

popUpGoal({required BuildContext context,required int milis, required Jogador scorer, required Function()? function}){

  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: const Text('GOAL',style: EstiloRisque.text22),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Column(
                  children: [
                      Row(
                        children: [
                          Images().getPlayerPictureWidget(scorer,40,40),
                          Text(scorer.name,style: EstiloTextoPreto.negrito16,)
                        ],
                      ),
                    Row(
                      children: [
                        Images().getPlayerPictureWidget(Jogador(index: 1),20,20),
                        Text(Jogador(index: 1).name,style: EstiloTextoPreto.text14,)
                      ],
                    ),
                  ],
                ),

                Images().getEscudoWidget(scorer.clubName,70,70),
              ],
            ),

            Text(milis.toString()+"'",style: EstiloRisque.text22),

          ],
        ),
        actions: <Widget>[
          TextButton(
              child: const Text("OK",style: EstiloTextoPreto.text16,),
              onPressed: (){
                function!();
                Navigator.of(context).pop();
              }
          ),
        ],
      );
    },
  );
}