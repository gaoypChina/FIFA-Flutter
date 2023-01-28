import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/player_basic.dart';
import 'package:fifa/functions/countries/words.dart';
import 'package:fifa/functions/countries/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

popUpCreatePlayer({required BuildContext context, required Club club, required Function()? function}){

  List<DropdownMenuItem<String>> finalResult = globalAllPositions.map((String dropDownStringItem) {
  return DropdownMenuItem<String>(
  value: dropDownStringItem,
  child: Text(dropDownStringItem),
  );
  }).toList();
  List<DropdownMenuItem<String>> finalResultCountries = globalCountryNames.map((String dropDownStringItem) {
    return DropdownMenuItem<String>(
      value: dropDownStringItem,
      child: Text(dropDownStringItem),
    );
  }).toList();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      PlayerBasicInfo playerBasicInfo = PlayerBasicInfo();
      // retorna um objeto do tipo Dialog
      return StatefulBuilder(
          builder: (context, Function setState) {
          return AlertDialog(
            title: Text(Translation(context).text.createPlayer,style: EstiloTextoPreto.text16),
            content: Form(
              key: _formKey,
              child: SizedBox(
                height: Sized(context).height*0.3,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Translation(context).text.name+": ", style:  EstiloTextoPreto.text14),
                      TextFormField(
                        validator: (value) => value!.isEmpty ? 'Valor vazio' : null,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(25), //max number characteres in Description
                        ],
                        onChanged: (value){
                          playerBasicInfo.name = value;
                        },
                      ),


                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: Column(
                              children: [
                                Text(Translation(context).text.position+": ", style:  EstiloTextoPreto.text14),
                                DropdownButton<String>(
                                  value: playerBasicInfo.position,
                                  items: finalResult,
                                  onChanged: (Object? value) {
                                    playerBasicInfo.position = value.toString().toUpperCase();
                                    setState((){});
                                  },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 16),
                          Flexible(
                            flex: 5,
                            child: Column(
                              children: [
                                Text(Translation(context).text.age+": ", style:  EstiloTextoPreto.text14),
                                TextFormField(
                                  validator: (value) => value!.isNotEmpty ? int.parse(value) < 16 || int.parse(value) > 44 ? 'Idade inválida' : null : null,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(2), //max number characteres in Description
                                  ],
                                  onChanged: (value){
                                    playerBasicInfo.age = int.parse(value);
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),

                          Flexible(
                            flex: 5,
                              child: Column(
                                children: [
                                  Text(Translation(context).text.overall+": ", style:  EstiloTextoPreto.text14),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2), //max number characteres in Description
                                    ],
                                    onChanged: (value){
                                      playerBasicInfo.overall = int.parse(value);
                                    },
                                  ),
                                ],
                              ),
                          ),

                        ],
                      ),



                      const SizedBox(height: 24),
                      Text(Translation(context).text.nationality+": ", style:  EstiloTextoPreto.text14),
                      Row(
                        children: [
                          funcFlagsList(playerBasicInfo.nationality, 30, 40),
                          const SizedBox(width: 4),
                          SizedBox(
                            width: 120,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: playerBasicInfo.nationality,
                              items: finalResultCountries,
                              onChanged: (Object? value) {
                                playerBasicInfo.nationality = value.toString();
                                setState((){});
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                  child: Text(Translation(context).text.cancel,style: EstiloTextoPreto.text16,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  }
              ),
              TextButton(
                  child: const Text("OK",style: EstiloTextoPreto.text16,),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      function!();
                      playerBasicInfo.clubID = club.index;
                      playerBasicInfo.playerID = globalJogadoresIndex.length;
                      playerBasicInfo.createNewPlayerToDatabase();
                      Navigator.of(context).pop();
                    }
                  }
              ),
            ],
          );
        }
      );
    },
  );


}