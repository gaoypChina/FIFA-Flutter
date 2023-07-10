import 'package:fifa/classes/image_class.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:flutter/material.dart';

class FilterTransfersController{
  late String title;
  late RangeValues values;
  late double min;
  late double max;

  FilterTransfersController({required this.title, required this.values}){
    min = values.start;
    max = values.end;
  }

  void updateValue(RangeValues newValues){
    values = newValues;
  }

}


class FilterTransfersPage extends StatefulWidget {
  const FilterTransfersPage({Key? key}) : super(key: key);

  @override
  State<FilterTransfersPage> createState() => _FilterTransfersPageState();
}

class _FilterTransfersPageState extends State<FilterTransfersPage> {

  FilterTransfersController ageControl = FilterTransfersController(title: "Age", values: const RangeValues(18, 50));
  FilterTransfersController ovrControl = FilterTransfersController(title: "Overall", values: const RangeValues(30, 100));
  FilterTransfersController priceControl = FilterTransfersController(title: "Price", values: const RangeValues(0, 400));

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

              chooseSlider(ageControl),
              chooseSlider(ovrControl),
              chooseSlider(priceControl),

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
Widget chooseSlider(FilterTransfersController controller){

    return Container(
      color: AppColors().greyTransparent,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(controller.title, style: EstiloTextoBranco.negrito16),
          RangeSlider(
            values: controller.values,
            min: controller.min,
            max: controller.max,
            onChanged: (RangeValues newValue){
              setState(() {
                controller.values = newValue;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Min: " + controller.values.start.toStringAsFixed(0), style: EstiloTextoBranco.text14),
              Text("Max: " + controller.values.end.toStringAsFixed(0), style: EstiloTextoBranco.text14),
            ],
          ),

        ],
      ),
    );
}
}
