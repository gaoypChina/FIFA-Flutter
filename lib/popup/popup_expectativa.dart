import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/classes/historic.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:flutter/material.dart';


popUpExpectativa({required BuildContext context}){
  //Expectativa variables

  My myClass = My();

  int expectativaPast = myClass.getLastYearExpectativa();
  int expectativa = myClass.newExpectativa();
  globalMyExpectativa = myClass.newExpectativa();

  String expNacional = expectativa.toString()+'º';
  String expCompInternacional = myClass.getMyInternationalLeague();
  String expInternacional = '';
  if(expectativa <= 2){ expInternacional = Name().semifinal; }
  else if(expectativa < 4){ expInternacional = Name().quartas; }
  else if(expectativa < 6){ expInternacional = Name().oitavas; }
  else if(expectativa < 10){ expInternacional = 'Classificar'; }
  else{ expInternacional = ''; }

  //TEMPORADA PASSADA
  String expLastSeason = 'TEMPORADA PASSADA: ';
  late HistoricClubYear myClubData;
  if(ano>anoInicial){
    myClubData = HistoricClubYear(ano-1);
    if(myClubData.position > expectativaPast){
      expLastSeason += 'RUIM \n Resultado: ${myClubData.position}º\n Esperado:$expectativaPastº';
    }else{
      expLastSeason += 'BOM \n Resultado: ${myClubData.position}º\n Esperado:$expectativaPastº';
    }
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: const Text('Expectativa para a temporada',style: EstiloTextoPreto.text16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: League(index: myClass.campeonatoID).playInternational
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Image.asset(FIFAImages().campeonatoLogo(myClass.campeonatoID),height: 35,width: 35),
                        Text('${myClass.getLeagueName()}: ', style: EstiloTextoPreto.text14),
                        Text(expNacional, style: EstiloTextoPreto.text20),
                      ],
                    ),


                  ],
                ),
                League(index: myClass.campeonatoID).playInternational
                    ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(FIFAImages().campeonatoInternacionalLogo(myClass.getMyInternationalLeague()),height: 35,width: 35),
                    Text('$expCompInternacional:', style: EstiloTextoPreto.text14),
                    Text(expInternacional, style: EstiloTextoPreto.text14),
                  ],
                )
                : Container(),
              ],
            ),
            //RESULTADO DA TEMPORADA ANTERIOR
            ano>anoInicial
                ? Text('\n$expLastSeason', style: EstiloTextoPreto.text14)
                : Container(),
          ],
        ),
        actions: <Widget>[
          TextButton(
              child: const Text("OK",style: EstiloTextoPreto.text16,),
              onPressed: (){
                Navigator.of(context).pop();
              }
          ),
        ],
      );
    },
  );
}