import 'package:fifa/values/club_names.dart';

import 'league_names.dart';

ClubName clubName = ClubName();

/////////////
//default teams
//Esses times tem que ser jogaveis
List defaultChampionsLeagueClubs = [
  clubName.ajax,clubName.liverpool,clubName.napoli,clubName.rangers,
  clubName.porto,clubName.atleticomadrid,clubName.leverkusen,clubName.brugge,
  clubName.bayernmunique,clubName.barcelona,clubName.inter,clubName.slaviapraha,
  clubName.eintrachtfrankfurt,clubName.tottenham,clubName.sporting,clubName.om,
  clubName.milan,clubName.chelsea,clubName.rbsalzburg,clubName.dinamozagreb,
  clubName.realmadrid,clubName.rbleipzig,clubName.shakhtardonetsk,clubName.celtic,
  clubName.mancity,clubName.sevilla,clubName.dortmund,clubName.copenhague,
  clubName.psg,clubName.juventus,clubName.benfica,clubName.maccabitelaviv,
];

List defaultEuropaLeagueClubs = [
  clubName.arsenal,clubName.psv,clubName.rosenborg,clubName.zurich,
  clubName.fenerbahce,clubName.rennes,clubName.dinamokiev,clubName.aek,
  clubName.realbetis,clubName.roma,clubName.ludogorets,clubName.helsinki,
  clubName.gent,clubName.malmo,clubName.unionberlin,clubName.braga,
  clubName.manutd,clubName.realsociedad,clubName.sherifftiraspol,clubName.apoel,
  clubName.feyenoord,clubName.lazio,clubName.midtjylland,clubName.rapidwien,
  clubName.nantes,clubName.qarabag,clubName.freiburg,clubName.olympiacos,
  clubName.monaco,clubName.ferencvaros,clubName.estrelavermelha,clubName.trabzonspor,
];

List defaultLibertadoresClubs = [
  clubName.flamengo,clubName.lau,clubName.racing,clubName.aucas,
  clubName.nacional,clubName.imedellin,clubName.internacional,clubName.metropolitanos,
  clubName.palmeiras,clubName.cerroporteno,clubName.barcelonaequ,clubName.bolivar,
  clubName.riverplate,clubName.sportingcristal,clubName.fluminense,clubName.thestrongest,
  clubName.idelvalle,clubName.danubio,clubName.corinthians,clubName.argentinojuniors,
  clubName.bocajuniors,clubName.deportivocali,clubName.colocolo,clubName.monagas,
  clubName.atleticopr,clubName.atleticomg,clubName.libertad,clubName.alianzalima,
  clubName.atleticonacional,clubName.melgar,clubName.olimpia,clubName.patronato,
];

List defaultSulAmericanaClubs = [
  clubName.ldu,clubName.monterrey,clubName.botafogo,clubName.lagalaxy,
  clubName.emelec,clubName.huracan,clubName.guaraniPAR,clubName.cruzazul,
  clubName.estudiantes,clubName.toluca,clubName.bragantino,clubName.orientepetrolero,
  clubName.tolima,clubName.tigre,clubName.saopaulo,clubName.caracas,
  clubName.newells,clubName.atlanta,clubName.santos,clubName.cienciano,
  clubName.defensayjusticia,clubName.americamg,clubName.penarol,clubName.millonarios,
  clubName.santafe,clubName.gimnasia,clubName.universitario,clubName.goias,
  clubName.sanlorenzo,clubName.fortaleza,clubName.palestino,clubName.estudiantesmerida,
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
    12: clubName.mancity,13: clubName.manutd,14: clubName.newcastle,15: clubName.nottinghamforest,
    16: clubName.tottenham,17: clubName.southampton,18: clubName.westham,19: clubName.wolves,
  },
  LeagueOfficialNames().inglaterra2 : {
    0: clubName.birmigham,1: clubName.blackburn,2: clubName.burnley,3: clubName.bristol,
    4: clubName.cardiffcity,5: clubName.coventry,6: clubName.huddersfield,7: clubName.hullcity,
    8: clubName.luton,9: clubName.middlesbrough,10: clubName.norwich, 11: clubName.qpr,
    12: clubName.prestonnorthend,13: clubName.reading, 14: clubName.sheffieldunited, 15: clubName.stoke,
    16: clubName.sunderland,17:clubName.swansea,18: clubName.watford,19:clubName.westbromwich,
  },
  LeagueOfficialNames().inglaterra3 : {
    0:clubName.blackpool,1:clubName.charlton,2: clubName.derbycount, 3: clubName.ipswich,
    4:clubName.peterborough, 5:clubName.plymouth,6:clubName.portsmouth, 7:clubName.rotherham,
    8:clubName.bolton, 9:clubName.sheffieldwednesday,10:clubName.millwall, 11:clubName.wigan,
  },
  LeagueOfficialNames().italia1 : {
    0: clubName.atalanta, 1: clubName.bologna,2: clubName.cremonese,3: clubName.empoli,
    4: clubName.fiorentina,5: clubName.monza,6: clubName.hellasverona,7: clubName.inter,
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
    4: clubName.cadiz,5: clubName.celtavigo,6: clubName.elche,7: clubName.espanyol,
    8: clubName.getafe,9: clubName.girona,10: clubName.mallorca,11: clubName.osasuna,
    12: clubName.rayovallecano,13: clubName.realbetis,14: clubName.realmadrid,15: clubName.realsociedad,
    16: clubName.sevilla,17: clubName.valencia,18: clubName.valladolid,19: clubName.villareal,
  },
  LeagueOfficialNames().espanha2 : {
    0: clubName.alaves,1: clubName.eibar,2: clubName.granada,3: clubName.ibiza,
    4: clubName.lacoruna,5: clubName.laspalmas,6: clubName.leganes,7: clubName.levante,
    8: clubName.malaga,9: clubName.sportinggijon,10: clubName.tenerife,11: clubName.zaragoza,
  },
  LeagueOfficialNames().alemanha1 : {
    0: clubName.augsburg,1: clubName.leverkusen,2: clubName.bayernmunique,3: clubName.dortmund,
    4: clubName.bochum,5: clubName.moenchengladbach,6: clubName.koln,7: clubName.eintrachtfrankfurt,
    8: clubName.freiburg,9: clubName.herthaberlim,10: clubName.hoffenheim,11: clubName.mainz05,
    12: clubName.rbleipzig,13: clubName.schalke04,14: clubName.stuttgart,15: clubName.unionberlin,
    16: clubName.werderbremen,17: clubName.wolfsburg,
  },
  LeagueOfficialNames().alemanha2 : {
    0: clubName.arminiabiefeld,1: clubName.darmstadt,2: clubName.dynamodresden,3: clubName.fortunadusseldorf,
    4: clubName.hamburgo,5: clubName.hannover96,6: clubName.kaiserslautern,7: clubName.nurnberg,
    8: clubName.paderborn,9: clubName.stpauli, 
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
    4: clubName.nimes,5: clubName.parisfc,6: clubName.saintetienne,7: clubName.troyes,
  },
  LeagueOfficialNames().portugal : {
    0: clubName.benfica,1: clubName.porto,2: clubName.sporting,3: clubName.braga,
    4: clubName.belenenses,5: clubName.boavista,6: clubName.coimbra,7: clubName.gilvicente,
    8: clubName.famalicao,9: clubName.maritimo,10: clubName.portimonense,11: clubName.vitoriaguimaraes,
  },

  LeagueOfficialNames().holanda : {
    0: clubName.ajax,1: clubName.psv,2: clubName.feyenoord,3: clubName.az,
    4: clubName.heerenveen,5: clubName.twente,6: clubName.utrecht,7: clubName.vitesse,
    8: clubName.anderlecht,9: clubName.brugge,10: clubName.genk,11: clubName.standardliege,
  },

  LeagueOfficialNames().turquiaGrecia : {
    0: clubName.olympiacos,1: clubName.aek,2: clubName.paok,3: clubName.panathinaikos,
    4: clubName.besiktas,5: clubName.fenerbahce,6: clubName.galatasaray,7: clubName.istanbulbasaksehir,
    8: clubName.trabzonspor,9: clubName.apoel,10:clubName.maccabitelaviv,11:clubName.vardar,
  },
  LeagueOfficialNames().ligaEuropa : {
    0: clubName.celtic,1: clubName.rangers,2: clubName.slaviapraha,3: clubName.spartapraga,
    4: clubName.basel,5: clubName.zurich,6: clubName.youngboys,7: clubName.legiawarszawa,
    8: clubName.rapidwien,9: clubName.rbsalzburg,10: clubName.malmo,11: clubName.midtjylland,
    12: clubName.copenhague,13: clubName.molde,14: clubName.rosenborg,15: clubName.helsinki,
    16: clubName.viktoriaplzen,17: clubName.ifkgoteborg,
  },
  LeagueOfficialNames().lesteEuropeu : {
    0: clubName.cska,1: clubName.dinamoMoscou,2: clubName.krasnodar,3: clubName.lokomotivMoscou,
    4: clubName.rubinKazan,5: clubName.sochi,6: clubName.spartakmoscou,7: clubName.zenit,
    8: clubName.dinamokiev,9: clubName.shakhtardonetsk,10: clubName.estrelavermelha,11: clubName.partizan,
    12: clubName.dinamozagreb,13: clubName.steauabucuresti,14: clubName.cskasofia,15: clubName.ludogorets,
    16: clubName.astana,17: clubName.qarabag,18:clubName.slovanbratislava,19:clubName.ferencvaros,
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
    8: clubName.juventude,9: clubName.novorizontino,10: clubName.guarani,11: clubName.ituano,
    12: clubName.londrina,13: clubName.mirassol,14: clubName.pontepreta,15: clubName.sampaio,
    16: clubName.sport,17:clubName.tombense,18:clubName.vilanova,19:clubName.vitoria,
  },
  LeagueOfficialNames().brasil3 : {
    0: clubName.botafogoPB,1: clubName.brusque,2: clubName.csa,3:clubName.figueirense,
    4: clubName.manaus,5: clubName.nautico,6: clubName.operarioPR,7: clubName.paysandu,
    8: clubName.portuguesa,9: clubName.remo,
  },
  LeagueOfficialNames().brasil4 : {
    0: clubName.bangu,1: clubName.brasiliense,2: clubName.brasilPelotas,3: clubName.campinense,
    4: clubName.caxias,5: clubName.ferroviaria,6: clubName.ibis,7: clubName.joinville,
    8: clubName.juventusMooca,9: clubName.parana,10: clubName.paulista,11: clubName.santacruz,
    12: clubName.santoandre,13: clubName.saocaetano,
  },
  LeagueOfficialNames().argentina : {
    0: clubName.argentinojuniors,1: clubName.atleticotucuman,2: clubName.banfield,3: clubName.bocajuniors,
    4: clubName.colon,5: clubName.defensayjusticia,6: clubName.estudiantes,7: clubName.gimnasia,
    8: clubName.godoycruz,9: clubName.huracan,10: clubName.independiente,11: clubName.lanus,
    12: clubName.newells,13: clubName.racing,14: clubName.riverplate,15:clubName.rosario,
    16: clubName.sanlorenzo,17:clubName.talleres,18: clubName.unionsantafe,19: clubName.velez,
  },
  LeagueOfficialNames().mercosul : {
    0: clubName.cerroporteno,1: clubName.olimpia,2: clubName.guaraniPAR,3: clubName.libertad,
    4: clubName.colocolo,5: clubName.lau,6: clubName.palestino,7: clubName.univcatolica,
    8: clubName.alwaysready,9: clubName.bolivar,10: clubName.thestrongest,11: clubName.alianzalima,
    12: clubName.cienciano,13: clubName.orientepetrolero,14: clubName.melgar,15: clubName.sportingcristal,
    16: clubName.universitario,17: clubName.danubio,18: clubName.nacional,19: clubName.penarol,
  },
  LeagueOfficialNames().colombia : {
    0: clubName.americadecali,1: clubName.atleticonacional,2: clubName.deportivocali,3: clubName.junior,
    4: clubName.imedellin,5: clubName.tolima,6: clubName.millonarios,7: clubName.santafe,
    8: clubName.oncecaldas,
    9: clubName.caracas,
    10: clubName.tachira,11: clubName.estudiantesmerida, 12:clubName.laguaira, 13:clubName.metropolitanos,
    14: clubName.monagas,
    15: clubName.aucas,
    16: clubName.barcelonaequ,17: clubName.emelec,18: clubName.idelvalle, 19: clubName.ldu,

  },

  //AMÉRICA DO NORTE
  LeagueOfficialNames().mexico : {
    0: clubName.americamex,1: clubName.atlas,2: clubName.chivas,3: clubName.cruzazul,
    4: clubName.juarez,5: clubName.leon,6: clubName.monterrey,7: clubName.necaxa,
    8: clubName.pachuca,9: clubName.puebla,10: clubName.pumas,11: clubName.queretaro,
    12: clubName.santoslaguna,13: clubName.tigres,14: clubName.tijuana,15: clubName.toluca,
  },
  LeagueOfficialNames().estadosUnidos : {
    0: clubName.atlanta,1: clubName.austin,2:clubName.chicago,3: clubName.columbuscrew,
    4: clubName.coloradorapids,5: clubName.fcdallas,6: clubName.dcunited,7: clubName.houston,
    8: clubName.intermiami,9: clubName.kansas,10: clubName.lagalaxy,11: clubName.losangelesfc,
    12: clubName.minnesota,13: clubName.nerevolution,14: clubName.nycity,15:clubName.nyredbulls,
    16: clubName.orlando,17:clubName.philadelphia,18:clubName.portland,19:clubName.seattle,
  },

  //RESTO DO MUNDO
  LeagueOfficialNames().asia : {
    0: clubName.shanghaisipg,1: clubName.shandong,2: clubName.kashimaantlers,3: clubName.kawasakifrontale,
    4: clubName.urawareddiamonds,5: clubName.visselkobe,6: clubName.jeonbuk,7: clubName.pohang,
    8: clubName.alhilal,9: clubName.alittihad,10: clubName.alnassr,11: clubName.alrayyan,
    12: clubName.alsadd,13: clubName.alduhail,14: clubName.alain,15: clubName.aljazira,
    16:clubName.alwahda,17:clubName.persepolis,18: clubName.ulsan,19: clubName.fcseoul,
  },
  LeagueOfficialNames().africa : {
    0: clubName.alahly,1: clubName.zamalek,2: clubName.omdurman,3: clubName.esperance,
    4: clubName.rajacasablanca,5: clubName.wydad,6: clubName.belouizdad,7: clubName.essetif,
    8: clubName.mazembe,9: clubName.agosto,10:clubName.mamelodi,11:clubName.kaizer,
    12:clubName.orlandopirates,13:clubName.cotonsport, 14: clubName.sydneyFC,15: clubName.melbournevictory,
  },
  LeagueOfficialNames().outros : {
    0: clubName.bate, 1: clubName.cluj,2: clubName.gent,3: clubName.lechpoznan,
    4: clubName.sherifftiraspol, 5: clubName.arsenalsarandi, 6: clubName.tigre,7: clubName.patronato,
    8:clubName.voltaredonda, 9:clubName.jorge, 10:clubName.saprissa,11:clubName.olimpiaHON,
    12:clubName.charlotte, 13:clubName.montreal, 14:clubName.toronto, 15:clubName.vancouver,
    16:clubName.alshabab, 17:clubName.auckland,
  },
  LeagueOfficialNames().lendas : {
    0:clubName.legends, 1:clubName.galatics, 2:clubName.veterans, 3:clubName.santos62,
    4: clubName.flamengo81, 5: clubName.napoli89, 6: clubName.palmeiras99,7: clubName.boca03,
    8: clubName.arsenal03, 9: clubName.juventus03, 10: clubName.real04, 11: clubName.milan05,
    12: clubName.barcelona06, 13: clubName.chelsea08, 14: clubName.inter09, 15: clubName.manutd09,
  },

};
