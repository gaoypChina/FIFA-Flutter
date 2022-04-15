import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/pages/save/save.dart';
import 'package:fifa/pages/save/upload.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:flutter/material.dart';

class ChooseSave extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const ChooseSave({Key? key}) : super(key: key);
  @override
  _ChooseSaveState createState() => _ChooseSaveState();
}

class _ChooseSaveState extends State<ChooseSave> {

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Images().getWallpaper(),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  const SizedBox(height: 100),

                  Text('Pontos: ${My().scoreGame}',style:EstiloTextoBranco.text16),

                  const SizedBox(height: 10),
                  customButtonContinue(
                      title: 'Salvar',
                      function: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Save()));
                      }
                  ),

                  const SizedBox(height: 10),
                  customButtonContinue(
                      title: 'Carregar',
                      function: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Upload()));
                      }
                  ),

                  const SizedBox(height: 100),

                ],
              ),

          //BOTAO DE VOLTAR
          returnButton(context),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
}