import 'package:fifa/classes/expectativa.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/functions/change_club_control.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';


popUpAskMoney({required BuildContext context, required Expectativa expectativa, required double overall, required Function()? functionSetState}){
  double sliderMoneyValue = 0;
  int originalExpectation = expectativa.expectativaNacional;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('How much money would you like to receive?',style: EstiloTextoPreto.text16),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('\$'+sliderMoneyValue.toStringAsFixed(2),style: EstiloTextoPreto.text16),

                const Text('Nova Expectativa:',style: EstiloTextoPreto.text16),
                Row(
                  children: [
                    Image.asset(Images().getMyLeagueLogo(),height: 25,width: 25),
                    Text(expectativa.expectativaNacional.toString()+'º',style: EstiloTextoPreto.text16),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(Images().getMyInternationalLeagueLogo(),height: 25,width: 25),
                    Text(expectativa.expInternacional.toString(),style: EstiloTextoPreto.text16),
                  ],
                ),


                Slider(
                  activeColor: Colors.green,
                  value: sliderMoneyValue,
                  min: 0,max: funcCalculateMoney(overall: overall)*2,
                  divisions: 5,
                  onChanged: (double value) {
                    for(int i=1;i<=5;i++){
                      if(value > funcCalculateMoney(overall: overall)*2*i/5){
                        expectativa.expectativaNacional = originalExpectation - i;
                        if(expectativa.expectativaNacional<1){
                          expectativa.expectativaNacional = 1;
                        }
                      }
                    }

                    if(expectativa.expectativaNacional != originalExpectation){
                      sliderMoneyValue = value;
                    }

                    if(value == 0){
                      expectativa.expectativaNacional = originalExpectation;
                    }

                      setState((){});
                  },
                ),



              ],
            ),
            actions: <Widget>[
              TextButton(
                  child: Text(Translation(context).text.cancel,style: EstiloTextoPreto.text16,),
                  onPressed: (){
                    expectativa.expectativaNacional = originalExpectation;
                    Navigator.of(context).pop();
                  }
              ),
              TextButton(
                  child: const Text("OK",style: EstiloTextoPreto.text16,),
                  onPressed: (){
                    globalMyMoney += sliderMoneyValue;
                    expectativa.changeExpectativaGlobally(newValue: expectativa.expectativaNacional);
                    functionSetState!();
                    Navigator.of(context).pop();
                  }
              ),
            ],
          );
        }
      );
    },
  );
}