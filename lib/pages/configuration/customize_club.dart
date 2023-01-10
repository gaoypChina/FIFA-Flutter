import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/popup/poup_edit.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:fifa/widgets/kits_crests/uniforme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CustomizeClub extends StatefulWidget {
  const CustomizeClub({Key? key}) : super(key: key);

  @override
  State<CustomizeClub> createState() => _CustomizeClubState();
}

class _CustomizeClubState extends State<CustomizeClub> {

  String clubName = My().clubName;
  late UniformCustom uniformCustom;

  Color pickerColor = const Color(0xff443a49);

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    uniformCustom = UniformCustom(clubName,0.6);
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          Images().getWallpaper(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              backButtonText(context,'Customize Club'),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        popupEdit(
                            context: context,
                            title: 'Nome do Time',
                            variable: clubName,
                            isStringType: true,
                            maxNcharacters: 30,
                            functionOK: (value){
                              clubName = value;
                              setState((){});
                            });
                      },
                      child: Row(
                        children: [
                          const Text('Nome do Time: ',style: EstiloTextoBranco.text16),
                          Text(clubName,style: EstiloTextoBranco.underline16),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    const SizedBox(height: 16),
                    chooseColorRow('Cor Primária', true),
                    chooseColorRow('Cor Secundária', false),
                    const SizedBox(height: 16),
                    const Text('Escolha o tipo de uniforme',style: EstiloTextoBranco.text16),
                  ],
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  typesKit(uniformCustom.clubPattern.stripes2),
                  typesKit(uniformCustom.clubPattern.stripes3),
                  typesKit(uniformCustom.clubPattern.stripes4),
                  typesKit(uniformCustom.clubPattern.stripesThin),
                  typesKit(uniformCustom.clubPattern.stripesTricolor),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  typesKit(uniformCustom.clubPattern.oneHorStripe),
                  typesKit(uniformCustom.clubPattern.oneVertStripe),
                  typesKit(uniformCustom.clubPattern.diagonal),
                  typesKit(uniformCustom.clubPattern.diagonalInv),
                  typesKit(uniformCustom.clubPattern.monaco),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  typesKit(uniformCustom.clubPattern.horStripes2),
                  typesKit(uniformCustom.clubPattern.horStripes3),
                  typesKit(uniformCustom.clubPattern.horStripes4),
                  typesKit(uniformCustom.clubPattern.horStripesThin),
                  typesKit(uniformCustom.clubPattern.dividedHor),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    typesKit(uniformCustom.clubPattern.sp),
                    typesKit(uniformCustom.clubPattern.sleeves),
                    typesKit(uniformCustom.clubPattern.solid),
                    typesKit(uniformCustom.clubPattern.solid2),
                    typesKit(uniformCustom.clubPattern.solid3),

              ]),


              Center(
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors().greyTransparent,
                    border:  Border.all(color: Colors.white, width:1),
                  ),
                  child: Images().getEscudoWidget(clubName,120,120),
                ),
              ),

              const Center(child: Icon(Icons.camera_alt,size: 40,color: Colors.white)),


            ],
          ),


        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget chooseColorRow(String title, bool isPrimaryColor){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: GestureDetector(
        onTap:(){popupColorPicker(isPrimaryColor: isPrimaryColor);},
        child: Row(
          children: [
            SizedBox(width:120, child: Text(title,style: EstiloTextoBranco.underline16)),

            const SizedBox(width: 8),
            Container(
              height: 20, width: 20,
              decoration: BoxDecoration(
                color: isPrimaryColor ? uniformCustom.clubColors.primaryColor : uniformCustom.clubColors.secondColor,
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
    );

  }
  popupColorPicker({required bool isPrimaryColor}){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: colorPicker(isPrimaryColor: isPrimaryColor),
          actions: [
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }
  Widget colorPicker({required bool isPrimaryColor}){// create some values
    return ColorPicker(
      pickerColor: isPrimaryColor ? uniformCustom.clubColors.primaryColor : uniformCustom.clubColors.secondColor,
      onColorChanged: isPrimaryColor ? changeColor1 : changeColor2,
    );
  }
// ValueChanged<Color> callback
  void changeColor1(Color color) {
    setState(() {
      uniformCustom.clubColors.primaryColor =  color;
    });
  }
  void changeColor2(Color color) {
    setState(() {
      uniformCustom.clubColors.secondColor =  color;
      uniformCustom.clubColors.thirdColor =  color;
    });
  }

  Widget typesKit(String pattern){
    uniformCustom.setDefinitions(pattern);
    return GestureDetector(
      onTap: (){
        ClubDetails clubDetails = ClubDetails();
        clubDetails.map[clubName][1] = pattern;
        uniformCustom.clubDetails = clubDetails;
        setState((){});
      },
      child: Container(
        padding: const EdgeInsets.all(4.0),
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: uniformCustom.compareLinearGradient(pattern)
              ? Colors.green
              : AppColors().greyTransparent,
          border: Border.all(width: 1.0, color: Colors.white)
        ),
        child: uniformCustom.kit(),
      ),
    );
}



}
