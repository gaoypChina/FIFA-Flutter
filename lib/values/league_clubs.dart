import 'package:fifa/values/club_names.dart';

import 'league_names.dart';

ClubName clubName = ClubName();

/////////////
//default teams
//Esses times tem que ser jogaveis
List defaultChampionsLeagueClubs = [
  clubName.ajax,clubName.liverpool,clubName.napoli,clubName.rangers,
  clubName.porto,clubName.atleticomadrid,clubName.leverkusen,clubName.brugge,
  clubName.bayernmunique,clubName.barcelona,clubName.inter,clubName.slaviaPraha,
  clubName.eintrachtfrankfurt,clubName.tottenham,clubName.sporting,clubName.om,
  clubName.milan,clubName.chelsea,clubName.rbsalzburg,clubName.dinamozagreb,
  clubName.realmadrid,clubName.rbleipzig,clubName.shaktardonetsk,clubName.celtic,
  clubName.manchestercity,clubName.sevilla,clubName.dortmund,clubName.copenhague,
  clubName.psg,clubName.juventus,clubName.benfica,clubName.maccabiTelAviv,
];

List defaultLibertadoresClubs = [
  clubName.palmeiras,clubName.tachira,clubName.emelec,clubName.monterrey,
  clubName.atleticopr,clubName.bolivar,clubName.caracas,clubName.libertad,
  clubName.bragantino,clubName.nacional,clubName.velez,clubName.estudiantes,
  clubName.atleticomg,clubName.idelvalle,clubName.tolima,clubName.americamg,
  clubName.bocajuniors,clubName.corinthians,clubName.alwaysReady,clubName.deportivocali,
  clubName.riverplate,clubName.fortaleza,clubName.colocolo,clubName.alianzalima,
  clubName.colon,clubName.penarol,clubName.cerroporteno,clubName.olimpia,
  clubName.flamengo,clubName.univcatolica,clubName.talleres,clubName.sportingcristal,
];
List defaultEuropaLeagueClubs = [
  clubName.roma,clubName.feyenoord,clubName.sheriffTiraspol,clubName.nantes,
  clubName.manchesterunited,clubName.psv,clubName.realbetis,clubName.helsinki,
  clubName.arsenal,clubName.rennes,clubName.midtjylland,clubName.sturmGraz,
  clubName.lazio,clubName.monaco,clubName.glimt,clubName.aeklarnaca,
  clubName.braga,clubName.realsociedad,clubName.ferencvaros,clubName.omonia,
  clubName.estrelavermelha,clubName.qarabag,clubName.unionBerlin,clubName.zurich,
  clubName.dinamokiev,clubName.malmo,clubName.freiburg,clubName.saintgilloise,
  clubName.olympiacos,clubName.ludogorets,clubName.fenerbahce,clubName.trabzonspor,
];
List defaultSulAmericanaClubs = [
  clubName.lanus,clubName.barcelonaequ,clubName.montWanderers,clubName.metropolitanos,
  clubName.melgar,clubName.racing,clubName.cuiaba,clubName.riverURU,
  clubName.santos,clubName.laCalera,clubName.uniequ,clubName.banfield,
  clubName.saopaulo,clubName.evertonchi,clubName.ayacucho,clubName.jorge,
  clubName.internacional,clubName.guairena,clubName.imedellin,clubName.octubre9,
  clubName.atleticogo,clubName.ldu,clubName.antofagasta,clubName.defensayjusticia,
  clubName.ceara,clubName.independiente,clubName.generalCaballero,clubName.laGuaira,
  clubName.unionSantaFe,clubName.fluminense,clubName.junior,clubName.orientePetrolero,
];

///////////////////////////////////////////////////////////
//  CLUBS IN EACH LEAGUE
//////////////////////////////////////////////////////////
Map clubNameMap = {};

Map clubNameMapImmutable = {
  LeagueOfficialNames().inglaterra1 : {
    0: clubName.arsenal,1: clubName.astonvilla,2: clubName.bournemouth,3: clubName.brentford,
    4: clubName.brighton,5: clubName.chelsea,6: clubName.crystalpalace,7: clubName.everton,
    8: clubName.fulham,9: clubName.leeds,10: clubName.leicester,11: clubName.liverpool,
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
    8:clubName.bolton, 9:clubName.sheffieldWednesday,10:clubName.millwall, 11:clubName.wigan,
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
    0: clubName.augsburg,1: clubName.leverkusen,2: clubName.bayernmunique,3: clubName.dortmund,
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
    12: clubName.nantes,13: clubName.nice,14: clubName.om,15: clubName.psg,
    16: clubName.reims,17: clubName.rennes,18: clubName.strasbourg,19: clubName.toulouse,
  },
  LeagueOfficialNames().franca2 : {
    0: clubName.bastia,1: clubName.caen, 2: clubName.dijon,3: clubName.metz,
    4: clubName.nimes,5: clubName.parisFC,6: clubName.saintetienne,7: clubName.troyes,
  },
  LeagueOfficialNames().portugal : {
    0: clubName.benfica,1: clubName.porto,2: clubName.sporting,3: clubName.braga,
    4: clubName.belenenses,5: clubName.boavista,6: clubName.coimbra,7: clubName.gilVicente,
    8: clubName.famalicao,9: clubName.maritimo,10: clubName.portimonense,11: clubName.vitoriaguimaraes,
  },

  LeagueOfficialNames().holanda : {
    0: clubName.ajax,1: clubName.psv,2: clubName.feyenoord,3: clubName.az,
    4: clubName.heerenveen,5: clubName.twente,6: clubName.utrecht,7: clubName.vitesse,
    8: clubName.anderlecht,9: clubName.brugge,10: clubName.genk,11: clubName.standardliege,
  },

  LeagueOfficialNames().turquiaGrecia : {
    0: clubName.olympiacos,1: clubName.aek,2: clubName.paok,3: clubName.panathinaikos,
    4: clubName.besiktas,5: clubName.fenerbahce,6: clubName.galatasaray,7: clubName.instanbul,
    8: clubName.trabzonspor,9: clubName.apoel,10:clubName.maccabiTelAviv,11:clubName.vardar,
  },
  LeagueOfficialNames().ligaEuropa : {
    0: clubName.celtic,1: clubName.rangers,2: clubName.slaviaPraha,3: clubName.spartapraga,
    4: clubName.basel,5: clubName.zurich,6: clubName.youngBoys,7: clubName.legiaWarszawa,
    8: clubName.rapidviena,9: clubName.rbsalzburg,10: clubName.malmo,11: clubName.midtjylland,
    12: clubName.copenhague,13: clubName.molde,14: clubName.rosenborg,15: clubName.helsinki,
    16: clubName.viktoriaPlzen,17: clubName.ifkgoteborg,
  },
  LeagueOfficialNames().lesteEuropeu : {
    0: clubName.cska,1: clubName.dinamoMoscou,2: clubName.krasnodar,3: clubName.lokomotivMoscou,
    4: clubName.rubinKazan,5: clubName.sochi,6: clubName.spartakmoscou,7: clubName.zenit,
    8: clubName.dinamokiev,9: clubName.shaktardonetsk,10: clubName.estrelavermelha,11: clubName.partizan,
    12: clubName.dinamozagreb,13: clubName.steauaBucuresti,14: clubName.cskaSofia,15: clubName.ludogorets,
    16: clubName.astana,17: clubName.qarabag,18:clubName.slovanBratislava,19:clubName.ferencvaros,
  },

  //AMÉRICA DO SUL
  LeagueOfficialNames().brasil1 : {
    0: clubName.palmeiras,1: clubName.atleticomg,2: clubName.atleticopr, 3: clubName.americamg,
    4: clubName.bahia,5: clubName.botafogo,6: clubName.bragantino,7: clubName.cruzeiro,
    8: clubName.corinthians,9: clubName.coritiba,10: clubName.cuiaba,11: clubName.flamengo,
    12: clubName.fluminense,13: clubName.fortaleza,14: clubName.goias,15: clubName.gremio,
    16: clubName.internacional,17: clubName.santos,18: clubName.saopaulo,19: clubName.vasco,
  },
  LeagueOfficialNames().brasil2 : {
    0: clubName.abc,1: clubName.atleticogo,2: clubName.avai,3: clubName.botafogoSP,
    4: clubName.ceara,5: clubName.chapecoense,6: clubName.crb,7: clubName.criciuma,
    8: clubName.juventude,9: clubName.gremioNovorizontino,10: clubName.guarani,11: clubName.ituano,
    12: clubName.londrina,13: clubName.mirassol,14: clubName.pontepreta,15: clubName.sampaio,
    16: clubName.sport,17:clubName.tombense,18:clubName.vilanova,19:clubName.vitoria,
  },
  LeagueOfficialNames().brasil3 : {
    0: clubName.bangu,1: clubName.brasilPelotas,2: clubName.botafogoPB,3: clubName.brasiliense,
    4: clubName.brusque,5: clubName.campinense,6: clubName.caxias,7: clubName.csa,
    8: clubName.ferroviaria,9:clubName.figueirense,10: clubName.manaus,11: clubName.nautico,
    12: clubName.operarioPR,13: clubName.parana,14: clubName.paysandu,15: clubName.portuguesa,
    16: clubName.remo,17: clubName.saocaetano,18: clubName.santoandre,19: clubName.santacruz,
  },
  LeagueOfficialNames().argentina : {
    0: clubName.argentinojuniors,1: clubName.atleticoTucuman,2: clubName.banfield,3: clubName.bocajuniors,
    4: clubName.colon,5: clubName.defensayjusticia,6: clubName.estudiantes,7: clubName.gimnasia,
    8: clubName.godoycruz,9: clubName.huracan,10: clubName.independiente,11: clubName.lanus,
    12: clubName.newells,13: clubName.racing,14: clubName.riverplate,15:clubName.rosario,
    16: clubName.sanlorenzo,17:clubName.talleres,18: clubName.unionSantaFe,19: clubName.velez,
  },
  LeagueOfficialNames().mercosul : {
    0: clubName.cerroporteno,1: clubName.olimpia,2: clubName.guaraniPAR,3: clubName.libertad,
    4: clubName.colocolo,5: clubName.lau,6: clubName.palestino,7: clubName.univcatolica,
    8: clubName.alwaysReady,9: clubName.bolivar,10: clubName.theStrongest,11: clubName.alianzalima,
    12: clubName.cienciano,13: clubName.jorge,14: clubName.melgar,15: clubName.sportingcristal,
    16: clubName.universitario,17: clubName.montevideoCity,18: clubName.nacional,19: clubName.penarol,
  },
  LeagueOfficialNames().colombia : {
    0: clubName.americadecali,1: clubName.atleticonacional,2: clubName.deportivocali,3: clubName.junior,
    4: clubName.imedellin,5: clubName.tolima,6: clubName.millonarios,7: clubName.santafe,
    8: clubName.oncecaldas,
    9: clubName.caracas,10: clubName.tachira,11: clubName.laGuaira,
    12: clubName.barcelonaequ,13: clubName.emelec,14: clubName.ldu,15: clubName.idelvalle,
  },

  //AMÉRICA DO NORTE
  LeagueOfficialNames().mexico : {
    0: clubName.americamex,1: clubName.atlas,2: clubName.chivas,3: clubName.cruzazul,
    4: clubName.juarez,5: clubName.leon,6: clubName.monterrey,7: clubName.necaxa,
    8: clubName.pachuca,9: clubName.puebla,10: clubName.pumas,11: clubName.queretaro,
    12: clubName.santosLaguna,13: clubName.tigres,14: clubName.tijuana,15: clubName.toluca,
  },
  LeagueOfficialNames().estadosUnidos : {
    0: clubName.atlanta,1: clubName.columbuscrew,2:clubName.dcunited,3: clubName.fcdallas,
    4: clubName.intermiami,5: clubName.losangelesfc,6: clubName.lagalaxy,7: clubName.minnesota,
    8: clubName.nerevolution,9: clubName.nycity,10: clubName.nyredbulls,11: clubName.orlando,
    12: clubName.portland,13: clubName.seattle,14: clubName.toronto,15:clubName.vancouver,
    16: clubName.montreal,17:clubName.colorado,18:clubName.houston,19:clubName.kansas,
  },

  //RESTO DO MUNDO
  LeagueOfficialNames().asia : {
    0: clubName.shanghaisipg,1: clubName.shandong,2: clubName.kashimaantlers,3: clubName.kawasakifrontale,
    4: clubName.urawareddiamonds,5: clubName.visselkobe,6: clubName.jeonbuk,7: clubName.pohang,
    8: clubName.alhilal,9: clubName.alIttihad,10: clubName.alnassr,11: clubName.alahli,
    12: clubName.alsadd,13: clubName.alduhail,14: clubName.alain,15: clubName.aljazira,
    16:clubName.alWahda,17:clubName.persepolis,18: clubName.ulsan,19: clubName.fcseoul,
  },
  LeagueOfficialNames().africa : {
    0: clubName.alahly,1: clubName.zamalek,2: clubName.mazembe,3: clubName.esperance,
    4: clubName.rajacasablanca,5: clubName.wydad,6: clubName.orlandopirates,7: clubName.kaizer,
    8: clubName.mamelodi,9: clubName.agosto,10:clubName.sydneyFC,11:clubName.melbournevictory,
    12:clubName.essetif,13:clubName.cotonsport,
  },
  LeagueOfficialNames().outros : {
    0: clubName.bate,1: clubName.sheriffTiraspol,2: clubName.gent,3: clubName.lechPoznan,
    4: clubName.joinville, 5: clubName.juventusMooca, 6: clubName.paulista, 7: clubName.ibis,
    8: clubName.arsenalsarandi, 9: clubName.tigre,10: clubName.saprissa,11: clubName.olimpiaHON,
    12:clubName.cerezoOsaka,13:clubName.auckland,
  },

};
