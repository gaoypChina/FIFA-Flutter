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
    0: clubName.arsenal,1: clubName.astonvilla,2: clubName.bournemouth,3: clubName.brentford,
    4: clubName.brighton,5: clubName.chelsea,6: clubName.crystalpalace,7: clubName.everton,
    8: clubName.fulham,9: clubName.leedsunited,10: clubName.leicester,11: clubName.liverpool,
    12: clubName.manchestercity,13: clubName.manchesterunited,14: clubName.newcastle,15: clubName.nottinghamforest,
    16: clubName.tottenham,17: clubName.southampton,18: clubName.westham,19: clubName.wolves,
  },
  LeagueOfficialNames().inglaterra2 : {
    0: clubName.birmigham,1: clubName.blackburn,2: clubName.burnley,3: clubName.bristol,
    4: clubName.cardiffCity,5: clubName.coventry,6: clubName.huddersfield,7: clubName.hullcity,
    8: clubName.luton,9: clubName.middlesbrough,10: clubName.norwich, 11: clubName.qpr,
    12: clubName.prestonNorthEnd,13: clubName.reading, 14: clubName.sheffieldunited, 15: clubName.stoke,
    16: clubName.sunderland,17:clubName.swansea,18: clubName.watford,19:clubName.westbromwich,

  },
  LeagueOfficialNames().inglaterra3 : {
    0:clubName.blackpool,1:clubName.charlton,2: clubName.derbycount, 3: clubName.ipswichTown,
    4:clubName.peterborough, 5:clubName.plymouth,6:clubName.portsmouth, 7:clubName.rotherham,
  },
  LeagueOfficialNames().italia1 : {
    0: clubName.atalanta, 1: clubName.bologna,2: clubName.cremonese,3: clubName.empoli,
    4: clubName.fiorentina,5: clubName.monza,6: clubName.hellasVerona,7: clubName.inter,
    8: clubName.juventus,9: clubName.lazio,10: clubName.lecce,11: clubName.milan,
    12: clubName.napoli,13: clubName.roma,14: clubName.salernitana,15: clubName.sampdoria,
    16: clubName.sassuolo,17: clubName.spezia,18: clubName.torino,19: clubName.udinese,
  },
  LeagueOfficialNames().italia2 : {
    0: clubName.ascoli, 1: clubName.bari,2: clubName.benevento,3: clubName.brescia,
    4: clubName.cagliari,5: clubName.como,6: clubName.crotone,7: clubName.frosinone,
    8: clubName.genoa,9: clubName.palermo,10: clubName.parma,11: clubName.perugia,
    12: clubName.pisa,13: clubName.reggina,14: clubName.spal,15: clubName.venezia,
  },
  LeagueOfficialNames().espanha1 : {
    0: clubName.almeria,1: clubName.athleticbilbao,2: clubName.atleticomadrid,3: clubName.barcelona,
    4: clubName.cadiz,5: clubName.celtavigo,6: clubName.eibar,7: clubName.elche,
    8: clubName.espanyol,9: clubName.getafe,10: clubName.mallorca,11: clubName.osasuna,
    12: clubName.rayoVallecano,13: clubName.realbetis,14: clubName.realmadrid,15: clubName.realsociedad,
    16: clubName.sevilla,17: clubName.valencia,18: clubName.valladolid,19: clubName.villareal,
  },
  LeagueOfficialNames().espanha2 : {
    0: clubName.alaves,1: clubName.girona,2: clubName.granada,3: clubName.ibiza,
    4: clubName.lacoruna,5: clubName.lasPalmas,6: clubName.leganes,7: clubName.levante,
    8: clubName.malaga,9: clubName.sportingGijon,10: clubName.tenerife,11: clubName.zaragoza,
  },
  LeagueOfficialNames().alemanha1 : {
    0: clubName.augsburg,1: clubName.bayerleverkusen,2: clubName.bayernmunique,3: clubName.borussiadortmund,
    4: clubName.bochum,5: clubName.moenchengladbach,6: clubName.colonia,7: clubName.eintrachtfrankfurt,
    8: clubName.freiburg,9: clubName.herthaberlim,10: clubName.hoffenheim,11: clubName.mainz05,
    12: clubName.rbleipzig,13: clubName.schalke04,14: clubName.stuttgart,15: clubName.unionBerlin,
    16: clubName.werderbremen,17: clubName.wolfsburg,
  },
  LeagueOfficialNames().alemanha2 : {
    0: clubName.arminiaBiefeld,1: clubName.darmstadt,2: clubName.dynamoDresden,3: clubName.fortunaDusseldorf,
    4: clubName.hamburgo,5: clubName.hannover96,6: clubName.kaiserslautern,7: clubName.nurnberg,
    8: clubName.paderborn,9: clubName.stPauli,
  },
  LeagueOfficialNames().franca1 : {
    0: clubName.ajaccio,1: clubName.angers,2: clubName.auxerre,3: clubName.bordeaux,
    4: clubName.brest,5: clubName.clermont,6: clubName.lens,7: clubName.lille,
    8: clubName.lorient,9: clubName.lyon,10: clubName.monaco,11: clubName.montpellier,
    12: clubName.nantes,13: clubName.nice,14: clubName.olympiquemarselha,15: clubName.psg,
    16: clubName.reims,17: clubName.rennes,18: clubName.strasbourg,19: clubName.toulouse,
  },
  LeagueOfficialNames().ptHol : {
    0: clubName.benfica,1: clubName.porto,2: clubName.sporting,3: clubName.braga,
    4: clubName.vitoriaguimaraes,5: clubName.maritimo,6: clubName.portimonense,7: clubName.boavista,
    8: clubName.ajax,9: clubName.psv,10: clubName.feyenoord,11: clubName.azAlkmaar,
    12: clubName.twente,13: clubName.utrecht,14: clubName.vitesse,15: clubName.heerenveen,
    16: clubName.coimbra,17: clubName.famalicao,
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
    0: clubName.cska,1: clubName.dinamoMoscou,2: clubName.krasnodar,3: clubName.lokomotivMoscou,
    4: clubName.rubinKazan,5: clubName.sochi,6: clubName.spartakmoscou,7: clubName.zenit,
    8: clubName.dinamokiev,9: clubName.shaktardonetsk,10: clubName.partizan,11: clubName.estrelavermelha,
    12: clubName.dinamozagreb,13: clubName.steauaBucureste,14: clubName.cskaSofia,15: clubName.ludogorets,
    16: clubName.astana,17: clubName.qarabag,
  },

  //AMÉRICA DO SUL
  LeagueOfficialNames().brasil1 : {
    0: clubName.palmeiras,1: clubName.atleticomg,2: clubName.atleticogo, 3: clubName.atleticopr,
    4: clubName.avai,5: clubName.botafogo,6: clubName.bragantino,7: clubName.ceara,
    8: clubName.corinthians,9: clubName.coritiba,10: clubName.cuiaba,11: clubName.flamengo,
    12: clubName.fluminense,13: clubName.fortaleza,14: clubName.goias,15: clubName.internacional,
    16: clubName.juventude,17: clubName.americamg,18: clubName.santos,19: clubName.saopaulo,
  },
  LeagueOfficialNames().brasil2 : {
    0: clubName.criciuma,1: clubName.bahia,2: clubName.chapecoense,3: clubName.crb,
    4: clubName.csa,5: clubName.cruzeiro,6: clubName.gremio,7: clubName.guarani,
    8: clubName.ituano,9: clubName.nautico,10: clubName.operarioPR,11: clubName.pontepreta,
    12: clubName.sampaio,13: clubName.sport,14: clubName.vasco,15: clubName.vilanova,
  },
  LeagueOfficialNames().brasil3 : {
    0: clubName.abc,1: clubName.brasilPelotas,2: clubName.brusque,3: clubName.figueirense,
    4: clubName.gremioNovorizontino,5: clubName.londrina,6: clubName.manaus,7: clubName.parana,
    8: clubName.paysandu,9:clubName.portuguesa,10: clubName.remo,11: clubName.santacruz,
    12: clubName.santoandre,13: clubName.saocaetano,14: clubName.tombense,15: clubName.vitoria,
    16: clubName.botafogoPB,17: clubName.caxias,18: clubName.mirassol,19: clubName.botafogoSP,
  },
  LeagueOfficialNames().argentina : {
    0: clubName.argentinojuniors,1: clubName.banfield,2: clubName.bocajuniors,3: clubName.colon,
    4: clubName.defensayjusticia,5: clubName.estudiantes,6: clubName.gimnasia,7: clubName.godoyCruz,
    8: clubName.huracan,9: clubName.independiente,10: clubName.lanus,11: clubName.newells,
    12: clubName.racing,13: clubName.riverplate,14: clubName.rosariocentral,15:clubName.sanlorenzo,
    16: clubName.talleres,17:clubName.velezsarsfield,
  },
  LeagueOfficialNames().sulamericano : {
    0: clubName.cerroporteno,1: clubName.olimpia,2: clubName.guaraniPAR,3: clubName.libertad,
    4: clubName.colocolo,5: clubName.lau,6: clubName.palestino,7: clubName.univcatolica,
    8: clubName.alwaysReady,9: clubName.bolivar,10: clubName.theStrongest,11: clubName.alianzalima,
    12: clubName.cienciano,13: clubName.jorge,14: clubName.melgar,15: clubName.sportingcristal,
    16: clubName.universitario,17: clubName.montevideo,18: clubName.nacional,19: clubName.penarol,
  },
  LeagueOfficialNames().colombia : {
    0: clubName.americadecali,1: clubName.atleticonacional,2: clubName.deportivocali,3: clubName.junior,
    4: clubName.imedellin,5: clubName.tolima,6: clubName.millonarios,7: clubName.santafe,
    8: clubName.oncecaldas,
    9: clubName.caracas,10: clubName.deportivoTachira,11: clubName.laGuaira,
    12: clubName.barcelonaequ,13: clubName.emelec,14: clubName.ldu,15: clubName.idelvalle,
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
    0: clubName.alIttihad,1: clubName.alWahda,2: clubName.fcSeoul,3: clubName.ulsan,
    4: clubName.vardar,5: clubName.slovanBratislava, 6: clubName.helsinki,7: clubName.laskLinz,
    8: clubName.maccabiTelAviv,9: clubName.caen,10: clubName.metz,11: clubName.troyes,
    12: clubName.saintetienne,13: clubName.genk,14: clubName.midtjylland,15: clubName.gilVicente,
    16: clubName.persepolis,17: clubName.atleticoTucuman,18: clubName.molde,19: clubName.ferencvaros,
  },

};
