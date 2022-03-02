import 'package:fifa/classes/historic.dart';
import 'package:fifa/pages/historic/historic.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../global_variables.dart';

class HistoricMy extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const HistoricMy({Key? key}) : super(key: key);
  @override
  _HistoricMyState createState() => _HistoricMyState();
}

class _HistoricMyState extends State<HistoricMy> {


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

                    //TABELA
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for(int year=anoInicial;year<ano;year++)
                              yearRow(year),
                          ],
                        ),
                      ),
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
Widget yearRow(int year){

    HistoricClubYear myClubData = HistoricClubYear(year);

    return Row(
      children: [
        Text(year.toString(),style: EstiloTextoBranco.text16),
        Image.asset('assets/clubs/${FIFAImages().imageLogo(myClubData.clubName)}.png',height: 20,width: 20,),
        SizedBox(
          width: 150,
            child: Text(myClubData.clubName,style: EstiloTextoBranco.text14)
        ),
        Text('${myClubData.leagueName}: \n${myClubData.internationalLeagueName}: ',style: EstiloTextoBranco.text12),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text('${myClubData.position}º\nVazio',style: EstiloTextoBranco.text14),
        ),
      ],
    );
}
}