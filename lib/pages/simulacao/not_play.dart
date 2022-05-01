import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/simulate/simulate_functions.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/simulacao/end_year.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/pages/table/table_widget.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class NotPlay extends StatefulWidget {
  const NotPlay({Key? key}) : super(key: key);
  @override
  _NotPlayState createState() => _NotPlayState();
}

class _NotPlayState extends State<NotPlay> {

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    String weekName = Semana(semana).semanaAlternativeStr;

    return Scaffold(
        body:  Stack(
            children: [

              Images().getWallpaper(),

              Column(
                children: [

                  const SizedBox(height: 40),
                  Text('${Translation(context).text.week}: '+weekName,style: EstiloTextoBranco.text30),
                  const SizedBox(height: 10),

                  //TABELA
                  tabelaClassificacaoWidget(My().campeonatoID),

                  const Spacer(),
                  //VOLTAR
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child:  customButtonContinue(
                        title: Translation(context).text.nextMatchWeek,
                        function: (){
                          onContinueButton();
                        }
                    ),
                  ),


                ],
              ),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
onContinueButton(){

  //SIMULA JOGOS
  Simulate().simulateWeek();

  if(semana >= globalUltimaSemana){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EndYear()));
  }else{
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));
  }
}

}
