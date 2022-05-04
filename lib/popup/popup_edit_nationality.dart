import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/player_basic.dart';
import 'package:fifa/classes/words.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

import '../classes/jogador.dart';
import '../global_variables.dart';

popUpEditNationality({required BuildContext context, required Jogador player, required Function()? function}){

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
      // retorna um objeto do tipo Dialog
      return StatefulBuilder(
          builder: (context, Function setState) {
            return AlertDialog(
              title: Text(Translation(context).text.editPlayer,style: EstiloTextoPreto.text16),
              content: Form(
                key: _formKey,
                child: SizedBox(
                  height: Sized(context).height/3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(Translation(context).text.nationality+": ", style:  EstiloTextoPreto.text14),
                      Row(
                        children: [
                          funcFlagsList(player.nationality, 30, 40),
                          const SizedBox(width: 4),
                          SizedBox(
                            width: 120,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: globalCountryNames.contains(player.nationality) ? player.nationality:  'Brazil',
                              items: finalResultCountries,
                              onChanged: (Object? value) {
                                player.nationality = value.toString();
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
                        globalJogadoresNationality[player.index] = player.nationality.toString();
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