import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget dropDownButton({required String selectedYearStr, required List<String> possibleYears, required Function(String value) setStateFunc}){
  return                   Container(
    decoration: BoxDecoration(
      color:Colors.white, //background_color color of dropdown button
      border: Border.all(color: Colors.black38, width:2), //border of dropdown button
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 4),
      child: DropdownButton<String>(
        value: selectedYearStr,
        style: const TextStyle(fontSize: 18, color: Colors.white),
        iconEnabledColor: Colors.black, //Icon color
        underline: Container(), //empty line
        dropdownColor: Colors.white,
        items: possibleYears.map((value) {
          return DropdownMenuItem(
            child: Text(value,style: EstiloTextoPreto.text16),
            value: value,
          );
        }).toList(),
        onChanged: (value) {
          setStateFunc(value!);
        },
      ),
    ),
  );
}