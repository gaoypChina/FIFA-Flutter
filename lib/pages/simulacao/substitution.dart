import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/button_style.dart';
import 'package:fifa/theme/field.dart';
import 'package:fifa/theme/textstyle.dart';

import 'package:flutter/material.dart';
import '../../global/images.dart';

class Substitution extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Substitution({Key? key}) : super(key: key);
  @override
  _SubstitutionState createState() => _SubstitutionState();
}

class _SubstitutionState extends State<Substitution> {

  //late double _height, _width;

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    //_height = MediaQuery.of(context).size.height;
    return WillPopScope(//IF GO BACK TO PREVIOUS PAGE
      onWillPop: () async{
        return true;
      },
      child: Scaffold(

          resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
          body:  Stack(
              children: [

                Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

                Column(
                  children: [

                    const SizedBox(height: 40),
                    const Text('Substituição',style: EstiloTextoBranco.text30),

                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        //Estádio
                        Image.asset('assets/clubs/${FIFAImages().imageLogo(My().clubName)}0.jpg',height: 420,width: double.infinity,fit:BoxFit.fill),

                        fieldGameplay442(My().clubID),

                      ],
                    ),

                    const Spacer(),
                    //VOLTAR
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child:  customButtonContinue(
                          title: 'VOLTAR',
                          function: (){
                            Navigator.pop(context);
                          }
                      ),
                    ),


                  ],
                ),

              ]
          )
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////


}