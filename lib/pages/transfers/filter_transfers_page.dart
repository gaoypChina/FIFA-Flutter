import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/countries/words.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/pages/transfers/controller/filter_players.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:flutter/material.dart';


class FilterTransfersPage extends StatefulWidget {
  final TransferParameters transferParameters;
  const FilterTransfersPage({Key? key, required this.transferParameters}) : super(key: key);

  @override
  State<FilterTransfersPage> createState() => _FilterTransfersPageState();
}

class _FilterTransfersPageState extends State<FilterTransfersPage> {

  late TransferParameters transferParameters;
  FilterTransfersController ageControl = FilterTransfersController(title: "Age", values: const RangeValues(18, 50));
  FilterTransfersController ovrControl = FilterTransfersController(title: "Overall", values: const RangeValues(30, 100));
  FilterTransfersController priceControl = FilterTransfersController(title: "Price", values: const RangeValues(0, 400));

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    transferParameters = widget.transferParameters;
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    My my = My();

    return Scaffold(
      body: Stack(
        children: [

          Images().getWallpaper(),

          Column(
            children: [

              backButtonText(context,'Filter Transfers Page'),

              button("País",
                  transferParameters.filteredCountry.isNotEmpty
                      ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: funcFlagsList(transferParameters.filteredCountry, 30, 40),
                      )
                      : const Icon(Icons.shield_outlined, color: Colors.white, size: 40),
                    (){
                      showModalBottomSheet(isScrollControlled: true,context: context,
                          builder: (context) {return filterByCountry(context);});
                },
              ),
              button("Liga",
                  transferParameters.filteredLeague.isNotEmpty
                      ? Images().getLeagueLogo(my.campeonatoName, 40,40)
                      : const Icon(Icons.shield_outlined, color: Colors.white, size: 40),
                  (){

                  },
              ),
              button("Time",
                  transferParameters.filteredTeam.isNotEmpty
                      ? Images().getEscudoWidget(my.clubName, 40,40)
                      : const Icon(Icons.shield_outlined, color: Colors.white, size: 40),
                (){
                  }
              ),

              chooseSlider(transferParameters.ageControl, (RangeValues newValue){transferParameters.ageControl.values = newValue;}),
              chooseSlider(transferParameters.ovrControl, (RangeValues newValue){transferParameters.ovrControl.values = newValue;}),
              chooseSlider(transferParameters.priceControl, (RangeValues newValue){transferParameters.priceControl.values = newValue;}),

              const Spacer(),
              customButtonContinue(
                  title: "Filter",
                  function: (){
                    Navigator.pop(context,transferParameters);
                  }
              ),
              const SizedBox(height: 8),

            ],
          ),


        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget button(String title, Widget imageWidget, Function() onTap){
    return Container(
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: PressableButton(
        onTap: (){
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              imageWidget,
              const SizedBox(width: 16),
              Text(title, style: EstiloTextoBranco.negrito22),
            ],
          ),
        ),
      ),
    );
  }
Widget chooseSlider(FilterTransfersController controller, Function(RangeValues newValue) onChanged){

    return Container(
      color: AppColors().greyTransparent,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.title, style: EstiloTextoBranco.negrito16),
              Text(controller.values.start.toStringAsFixed(0) + " - " + controller.values.end.toStringAsFixed(0), style: EstiloTextoBranco.text20),
            ],
          ),
          RangeSlider(
            values: controller.values,
            min: controller.min,
            max: controller.max,
            onChanged: (RangeValues newValue){
              setState(() {
                onChanged(newValue);
              });
            },
          ),

        ],
      ),
    );
}

  Widget filterByCountry(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(Translation(context).text.countryFilter,style: EstiloTextoPreto.negrito16),
          SizedBox(
            height: Sized(context).height/3,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 8, // Spacing between columns
                mainAxisSpacing: 8,
                childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 7),// Spacing between rows
              ),

              itemCount: globalCountryNames.length,
              itemBuilder: (BuildContext context, int index) {
                return countryRow(globalCountryNames[index]);
              },
            )
          ),
        ],
      ),
    );
  }
  Widget countryRow(String name){
    return PressableButton(
      onTap: (){
        Navigator.pop(context);
        transferParameters.filteredCountry = name;
        customToast(Translation(context).text.loading);
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            funcFlagsList(name, 25, 35),
            const SizedBox(width: 8),
            Expanded(
              child: Text(name,maxLines: 2,style: EstiloTextoPreto.text16),
            ),
          ],
        ),
      ),
    );
  }

}
