import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

Widget backgroundTournament(Semana week, My myClass){
  if(week.isJogoMundial){
    return Image.asset('assets/icons/fundomundial.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill);
  }else if(week.isJogoCampeonatoNacional){
    return Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill);
  }else if(week.isJogoCopa){
    return Image.asset('assets/icons/wallpaper blue.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill);
  }else{
    return backgroundInternationalLeague(myClass.getMyInternationalLeague());
  }

}

Widget backgroundInternationalLeague(String leagueInternational){
  if(leagueInternational == LeagueOfficialNames().championsLeague){
    return Image.asset('assets/icons/fundochampions.png',height: double.maxFinite,width: double.maxFinite,fit: BoxFit.fill);
  }
  if(leagueInternational == LeagueOfficialNames().libertadores){
    return Image.asset('assets/icons/fundolibertadores.png',height: double.maxFinite,width: double.maxFinite,fit: BoxFit.fill);
  }
  if(leagueInternational == LeagueOfficialNames().europaLeagueOficial){
    return Image.asset('assets/icons/fundoeuropa.png',height: double.maxFinite,width: double.maxFinite,fit: BoxFit.fill);
  }
  if(leagueInternational == LeagueOfficialNames().copaSulAmericana){
    return Image.asset('assets/icons/fundosula.png',height: double.maxFinite,width: double.maxFinite,fit: BoxFit.fill);
  }
  //MODO DEFAULT
    return Image.asset('assets/icons/wallpaper.png',height: double.maxFinite,width: double.maxFinite,fit: BoxFit.fill);
}

Widget backgroundMundial(){
  return Image.asset('assets/icons/fundomundial.png',height: double.maxFinite,width: double.maxFinite,fit: BoxFit.fill);
}