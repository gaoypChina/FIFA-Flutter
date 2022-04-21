import 'package:fifa/values/club_names.dart';

import 'league_names.dart';

ClubName clubName = ClubName();

/////////////
//default teams
List defaultChampionsLeagueClubs = [
  clubName.manchestercity,clubName.psg,clubName.rbleipzig,clubName.brugge,
  clubName.liverpool,clubName.porto,clubName.milan,clubName.atleticomadrid,
  clubName.borussiadortmund,clubName.ajax,clubName.sporting,clubName.besiktas,
  clubName.realmadrid,clubName.inter,clubName.shaktardonetsk,clubName.lyon,
  clubName.bayernmunique,clubName.barcelona,clubName.benfica,clubName.dinamokiev,
  clubName.manchesterunited,clubName.atalanta,clubName.villareal,clubName.dinamozagreb,
  clubName.sevilla,clubName.rbsalzburg,clubName.lille,clubName.wolfsburg,
  clubName.chelsea,clubName.juventus,clubName.zenit,clubName.malmo,
];
List defaultLibertadoresClubs = [
  clubName.palmeiras,clubName.deportivoTachira,clubName.emelec,clubName.monterrey,
  clubName.atleticopr,clubName.bolivar,clubName.caracas,clubName.libertad,
  clubName.bragantino,clubName.nacional,clubName.velezsarsfield,clubName.estudiantes,
  clubName.atleticomg,clubName.idelvalle,clubName.tolima,clubName.americamg,
  clubName.bocajuniors,clubName.corinthians,clubName.alwaysReady,clubName.deportivocali,
  clubName.riverplate,clubName.fortaleza,clubName.colocolo,clubName.alianzalima,
  clubName.colon,clubName.penarol,clubName.cerroporteno,clubName.olimpia,
  clubName.flamengo,clubName.univcatolica,clubName.talleres,clubName.sportingcristal,
];

///////////////////////////////////////////////////////////
//  CLUBS IN EACH LEAGUE
//////////////////////////////////////////////////////////
Map clubNameMap = {};

Map clubNameMapImmutable = {
  LeagueOfficialNames().inglaterra1 : {
    0: clubName.arsenal,1: clubName.astonvilla,2: clubName.chelsea,3: clubName.crystalpalace,
    4: clubName.everton,5: clubName.leedsunited,6: clubName.leicester,7: clubName.liverpool,
    8: clubName.manchestercity,9: clubName.manchesterunited,10: clubName.newcastle,11: clubName.tottenham,
    12: clubName.southampton,13: clubName.brentford,14: clubName.westham,15: clubName.wolves,
  },
  LeagueOfficialNames().inglaterra2 : {
    0: clubName.birmigham,1: clubName.blackburn,2: clubName.bournemouth,3: clubName.burnley,
    4: clubName.brighton,5: clubName.derbycount,6: clubName.fulham,7: clubName.middlesbrough,
    8: clubName.norwich,9: clubName.nottinghamforest,10: clubName.qpr, 11: clubName.reading,
    12: clubName.sheffieldunited,13: clubName.westbromwich, 14: clubName.swansea, 15: clubName.watford,
  },
  LeagueOfficialNames().inglaterra3 : {
    //0: clubName.sunderland,1: clubName.stoke,2: clubName.hullcity,3: clubName.portsmouth,
  },
  LeagueOfficialNames().italia1 : {
    0: clubName.atalanta, 1: clubName.bologna,2: clubName.cagliari,3: clubName.fiorentina,
    4: clubName.genoa,5: clubName.hellasVerona,6: clubName.inter,7: clubName.juventus,
    8: clubName.milan,9: clubName.lazio,10: clubName.napoli,11: clubName.roma,
    12: clubName.sampdoria,13: clubName.sassuolo,14: clubName.torino,15: clubName.udinese,
  },
  LeagueOfficialNames().espanha1 : {
    0: clubName.athleticbilbao,1: clubName.atleticomadrid,2: clubName.barcelona,3: clubName.celtavigo,
    4: clubName.espanyol,5: clubName.getafe,6: clubName.granada,7: clubName.levante,
    8: clubName.osasuna,9: clubName.realbetis,10: clubName.realmadrid,11: clubName.realsociedad,
    12: clubName.sevilla,13: clubName.valencia,14: clubName.valladolid,15: clubName.villareal,
  },
  LeagueOfficialNames().espanha2 : {
    0: clubName.alaves,1: clubName.almeria,2: clubName.cadiz,3: clubName.elche,
    4: clubName.girona,5: clubName.ibiza,6: clubName.lacoruna,7: clubName.lasPalmas,
    8: clubName.zaragoza,9: clubName.malaga,10: clubName.mallorca,11: clubName.rayoVallecano,
    12: clubName.sportingGijon,13: clubName.tenerife,
  },
  LeagueOfficialNames().alemanha1 : {
    0: clubName.moenchengladbach,1: clubName.borussiadortmund,2: clubName.bayernmunique,3: clubName.bayerleverkusen,
    4: clubName.colonia,5: clubName.eintrachtfrankfurt,6: clubName.freiburg,7: clubName.hamburgo,
    8: clubName.augsburg,9: clubName.herthaberlim,10: clubName.hoffenheim,11: clubName.rbleipzig,
    12: clubName.schalke04,13: clubName.stuttgart,14: clubName.werderbremen,15: clubName.wolfsburg,
  },
  LeagueOfficialNames().franca1 : {
    0: clubName.bordeaux,1: clubName.lille,2: clubName.lyon,3: clubName.monaco,
    4: clubName.montpellier,5: clubName.nantes,6: clubName.nice,7: clubName.olympiquemarselha,
    8: clubName.psg,9: clubName.reims,10: clubName.rennes,11: clubName.saintetienne,
    12: clubName.metz,13: clubName.strasbourg,14: clubName.lens,15: clubName.toulouse,
  },
  LeagueOfficialNames().ptHol : {
    0: clubName.benfica,1: clubName.porto,2: clubName.sporting,3: clubName.braga,
    4: clubName.vitoriaguimaraes,5: clubName.maritimo,6: clubName.portimonense,7: clubName.boavista,
    8: clubName.ajax,9: clubName.psv,10: clubName.feyenoord,11: clubName.azAlkmaar,
    12: clubName.twente,13: clubName.utrecht,14: clubName.vitesse,15: clubName.heerenveen,
  },
  LeagueOfficialNames().turquiaGrecia : {
    0: clubName.olympiacos,1: clubName.aek,2: clubName.paok,3: clubName.panathinaikos,
    4: clubName.galatasaray,5: clubName.fenerbahce,6: clubName.besiktas,7: clubName.instanbul,
    8: clubName.trabzonspor,9: clubName.apoel,
  },
  LeagueOfficialNames().ligaEuropa : {
    0: clubName.anderlecht,1: clubName.brugge,2: clubName.standardliege,3: clubName.slaviaPraha,
    4: clubName.spartapraga,5: clubName.zurich,6: clubName.youngBoys,7: clubName.legiaWarszawa,
    8: clubName.celtic,9: clubName.glasgowrangers,10: clubName.rosenborg,11: clubName.malmo,
    12: clubName.copenhague,13: clubName.rbsalzburg,14: clubName.rapidviena,15: clubName.basel,
  },
  LeagueOfficialNames().lesteEuropeu : {
    0: clubName.astana,1: clubName.cska,2: clubName.cskaSofia,3: clubName.dinamokiev,
    4: clubName.dinamoMoscou,5: clubName.dinamozagreb,6: clubName.estrelavermelha,7: clubName.krasnodar,
    8: clubName.lokomotivMoscou,9: clubName.ludogorets,10: clubName.partizan,11: clubName.rubinKazan,
    12: clubName.shaktardonetsk,13: clubName.sochi,14: clubName.spartakmoscou,15: clubName.zenit,
  },

  //AMÉRICA DO SUL
  LeagueOfficialNames().brasil1 : {
    0: clubName.palmeiras,1: clubName.atleticomg,2: clubName.atleticogo, 3: clubName.atleticopr,
    4: clubName.botafogo,5: clubName.bragantino,6: clubName.ceara,7: clubName.corinthians,
    8: clubName.coritiba,9: clubName.flamengo,10: clubName.fluminense,11: clubName.fortaleza,
    12: clubName.internacional,13: clubName.santos,14: clubName.saopaulo,15: clubName.americamg,
  },
  LeagueOfficialNames().brasil2 : {
    0: clubName.avai,1: clubName.bahia,2: clubName.chapecoense,3: clubName.cuiaba,
    4: clubName.crb,5: clubName.cruzeiro,6: clubName.csa,7: clubName.goias,
    8: clubName.gremio,9: clubName.guarani,10: clubName.juventude,11: clubName.nautico,
    12: clubName.pontepreta,13: clubName.sport,14: clubName.vasco,15: clubName.vitoria,
  },
  LeagueOfficialNames().brasil3 : {
    0: clubName.abc,1: clubName.brasilPelotas,2: clubName.criciuma,3: clubName.figueirense,
    4: clubName.gremioNovorizontino,5: clubName.ituano,6: clubName.londrina,7: clubName.manaus,
    8: clubName.operarioPR,9:clubName.parana,10: clubName.paysandu,11: clubName.portuguesa,
    12: clubName.remo,13: clubName.sampaio,14: clubName.santacruz,15: clubName.vilaNova,
  },
  LeagueOfficialNames().argentina : {
    0: clubName.argentinojuniors,1: clubName.arsenalsarandi,2: clubName.banfield,3: clubName.bocajuniors,
    4: clubName.colon,5: clubName.defensayjusticia,6: clubName.estudiantes,7: clubName.independiente,
    8: clubName.lanus,9: clubName.newells,10: clubName.racing,11: clubName.riverplate,
    12: clubName.rosariocentral,13: clubName.sanlorenzo,14: clubName.talleres,15:clubName.velezsarsfield,
  },
  LeagueOfficialNames().sulamericano : {
    0: clubName.penarol,1: clubName.nacional,2: clubName.olimpia,3: clubName.cerroporteno,
    4: clubName.libertad,5: clubName.colocolo,6: clubName.lau,7: clubName.univcatolica,
    8: clubName.bolivar,9: clubName.theStrongest,10: clubName.sportingcristal,11: clubName.alianzalima,
    12: clubName.jorge,13: clubName.universitario,14: clubName.guaraniPAR,15: clubName.alwaysReady,
  },
  LeagueOfficialNames().colombia : {
    0: clubName.americadecali,1: clubName.atleticonacional,2: clubName.deportivocali,3: clubName.junior,
    4: clubName.imedellin,5: clubName.tolima,6: clubName.millonarios,7: clubName.santafe,
    8: clubName.caracas,9: clubName.deportivoTachira,
    10: clubName.barcelonaequ,11: clubName.emelec,12: clubName.ldu,13: clubName.idelvalle,
  },

  //AMÉRICA DO NORTE
  LeagueOfficialNames().mexico : {
    0: clubName.americamex,1: clubName.chivasguadalajara,2: clubName.cruzazul,3: clubName.monterrey,
    4: clubName.pachuca,5: clubName.pumas,6: clubName.tigres,7: clubName.toluca,
    8: clubName.tijuana,9: clubName.santosLaguna,10: clubName.puebla,11: clubName.necaxa,
    12: clubName.atlas,13: clubName.queretaro,14: clubName.leon,15: clubName.juarez,
  },
  LeagueOfficialNames().estadosUnidos : {
    0: clubName.atlantaunited,1: clubName.columbuscrew,2:clubName.dcunited,3: clubName.fcdallas,
    4: clubName.intermiami,5: clubName.losangelesfc,6: clubName.lagalaxy,7: clubName.minnesota,
    8: clubName.nerevolution,9: clubName.nycity,10: clubName.nyredbulls,11: clubName.orlando,
    12: clubName.portland,13: clubName.seattle,14: clubName.torontofc,15:clubName.vancouver,
  },

  //RESTO DO MUNDO
  LeagueOfficialNames().asia : {
    0: clubName.ghuagzhouevergrande,1: clubName.shanghaisipg,2: clubName.shandongluneng,3: clubName.kawasakifrontale,
    4: clubName.kashimaantlers,5: clubName.urawareddiamonds,6: clubName.visselkobe,7: clubName.pohang,
    8: clubName.jeonbuk,9: clubName.alhilal,10: clubName.alnassr,11: clubName.alain,
    12: clubName.alsadd,13: clubName.alahli,14: clubName.alduhail,15: clubName.aljazira,
  },
  LeagueOfficialNames().africa : {
    0: clubName.alahly,1: clubName.zamalek,2: clubName.mazembe,3: clubName.esperance,
    4: clubName.rajacasablanca,5: clubName.wydad,6: clubName.orlandoPirates,7: clubName.kaizer,
    8: clubName.mamelodi,9: clubName.agosto,10:clubName.sydney,11:clubName.melbourneVictory,
  },
  LeagueOfficialNames().outros : {
    0: clubName.montevideo,1: clubName.oncecaldas,2: clubName.palestino,3: clubName.cienciano,
    4: clubName.huracan,5: clubName.fcSeoul, 6: clubName.alIttihad,7: clubName.ulsan,
    8: clubName.sunderland,9: clubName.portsmouth,10: clubName.steauaBucureste,11: clubName.stPauli,
    12: clubName.qarabag,13: clubName.maccabiTelAviv,
  },

};
