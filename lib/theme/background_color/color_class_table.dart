import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/functions/nteams_int_league.dart';
import 'package:fifa/values/league_divisions.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

Color colorBackgroundNationalTable(int position, League league, String teamName){
  LeagueOfficialNames n = LeagueOfficialNames();
  String leagueName = league.name;
  Color backgroundColor = Colors.transparent;
  
  //CLASSIFICAÇÃO
  backgroundColor = colorLeague(leagueName,n.inglaterra1, n.championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.italia1, n.championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.espanha1, n.championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.franca1, n.championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.alemanha1, n.championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.portugal, n.championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.holanda, n.championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.turquia, n.championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.ligaEuropa, n.championsLeague, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.lesteEuropeu, n.championsLeague, position, backgroundColor);

  backgroundColor = colorLeague(leagueName,n.brasil1, n.libertadores, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.argentina, n.libertadores, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.mercosul, n.libertadores, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.colombia, n.libertadores, position, backgroundColor);


  //INTERNACIONAL 2
  backgroundColor = colorLeague(leagueName,n.inglaterra1, n.europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.italia1, n.europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.espanha1, n.europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.franca1, n.europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.alemanha1, n.europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.portugal, n.europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.holanda, n.europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.turquia, n.europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.ligaEuropa, n.europaLeagueOficial, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.lesteEuropeu, n.europaLeagueOficial, position, backgroundColor);

  backgroundColor = colorLeague(leagueName,n.brasil1, n.copaSulAmericana, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.argentina, n.copaSulAmericana, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.mercosul, n.copaSulAmericana, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.colombia, n.copaSulAmericana, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.mexico, n.copaSulAmericana, position, backgroundColor);
  backgroundColor = colorLeague(leagueName,n.estadosUnidos, n.copaSulAmericana, position, backgroundColor);

  //1ºCOLOCADO
  if(position==0){backgroundColor = Colors.yellowAccent.withOpacity(0.7);}

  //ACESSO 1ªDivisão
  List<String> divisionsNames = Divisions().leagueDivisionsStructure(leagueName);
  if(divisionsNames.length > 1 && leagueName != divisionsNames.first){
    if(position==1){backgroundColor = Colors.blue;}
    if(position==2){backgroundColor = Colors.blue;}
  }

  //REBAIXAMENTO
  if(divisionsNames.length > 1 && leagueName != divisionsNames.last){
    if(position==league.nClubs-3){backgroundColor = Colors.red;}
    if(position==league.nClubs-2){backgroundColor = Colors.red;}
    if(position==league.nClubs-1){backgroundColor = Colors.red;}
  }

  return backgroundColor;
}

Color colorLeague(String leagueName,String leagueNameCompare, String internationalName, int position,Color backgroundColor){
  if(leagueName == leagueNameCompare){
    NTeamsIntLeague nTeamsIntLeague = NTeamsIntLeague(leagueName: leagueNameCompare,internationalName: internationalName);
    for(int i = nTeamsIntLeague.offset; i < nTeamsIntLeague.offset+nTeamsIntLeague.nTeamsClassifiedValue; i++){
      if(position==i){
        if(internationalName == LeagueOfficialNames().championsLeague ||
            internationalName == LeagueOfficialNames().libertadores){
          return Colors.indigo;
        }
        return Colors.blue;
      }
    }
  }
  return backgroundColor;
}