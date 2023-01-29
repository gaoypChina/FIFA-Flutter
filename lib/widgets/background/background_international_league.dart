import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

Widget backgroundTournament(Semana week, My myClass){
  return               week.isJogoMundial
      ? Image.asset('assets/icons/fundomundial.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill)
      : week.isJogoCampeonatoNacional
      ? Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill,)
      : myClass.getMyInternationalLeague() == LeagueOfficialNames().championsLeague
      ? Image.asset('assets/icons/fundochampions.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill)
      : Image.asset('assets/icons/fundolibertadores.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill);

}

Widget backgroundInternationalLeague(String leagueInternational){
  return leagueInternational == LeagueOfficialNames().championsLeague
      ? Image.asset('assets/icons/fundochampions.png',height: double.maxFinite,width: double.maxFinite,fit: BoxFit.fill)
      : leagueInternational == LeagueOfficialNames().europaLeagueOficial
        ? Image.asset('assets/icons/fundoeuropa.png',height: double.maxFinite,width: double.maxFinite,fit: BoxFit.fill)
        : leagueInternational == LeagueOfficialNames().copaSulAmericana
          ? Image.asset('assets/icons/fundosula.png',height: double.maxFinite,width: double.maxFinite,fit: BoxFit.fill)
          : Image.asset('assets/icons/fundolibertadores.png',height: double.maxFinite,width: double.maxFinite,fit: BoxFit.fill);
}

Widget backgroundMundial(){
  return Image.asset('assets/icons/fundomundial.png',height: double.maxFinite,width: double.maxFinite,fit: BoxFit.fill);
}