import 'package:fifa/pages/menu/b_home.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Upload({Key? key}) : super(key: key);
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {

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
                      upload(i),

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
  Widget upload(int index){
    String clubName = 'Botafogo';
    int semana = 3;

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          children: [

            Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName)}.png',height: 25,width: 25),

            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: const Icon(Icons.upload,color: Colors.white),
                ),
                Column(
                  children: [
                    Text(clubName,style: EstiloTextoBranco.text14),
                    const Text('2028',style: EstiloTextoBranco.text14),
                    Text('Semana: '+semana.toString(),style: EstiloTextoBranco.text14),
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