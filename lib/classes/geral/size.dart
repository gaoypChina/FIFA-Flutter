
import 'package:flutter/cupertino.dart';

class Sized{
  late BuildContext context;
  late double height;
  late double width;

  Sized(BuildContext context){
    width =  MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}