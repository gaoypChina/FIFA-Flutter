import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/widgets/popup/poup_edit.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/kits_crests/uniforme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CustomizeClub extends StatefulWidget {
  final String clubName;
  const CustomizeClub({Key? key, required this.clubName}) : super(key: key);

  @override
  State<CustomizeClub> createState() => _CustomizeClubState();
}

class _CustomizeClubState extends State<CustomizeClub> {

  String clubName = "";
  late UniformCustom uniformCustom;

  Color pickerColor = const Color(0xff443a49);

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    clubName =  widget.clubName;
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                backButtonText(context, 'Customize Club'),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Container(
                          color: AppColors().greyTransparent,
                          child: Column(
                            children: [
                              editClubName(),
                              const SizedBox(height: 8),
                              chooseColorRow('Cor Primária', true),
                              chooseColorRow('Cor Secundária', false),
                            ],
                          )
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),

                Container(
                    color: AppColors().greyTransparent,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Escolha o tipo de uniforme',style: EstiloTextoBranco.negrito16),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            typesKit(uniformCustom.clubPattern.stripes2),
                            typesKit(uniformCustom.clubPattern.stripes3),
                            typesKit(uniformCustom.clubPattern.stripes4),
                            typesKit(uniformCustom.clubPattern.sp),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            typesKit(uniformCustom.clubPattern.oneHorStripe),
                            typesKit(uniformCustom.clubPattern.oneVertStripe),
                            typesKit(uniformCustom.clubPattern.diagonal),
                            typesKit(uniformCustom.clubPattern.diagonalInv),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            typesKit(uniformCustom.clubPattern.horStripes2),
                            typesKit(uniformCustom.clubPattern.horStripes3),
                            typesKit(uniformCustom.clubPattern.horStripes4),
                            typesKit(uniformCustom.clubPattern.horStripesThin),
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              typesKit(uniformCustom.clubPattern.sleeves),
                              typesKit(uniformCustom.clubPattern.solid),
                              typesKit(uniformCustom.clubPattern.solid2),
                              typesKit(uniformCustom.clubPattern.solid3),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              typesKit(uniformCustom.clubPattern.stripesThin),
                              typesKit(uniformCustom.clubPattern.stripesTricolor),
                              typesKit(uniformCustom.clubPattern.monaco),
                              typesKit(uniformCustom.clubPattern.dividedHor),
                            ]),
                      ],
                    )
                ),

                const SizedBox(height: 8),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors().greyTransparent,
                          border:  Border.all(color: Colors.white, width:1),
                        ),
                        child: Images().getEscudoWidget(clubName,110,110),
                      ),
                    ),
                    Container(margin: EdgeInsets.only(top:90, left: 40+Sized(context).width*0.5),
                        child: const Icon(Icons.camera_alt,size: 50,color: Colors.white)),
                  ],
                ),



              ],
            ),
          ),


        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget editClubName(){
    return GestureDetector(
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
      child: Container(
        color: AppColors().greyTransparent,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Row(
          children: [
            const Icon(Icons.edit, color: Colors.white),
            const SizedBox(width: 4),
            const Text('Nome do Time: ',style: EstiloTextoBranco.negrito16),
            Text(clubName,style: EstiloTextoBranco.text20),
          ],
        ),
      ),
    );
  }
  Widget chooseColorRow(String title, bool isPrimaryColor){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4),
      child: GestureDetector(
        onTap:(){popupColorPicker(isPrimaryColor: isPrimaryColor);},
        child: Row(
          children: [
            const Icon(Icons.edit, color: Colors.white),
            const SizedBox(width: 4),
            SizedBox(width:120, child: Text(title,style: EstiloTextoBranco.negrito16)),

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
        ),
        child: uniformCustom.kit(),
      ),
    );
}



}
