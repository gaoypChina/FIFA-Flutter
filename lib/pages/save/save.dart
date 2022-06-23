import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/page_controller/save/save_controller.dart';
import 'package:fifa/pages/menu/b_home.dart';
import 'package:fifa/popup/popup_ok_cancel.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:flutter/material.dart';

class Save extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Save({Key? key}) : super(key: key);
  @override
  _SaveState createState() => _SaveState();
}

class _SaveState extends State<Save> {

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
      //ADD SAVE
      floatingActionButton: floatingButton(),

        body:  Container(
          decoration: Images().getWallpaperContainerDecoration(),
          child: Stack(
              children: [

                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(Translation(context).text.save,style: EstiloTextoBranco.text30),
                      Expanded(child: Column(children: [
                        for(int i=0; i<saveController.basicGameInfos.length;i++)
                          save(i),
                      ],)),

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
  Widget floatingButton(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: FloatingActionButton(
          child: const Icon(Icons.plus_one),
          onPressed: () async{
            if(saveController.basicGameInfos.length < globalMaxPossibleSaves) {
              //Salva até 10 jogos
              await saveController.saveData(saveController.basicGameInfos.length);
              updateLayout();
            }else{
              customToast('Limite atingido');
            }
          }),
    );
  }

Widget save(int gameSaveNumber) {
    saveController.getIndividualGameSaveInfos(gameSaveNumber);
  Club club = Club(index: saveController.basicGameInfo.myClubID);

  return InkWell(
    onLongPress: (){
      popUpOkCancel(
          context: context,
          title: Translation(context).text.delete,
          content: '',
          function: () async{
            await saveController.deleteData(gameSaveNumber);
            updateLayout();
          });
    },
      onTap:(){
        popUpOkCancel(
            context: context,
            title: Translation(context).text.wantsTosaveFile,
            content: '',
            function: () async{
              await saveController.updateData(gameSaveNumber);
              updateLayout();
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

                Image.asset(Images().getEscudo(club.name),height: 25,width: 25),

                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: const Icon(Icons.save,color: Colors.white),
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