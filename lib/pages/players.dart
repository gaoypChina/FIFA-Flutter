import 'package:fifa/theme/textstyle.dart';

import 'package:flutter/material.dart';

class Players extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Players({Key? key}) : super(key: key);
  @override
  _PlayersState createState() => _PlayersState();
}

class _PlayersState extends State<Players> {

  //late double _height, _width;

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    //_height = MediaQuery.of(context).size.height;
    // bottomSize = MediaQuery.of(context).viewInsets.bottom; //=0 SEM O TECLADO
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
                  children: const [

                      SizedBox(height: 40),
                      Text('João', style: EstiloTextoBranco.text14),

                  ],
                )

              ]
          )
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

}