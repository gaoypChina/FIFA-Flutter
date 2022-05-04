import 'package:fifa/classes/image_class.dart';
import 'package:fifa/page_controller/save/save_infos.dart';
import 'package:fifa/pages/menu/b_home.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/popup/popup_ok_cancel.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class Save extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Save({Key? key}) : super(key: key);
  @override
  _SaveState createState() => _SaveState();
}

class _SaveState extends State<Save> {

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Container(
          decoration: Images().getWallpaperContainerDecoration(),
          child: Stack(
              children: [

                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(int i=0; i<7;i++)
                        save(i),
                    ],
                  ),
                ),

          //BOTAO DE VOLTAR
          returnButton(context),

              ]
          ),
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget save(int index){
    SaveInfos saveInfos = SaveInfos();

    return InkWell(
      onTap:(){
        popUpOkCancel(context: context, title: 'Deseja Salvar', content: 'Sim ou não?',function: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
        });
      },
      child: Container(
        color: AppColors().greyTransparent,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        child: Align(
          child: Container(
            width: 200,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left:40),
            child: Stack(
              children: [

                Image.asset(Images().getEscudo(saveInfos.clubName),height: 25,width: 25),

                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: const Icon(Icons.save,color: Colors.white),
                    ),
                    Column(
                      children: [
                        Text(saveInfos.clubName,style: EstiloTextoBranco.text14),
                        Text(saveInfos.ano.toString(),style: EstiloTextoBranco.text14),
                        Text('Semana: '+saveInfos.semana.toString(),style: EstiloTextoBranco.text14),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
}
}