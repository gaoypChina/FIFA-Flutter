import 'package:fifa/classes/image_class.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:flutter/material.dart';

class FilterTransfersPage extends StatefulWidget {
  const FilterTransfersPage({Key? key}) : super(key: key);

  @override
  State<FilterTransfersPage> createState() => _FilterTransfersPageState();
}

class _FilterTransfersPageState extends State<FilterTransfersPage> {


  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
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
            children: [
              backButtonText(context,'Filter Transfers Page'),

              chooseSlider("Age", 0, 25),
              chooseSlider("Overall", 0, 25),
              chooseSlider("Price", 0, 25),

              customButtonContinue(
                  title: "Filter",
                  function: (){}
              ),

            ],
          ),


        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget chooseSlider(String title, int min, int max){

    return Container(
      color: AppColors().greyTransparent,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Column(
            children: [
              Text(title, style: EstiloTextoBranco.text20),

              Text("Min: " + min.toStringAsFixed(0), style: EstiloTextoBranco.text20),
              Text("Max: " + max.toStringAsFixed(0), style: EstiloTextoBranco.text20),
            ],
          ),
        ],
      ),
    );
}
}
