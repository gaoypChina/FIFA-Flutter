import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/button_continue.dart';
import 'package:fifa/widgets/table_widget.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class FimCampeonato extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const FimCampeonato({Key? key}) : super(key: key);
  @override
  _FimCampeonatoState createState() => _FimCampeonatoState();
}

class _FimCampeonatoState extends State<FimCampeonato> {

  //late double _height, _width;
  My myClub = My();

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

                    const Text('Classificação Final',style:EstiloTextoBranco.text20),
                    const SizedBox(height: 8),

                    //TABELA
                    tabelaClassificacaoWidget(My().campeonatoID),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //Escudo
                        Image.asset('assets/clubs/${FIFAImages().imageLogo(myClub.clubName)}.png',height: 60,width: 60),

                        const SizedBox(width: 10),

                        //EXPECTATIVA
                        Column(
                          children: [
                            const Text('Expectativa:',style: EstiloTextoBranco.text14),
                            Text(myClub.getExpectativa().toString()+'º',style: EstiloTextoBranco.text30),
                          ],
                        ),

                        const Icon(Icons.arrow_right,size:40,color:Colors.white),

                        //CLASSIFICAÇÃO FINAL
                        Column(
                          children: [
                            const Text('Classificação',style: EstiloTextoBranco.text14),
                            Text(Classification(leagueIndex: myClub.campeonatoID).getClubPosition(myClub.clubID).toString()+'º',style: EstiloTextoBranco.text30),
                          ],
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