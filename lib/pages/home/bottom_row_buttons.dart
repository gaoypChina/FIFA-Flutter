import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/database/local_database/shared_preferences.dart';
import 'package:fifa/database/select_database.dart';
import 'package:fifa/pages/configuration/configuration.dart';
import 'package:fifa/pages/configuration/customize_players.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

import '../../global_variables.dart';

class HomeBottomRowButtons extends StatelessWidget {
  final BuildContext context;
  final int clubID;
  final VoidCallback refreshCallback;
  const HomeBottomRowButtons({
    Key? key, // Add the key parameter
    required this.context,
    required this.clubID,
    required this.refreshCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        SizedBox(width: Sized(context).width*0.24,
            child: const DatabaseButton()
        ),
        SizedBox(width: Sized(context).width*0.24,
            child: editClub(context, clubID)
        ),
        SizedBox(width: Sized(context).width*0.24,
            child: ConfigurationButton(refreshCallback: refreshCallback)
        ),
      ],
    );
  }
}


class DatabaseButton extends StatefulWidget {
  const DatabaseButton({Key? key}) : super(key: key);
  @override
  State<DatabaseButton> createState() => _DatabaseButtonState();
}

class _DatabaseButtonState extends State<DatabaseButton> {
  @override
  Widget build(BuildContext context) {
    return
    Material(
    color: Colors.transparent,
    child: InkWell(
    customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    onTap: () async{
      bool sucessLoadingDatabase = false;
      while(!sucessLoadingDatabase){
        globalSaveNumber++;
      if(globalSaveNumber == globalMaxSavesPermitted+1){
        globalSaveNumber=0;
      }
      await SharedPreferenceHelper().savesharedSaveNumber(globalSaveNumber);

      customToast('${Translation(context).text.loading} Database $globalSaveNumber...');

        await SelectDatabase().load();
        sucessLoadingDatabase = true;
      }

    setState(() {});
    },
    child: Container(
        padding: const EdgeInsets.all(4),
        decoration: decoratorHomeButtons(),
        child: Column(
          children: [
            const Icon(Icons.file_upload_outlined,color:Colors.white,size:40),
            globalSaveNumber==0
                ? const Text('Database: 0',style: EstiloRajdhani.button)
                : Text('Database: ' + globalSaveNumber.toString(),style: EstiloRajdhani.button),
          ],
        ),
      ),
    ));
  }
}

Widget editClub(BuildContext context, int clubID){
  return
      Material(
        color: Colors.transparent,
        child: InkWell(
        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomizePlayers(clubID: clubID)));
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: decoratorHomeButtons(),
          child: Column(
            children: [
              const Icon(Icons.edit,color:Colors.white,size:40),
              Text(Translation(context).text.editTeam,style: EstiloRajdhani.button)
            ],
          ),
        ),
      ));
}


class ConfigurationButton extends StatelessWidget {
  final VoidCallback refreshCallback;
  const ConfigurationButton({Key? key, required this.refreshCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onTap: () async{
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Configuration())).then((value) => refreshCallback());
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: decoratorHomeButtons(),
          child: Column(
            children: [
              const Icon(Icons.miscellaneous_services,color:Colors.white,size:40),
              Text(Translation(context).text.configuration,style: EstiloRajdhani.button),
            ],
          ),
        ),
      ),
    );
  }
}


BoxDecoration decoratorHomeButtons(){
  return BoxDecoration(
    color: AppColors().greyTransparent,
    borderRadius: const BorderRadius.all(Radius.circular(5.0) ),
    border: Border.all(
      width: 1.0,
      color: AppColors().green,
    ),
  );
}