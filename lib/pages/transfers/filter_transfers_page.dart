import 'dart:async';

import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/countries/words.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/transfers/controller/filter_players.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:fifa/widgets/popup/popup_select_club_compare.dart';
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

    return Scaffold(
      body: Stack(
        children: [

          Images().getWallpaper(),

          Column(
            children: [

              backButtonText(context,'Filter Transfers Page'),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      button("Nacionalidade",
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
                      button("Time",
                          transferParameters.filteredTeam.isNotEmpty
                              ? Images().getEscudoWidget(transferParameters.filteredTeam, 40,40)
                              : const Icon(Icons.shield_outlined, color: Colors.white, size: 40),
                              (){
                                PopupSelectClub popupConfig = PopupSelectClub();
                                popUpSelectClub(originalContext: context, popupConfig: popupConfig);
                                Timer.periodic(const Duration(milliseconds: 100), (timer) {
                                  if (popupConfig.popupClosed) {
                                    setState((){});
                                    transferParameters.filteredTeam = popupConfig.newClub.name;
                                    transferParameters.filteredLeague = popupConfig.newClub.leagueName;
                                    timer.cancel();
                                  }
                                });
                          }
                      ),

                      chooseSlider(transferParameters.ageControl, (RangeValues newValue){transferParameters.ageControl.values = newValue;}, false),
                      chooseSlider(transferParameters.ovrControl, (RangeValues newValue){transferParameters.ovrControl.values = newValue;}, false),
                      chooseSlider(transferParameters.priceControl, (RangeValues newValue){transferParameters.priceControl.values = newValue;}, true),

                      filterPosition(),
                    ],
                  ),
                ),
              ),



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
  Widget filterPosition(){
    return Container(
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text("Position",style: EstiloTextoBranco.negrito16),
              ],
            ),
          ),
          Wrap(
              children: [
                for(String positionName in globalAllPositions)
                  positionsBox(position: positionName, transferParameters: transferParameters),
              ],
            ),

        ],
      ),
    );
  }
  Widget positionsBox({required String position, required TransferParameters transferParameters}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: GestureDetector(
        onTap: () {
          if (transferParameters.filteredPosition == position) {
            transferParameters.filteredPosition = "";
          } else {
            transferParameters.filteredPosition = position;
          }
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            color: transferParameters.filteredPosition == position
                ? Colors.green
                : Colors.black,
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(position, style: EstiloTextoBranco.text16),
          ),
        ),
      ),
    );
  }
  Widget button(String title, Widget imageWidget, Function() onTap){
    return Container(
      decoration: BoxDecoration(
        color: AppColors().greyTransparent,
        border: Border.all(color: AppColors().green, width: 1),
      ),
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
Widget chooseSlider(FilterTransfersController controller, Function(RangeValues newValue) onChanged, bool isPrice){
  double minValue = controller.values.start;
  double maxValue = controller.values.end;
  if(isPrice){
    minValue = controller.mapPriceScale(controller.values.start);
    maxValue = controller.mapPriceScale(controller.values.end);
  }
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
              Text(minValue.toStringAsFixed(isPrice ? 1 : 0) + " - " + maxValue.toStringAsFixed(isPrice ? 1 : 0), style: EstiloTextoBranco.text20),
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
