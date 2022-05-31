import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/database/save_games/basic_game_infos.dart';
import 'package:fifa/database/save_games/sql_game.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/translation.dart';
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


  List<BasicGameInfos> basicGameInfos = [];

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    checkSaves();
    super.initState();
  }
  checkSaves() async{

    basicGameInfos = [];
    for(int i=0; i<globalMaxPossibleSaves;i++){
      try {
        BasicGameInfos basicGameInfo = await SaveSQLGame().getGameFromDatabase(i);
        print(basicGameInfo.id.toString()+'ano: '+basicGameInfo.year.toString());
        basicGameInfos.add(basicGameInfo);
      }catch(e){
        //print('save $i don\'t exist');
      }
    }
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
                        for(int i=0; i<basicGameInfos.length;i++)
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
    BasicGameInfos saveInfo = basicGameInfos[gameSaveNumber];
    Club club = Club(index: saveInfo.myClubID);

    return GestureDetector(
      onTap: (){
        saveInfo.uploadData();
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
                        Text(saveInfo.year.toString(),style: EstiloTextoBranco.text14),
                        Text('${Translation(context).text.week}: '+saveInfo.week.toString(),style: EstiloTextoBranco.text14),
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