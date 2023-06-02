import 'package:fifa/classes/data_graphics.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget classificationContainer(int year, List<ClassificationData> dataClassificationList){
  try{
    var data = dataClassificationList.where((element) => element.year == year.toDouble());
    ClassificationData classificationData = data.first;
    if(classificationData.position == 1){
      return Container(width:30,color:Colors.amber,
          child: Text(classificationData.position.toString(),textAlign: TextAlign.center,style: EstiloTextoPreto.text14));
    }
    if(classificationData.position <= 2){
      return Container(width:30,color:Colors.lightBlueAccent,
          child: Text(classificationData.position.toString(),textAlign: TextAlign.center,style: EstiloTextoPreto.text14));
    }
    if(classificationData.position <= 4){
      return Container(width:30,color:Colors.black38,
          child: Text(classificationData.position.toString(),textAlign: TextAlign.center,style: EstiloTextoBranco.text14));
    }
    if(classificationData.position <= 8){
      return Container(width:30,color:Colors.black12,
          child: Text(classificationData.position.toString(),textAlign: TextAlign.center,style: EstiloTextoBranco.text14));
    }
    return SizedBox(width:30,child: Text(classificationData.position.toString(),textAlign: TextAlign.center,style: EstiloTextoBranco.text14));
  }catch(e){
    return Container(width:30,);
  }
}