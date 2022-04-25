import 'package:fifa/classes/expectativa.dart';
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
  Expectativa expectativaAntiga = Expectativa(myClass);
  //Calcula nova expectativa para a nova temporada
  globalMyExpectativa = myClass.newExpectativa();
  Expectativa expectativaAtual = Expectativa(myClass);

  //TEMPORADA PASSADA
  String expLastSeason = 'TEMPORADA PASSADA: ';
  late HistoricClubYear myClubData;
  if(ano>anoInicial){
    myClubData = HistoricClubYear(ano-1);
    if(myClubData.leaguePosition > expectativaAntiga.expLastYear){
      expLastSeason += 'RUIM \n Resultado: ${myClubData.leaguePosition}º\n Esperado: ${expectativaAntiga.expLastYear}º';
    }else{
      expLastSeason += 'BOM \n Resultado: ${myClubData.leaguePosition}º\n Esperado: ${expectativaAntiga.expLastYear}º';
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
                        Text(expectativaAtual.expectativaNacional.toString()+'º', style: EstiloTextoPreto.text20),
                      ],
                    ),


                  ],
                ),
                League(index: myClass.campeonatoID).playInternational
                    ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(FIFAImages().campeonatoInternacionalLogo(myClass.getMyInternationalLeague()),height: 35,width: 35),
                    Text('${myClass.getMyInternationalLeague()}:', style: EstiloTextoPreto.text14),
                    Text(expectativaAtual.expInternacional, style: EstiloTextoPreto.text14),
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