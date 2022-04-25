import 'package:fifa/classes/image_class.dart';
import 'package:fifa/page_controller/save/upload_infos.dart';
import 'package:fifa/pages/menu/b_home.dart';
import 'package:fifa/theme/colors.dart';
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
    return Scaffold(

        body:  Stack(
            children: [

              Images().getWallpaper(),

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
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget upload(int index){
    UploadInfos uploadInfos = UploadInfos();

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
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

                Image.asset(Images().getEscudo(uploadInfos.clubName),height: 25,width: 25),

                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: const Icon(Icons.upload,color: Colors.white),
                    ),
                    Column(
                      children: [
                        Text(uploadInfos.clubName,style: EstiloTextoBranco.text14),
                        const Text('2028',style: EstiloTextoBranco.text14),
                        Text('Semana: '+uploadInfos.semana.toString(),style: EstiloTextoBranco.text14),
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