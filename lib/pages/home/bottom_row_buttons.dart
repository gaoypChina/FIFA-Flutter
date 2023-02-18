import 'package:fifa/database/local_database/shared_preferences.dart';
import 'package:fifa/database/select_database.dart';
import 'package:fifa/pages/configuration/configuration.dart';
import 'package:fifa/pages/configuration/customize_players.dart';
import 'package:fifa/pages/tournament_mode/tournament.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

import '../../global_variables.dart';

Widget wHomeBottomRowButtons(BuildContext context, int clubID){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:[
      const DatabaseButton(),
      editClub(context, clubID),
      configurations(context),
      openTournament(context),
    ],
  );
}

class DatabaseButton extends StatefulWidget {
  const DatabaseButton({Key? key}) : super(key: key);
  @override
  State<DatabaseButton> createState() => _DatabaseButtonState();
}

class _DatabaseButtonState extends State<DatabaseButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() async{
        bool sucessLoadingDatabase = false;
        while(!sucessLoadingDatabase){
          globalSaveNumber++;
          if(globalSaveNumber == globalMaxSavesPermitted+1){
            globalSaveNumber=0;
          }
          await SharedPreferenceHelper().savesharedSaveNumber(globalSaveNumber);

          customToast('${Translation(context).text.loading} Database $globalSaveNumber...');
          try {
            await SelectDatabase().load();
            sucessLoadingDatabase = true;
          }catch(e){
            customToast('Erro no carregamento do Database $globalSaveNumber');
          }

        }

        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: decoratorHomeButtons(),
        child: Column(
          children: [
            const Icon(Icons.save,color:Colors.white,size:40),
            globalSaveNumber==0
                ? const Text('Database padrão',style: EstiloTextoBranco.text14)
                : Text('Database: '+globalSaveNumber.toString(),style: EstiloTextoBranco.text14),
          ],
        ),
      ),
    );
  }
}

Widget editClub(BuildContext context, int clubID){
  return
    GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomizePlayers(clubID: clubID)));
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: decoratorHomeButtons(),
        child: Column(
          children: [
            const Icon(Icons.edit,color:Colors.white,size:40),
            Text(Translation(context).text.editTeam,style: EstiloTextoBranco.text14)
          ],
        ),
      ),
    );
}

Widget configurations(BuildContext context){
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Configuration()));
    },
    child: Container(
      padding: const EdgeInsets.all(4),
      decoration: decoratorHomeButtons(),
      child: Column(
        children: [
          const Icon(Icons.miscellaneous_services,color:Colors.white,size:40),
          Text(Translation(context).text.configuration,style: EstiloTextoBranco.text14),
        ],
      ),
    ),
  );
}

Widget openTournament(BuildContext context){
  return
    GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Tournament()));
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: decoratorHomeButtons(),
        child: Column(
          children: const [
            Icon(Icons.gamepad,color:Colors.white,size:40),
            Text('Single Match',style: EstiloTextoBranco.text14)
          ],
        ),
      ),
    );
}

BoxDecoration decoratorHomeButtons(){
  return BoxDecoration(
    color: AppColors().greyTransparent,
    borderRadius: const BorderRadius.all(Radius.circular(5.0) ),
    border: Border.all(
      width: 1.0,
      color: Colors.lightGreenAccent,
    ),
  );
}