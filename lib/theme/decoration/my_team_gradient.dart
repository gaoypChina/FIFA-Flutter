import 'package:flutter/material.dart';


LinearGradient gradientMyTeam(bool isRight){
  if (isRight){
    return LinearGradient(
      colors: [Colors.transparent, Colors.teal[800]!, Colors.teal[700]!],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    );
  }else{
    return LinearGradient(
      colors: [Colors.transparent, Colors.teal[500]!, Colors.teal[700]!],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }
}

LinearGradient gradientTeam(Color color){
    return LinearGradient(
      colors: [Colors.transparent, color.withOpacity(0.5), color.withOpacity(0.7),],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    );
}