import 'package:fifa/global/images.dart';
import 'package:fifa/pages/historic/historic.dart';
import 'package:fifa/theme/button_style.dart';
import 'package:fifa/theme/textstyle.dart';

import 'package:flutter/material.dart';

class HistoricMy extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const HistoricMy({Key? key}) : super(key: key);
  @override
  _HistoricMyState createState() => _HistoricMyState();
}

class _HistoricMyState extends State<HistoricMy> {

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
                    const Text('Meu Histórico',style: EstiloTextoBranco.text22),
                    const SizedBox(height: 8),

                    Table(
                      columnWidths: const {
                        0: FractionColumnWidth(.1),
                        1: FractionColumnWidth(.05),
                        2: FractionColumnWidth(.2),
                        3: FractionColumnWidth(.3),
                        4: FractionColumnWidth(.35),
                      },
                      children: [

                        TableRow(
                          children: [
                            const Text('2022',style: EstiloTextoBranco.text16),
                            Image.asset('assets/clubs/${FIFAImages().imageLogo('Botafogo')}.png',height: 20,width: 20,),
                            const Text('Botafogo',style: EstiloTextoBranco.text16),
                            const Text('Brasileirão\nChampions League',style: EstiloTextoBranco.text16),
                            const Text('8''º\nQuartas de Final',style: EstiloTextoBranco.text16),
                          ]
                        ),

                      ],
                    ),

                    const Spacer(),
                    //VOLTAR
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child:  customButtonContinue(
                          title: 'PRÓXIMO',
                          function: (){
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Historic()));
                          }
                      ),
                    ),
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