import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/page_controller/save/save_controller.dart';
import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Upload({Key? key}) : super(key: key);
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {

  SaveController saveController = SaveController();

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    updateLayout();
    super.initState();
  }
  updateLayout() async{
    await saveController.getSaves();
    setState((){});
  }

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

                      Text(Translation(context).text.load,style: EstiloTextoBranco.text30),
                      Expanded(child: Column(children: [
                        for(int i=0; i<saveController.basicGameInfos.length;i++)
                          upload(i),
                      ],))

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
  Widget upload(int gameSaveNumber){
    saveController.getIndividualGameSaveInfos(gameSaveNumber);
    Club club = Club(index: saveController.basicGameInfo.myClubID);

    return GestureDetector(
      onTap: (){
        saveController.getData(gameSaveNumber);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Menu()));
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

                Image.asset(Images().getEscudo(club.name),height: 25,width: 25),

                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: const Icon(Icons.upload,color: Colors.white),
                    ),
                    Column(
                      children: [
                        Text(club.name,style: EstiloTextoBranco.text14),
                        Text(saveController.basicGameInfo.year.toString(),style: EstiloTextoBranco.text14),
                        Text('${Translation(context).text.week}: '+saveController.basicGameInfo.week.toString(),style: EstiloTextoBranco.text14),
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