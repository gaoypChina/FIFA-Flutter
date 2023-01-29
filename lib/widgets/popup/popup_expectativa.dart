import 'package:fifa/classes/expectativa.dart';
import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/classes/historic/historic_club_year.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
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
  String expLastSeason = '${Translation(context).text.lastSeason.toUpperCase()}: ';
  late HistoricClubYear myClubData;
  if(ano>anoInicial){
    myClubData = HistoricClubYear(ano-1);
    //TEXTO DO POPUP
    String result = ' ${Translation(context).text.result}: ${myClubData.leaguePosition}º';
    String goal = ' ${Translation(context).text.expected}: ${expectativaAntiga.expLastYear}º';
    if(myClubData.leaguePosition > expectativaAntiga.expLastYear){
      expLastSeason += '${Translation(context).text.bad.toUpperCase()} \n$result\n$goal';
    }else{
      expLastSeason += '${Translation(context).text.good.toUpperCase()} \n$result\n$goal';
    }
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: Text(Translation(context).text.seasonGoals,style: EstiloTextoPreto.text16),
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
                        Image.asset(FIFAImages().campeonatoLogo(myClass.campeonatoName),height: 35,width: 35),
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
                    Image.asset(FIFAImages().campeonatoLogo(myClass.getMyInternationalLeague()),height: 35,width: 35),
                    Text('${myClass.getMyInternationalLeague()}:', style: EstiloTextoPreto.text14),
                    Text(Name().showTranslated(context, expectativaAtual.expInternacional), style: EstiloTextoPreto.text14),
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