import 'package:fifa/classes/data_graphics.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Future bottomSheetShowTitles(BuildContext context, String leagueName, List<ClassificationData> classificationData){
  List<int> championYear = [];

  for(ClassificationData data in classificationData)
  {
    if(data.position==1){
      championYear.add(data.year.toInt());
    }
  }
  championYear.sort((a, b) => a == championYear.reduce((x, y) => x > y ? x : y) ? 1 : b == championYear.reduce((x, y) => x > y ? x : y) ? -1 : a - b);

  return showModalBottomSheet(
      barrierColor: Colors.transparent,
      context: context, builder: (c){
    return SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Campeão ' + leagueName,style: EstiloTextoPreto.negrito16),
              const SizedBox(height: 8),
              Text(championYear.toString().replaceAll("[", "").replaceAll("]", ""),style: EstiloTextoPreto.text14),
              const SizedBox(height: 8),
            ],
          ),
        ));
  });
}