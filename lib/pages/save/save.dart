import 'package:fifa/classes/save_infos.dart';
import 'package:fifa/pages/menu/b_home.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/popup/popup_ok_cancel.dart';
import 'package:fifa/widgets/button_return.dart';
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const SizedBox(height: 40),

                    for(int i=0; i<7;i++)
                      save(i),
                  ],
                ),

          //BOTAO DE VOLTAR
          returnButton(context),

              ]
          )
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget save(int index){
    SaveInfos saveInfos = SaveInfos();

    return InkWell(
      onTap:(){
        popUpOkCancelar(context: context, title: 'Deseja Salvar', content: 'Sim ou não?',function: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          children: [

            Image.asset('assets/clubs/${FIFAImages().imageLogo(saveInfos.clubName)}.png',height: 25,width: 25),

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
    );
}
}