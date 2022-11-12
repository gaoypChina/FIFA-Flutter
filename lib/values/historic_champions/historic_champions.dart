import 'package:fifa/values/historic_champions/africa.dart';
import 'package:fifa/values/historic_champions/america.dart';
import 'package:fifa/values/historic_champions/asia.dart';
import 'package:fifa/values/historic_champions/estaduais.dart';
import 'package:fifa/values/historic_champions/europa.dart';
import 'package:fifa/values/historic_champions/europa_top_leagues.dart';
import 'package:fifa/values/historic_champions/internationals.dart';
import 'package:fifa/values/historic_champions/north_america.dart';

  Map<double,dynamic> mapChampions(String league){

    if(mapEuropa[league] != null){
        return mapEuropa[league];
    }
    if(mapEuropaTopLeagues[league] != null){
      return mapEuropaTopLeagues[league];
    }
    if(mapAmerica[league] != null){
        return mapAmerica[league];
    }
    if(mapNorthAmerica[league] != null){
      return mapNorthAmerica[league];
    }
    if(mapAfrica[league] != null) {
        return mapAfrica[league];
    }
    if(mapAsia[league] != null){
        return mapAsia[league];
    }
    if(mapInternationals[league] != null){
        return mapInternationals[league];
    }

    if(mapEstaduais[league] != null){
      return mapEstaduais[league];
    }
    return {};

    //if(mapCopas(league).isNotEmpty){
    //    return mapCopas(league);
    //}


  }
