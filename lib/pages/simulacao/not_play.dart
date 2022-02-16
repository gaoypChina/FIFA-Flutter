import 'package:fifa/c_menu.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global/global_variables.dart';
import 'package:fifa/theme/button_style.dart';
import 'package:fifa/theme/table_widget.dart';
import 'package:fifa/theme/textstyle.dart';

import 'package:flutter/material.dart';

class NotPlay extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const NotPlay({Key? key}) : super(key: key);
  @override
  _NotPlayState createState() => _NotPlayState();
}

class _NotPlayState extends State<NotPlay> {

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
                    Text('Semana: '+semana.toString(),style: EstiloTextoBranco.text30),
                    const SizedBox(height: 10),

                    //TABELA
                    tabelaClassificacaoWidget(My().campeonatoID),


                    const Spacer(),
                    //VOLTAR
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child:  customButtonContinue(
                          title: 'CONTINUAR',
                          function: (){

                            semana++;

                            if(semanasJogosNacionais.contains(semana)) {
                              if(semana < League(index: My().campeonatoID).nClubs) {
                                rodada = semanasJogosNacionais.indexOf(semana)+1;
                              }
                            }

                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));
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