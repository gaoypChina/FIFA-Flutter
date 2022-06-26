import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/save/save.dart';
import 'package:fifa/pages/save/upload.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:flutter/material.dart';

class ChooseSave extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const ChooseSave({Key? key}) : super(key: key);
  @override
  _ChooseSaveState createState() => _ChooseSaveState();
}

class _ChooseSaveState extends State<ChooseSave> {

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:  Stack(
            children: [
              Container(
                decoration: Images().getWallpaperContainerDecoration(),
                child: Column(
                  children: [
                    backButtonText(context, 'Salvar'),

                    const SizedBox(height: 100),
                    customButtonContinue(
                        title: Translation(context).text.save,
                        function: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Save()));
                        }
                    ),

                    const SizedBox(height: 100),
                    customButtonContinue(
                        title: Translation(context).text.load,
                        function: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Upload()));
                        }
                    ),

                    const SizedBox(height: 100),

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
}