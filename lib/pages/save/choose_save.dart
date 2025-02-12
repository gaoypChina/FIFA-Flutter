import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/home/choose_team.dart';
import 'package:fifa/pages/save/controller/save_controller.dart';
import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/widgets/button/button_border_green.dart';
import 'package:fifa/widgets/popup/popup_ok_cancel.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:flutter/material.dart';

class ChooseSave extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const ChooseSave({Key? key}) : super(key: key);
  @override
  _ChooseSaveState createState() => _ChooseSaveState();
}

class _ChooseSaveState extends State<ChooseSave> {

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

        body:  Stack(
            children: [
              Container(
                decoration: Images().getWallpaperContainerDecoration(),
                child: Column(
                  children: [

                    backButtonText(context, 'Salvar', true),

                    Expanded(child:
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: saveController.basicGameInfos.length,
                        itemBuilder: (context, index) {
                          return saveRow(index);
                        },
                      ),
                    ),

                  ],
                ),
              ),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget floatingButton(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: FloatingActionButton(
          backgroundColor: AppColors().greyTransparent,
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

  Widget saveRow(int gameSaveNumber) {
    saveController.getIndividualGameSaveInfos(gameSaveNumber);
    Club club = Club(index: saveController.basicGameInfo.myClubID);

    return GestureDetector(
      onTap:(){
        //SALVAR
        popUpOkCancel(
            context: context,
            title: Translation(context).text.wantsTosaveFile,
            content: '',
            function: () async{
              await saveController.updateData(gameSaveNumber);
              updateLayout();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ChooseTeam()));
            });
      },
      child: Container(
        width: Sized(context).width,
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors().greyTransparent,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            //DELETAR
            GestureDetector(
              onTap: (){
                popUpOkCancel(
                    context: context,
                    title: Translation(context).text.delete,
                    content: '',
                    function: () async{
                      await saveController.deleteData(gameSaveNumber);
                      updateLayout();
                    });
              },
              child: Container(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: const Icon(Icons.close,color: Colors.white,size: 35),
              ),
            ),
            const SizedBox(width: 10),

            Stack(
              children: [
                Images().getEscudoWidget(club.name,50,50),
                Container(
                  margin: const EdgeInsets.only(top:25.0,left:25),
                  child: const Icon(Icons.save,color: Colors.white,size: 30,),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(club.name,style: EstiloTextoBranco.negrito16),
                Text(saveController.basicGameInfo.year.toString(),style: EstiloTextoBranco.text14),
                Text('${Translation(context).text.week}: '+saveController.basicGameInfo.week.toString(),style: EstiloTextoBranco.text14),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: (){
                saveController.getData(gameSaveNumber);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Menu()));
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: decorationGreen(),
                  child: const Icon(Icons.upload,color: Colors.white,size: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }


}