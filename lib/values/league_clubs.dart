import 'package:fifa/values/club_names.dart';

import 'league_names.dart';

ClubName clubName = ClubName();

/////////////
//default teams
//Esses times tem que ser jogaveis
List defaultChampionsLeagueClubs = [
  clubName.bayernmunique,clubName.manutd,clubName.copenhague,clubName.galatasaray,
  clubName.sevilla,clubName.arsenal,clubName.psv,clubName.lens,
  clubName.napoli,clubName.realmadrid,clubName.braga,clubName.unionberlin,
  clubName.benfica,clubName.inter,clubName.rbsalzburg,clubName.realsociedad,
  clubName.feyenoord,clubName.atleticomadrid,clubName.lazio,clubName.celtic,
  clubName.psg,clubName.dortmund,clubName.milan,clubName.newcastle,
  clubName.mancity,clubName.rbleipzig,clubName.estrelavermelha,clubName.youngboys,
  clubName.barcelona,clubName.porto,clubName.shakhtardonetsk,clubName.royalantwerp,
];

List defaultEuropaLeagueClubs = [
  clubName.westham,clubName.olympiacos,clubName.freiburg,clubName.slovanbratislava,
  clubName.ajax,clubName.om,clubName.brighton,clubName.aek,
  clubName.rangers,clubName.realbetis,clubName.spartapraga,clubName.apoel,
  clubName.atalanta,clubName.sporting,clubName.ifkgoteborg,clubName.legiawarszawa,
  clubName.liverpool,clubName.lasklinz,clubName.saintgilloise,clubName.toulouse,
  clubName.villareal,clubName.rennes,clubName.maccabihaifa,clubName.panathinaikos,
  clubName.roma,clubName.slaviapraha,clubName.sherifftiraspol,clubName.basel,
  clubName.leverkusen,clubName.qarabag,clubName.molde,clubName.hacken,
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
    4: clubName.brighton,5: clubName.burnley,6: clubName.chelsea,7: clubName.crystalpalace,
    8: clubName.everton,9: clubName.fulham,10: clubName.liverpool,11: clubName.luton,
    12: clubName.mancity,13: clubName.manutd,14: clubName.newcastle,15: clubName.nottinghamforest,
    16: clubName.sheffieldunited,17: clubName.tottenham,18: clubName.westham,19: clubName.wolves,
  },
  LeagueOfficialNames().inglaterra2 : {
    0: clubName.birmigham,1: clubName.blackburn,2: clubName.bristol,3: clubName.cardiffcity,
    4: clubName.coventry,5: clubName.huddersfield,6: clubName.hullcity,7: clubName.leeds,
    8: clubName.leicester,9: clubName.middlesbrough,10: clubName.millwall, 11: clubName.norwich,
    12: clubName.qpr,13: clubName.prestonnorthend, 14: clubName.southampton, 15: clubName.stoke,
    16: clubName.sunderland,17:clubName.swansea,18: clubName.watford,19:clubName.westbromwich,
  },
  LeagueOfficialNames().inglaterra3 : {
    0:clubName.blackpool,1:clubName.bolton,2: clubName.charlton, 3: clubName.derbycount,
    4:clubName.ipswich, 5:clubName.peterborough,6:clubName.plymouth, 7:clubName.portsmouth,
    8:clubName.reading, 9:clubName.rotherham,10:clubName.sheffieldwednesday, 11:clubName.wigan,
  },
  LeagueOfficialNames().italia1 : {
    0: clubName.atalanta, 1: clubName.bologna,2: clubName.cremonese,3: clubName.empoli,
    4: clubName.fiorentina,5: clubName.frosinone,6: clubName.genoa,7: clubName.hellasverona,
    8: clubName.inter,9: clubName.juventus,10: clubName.lazio,11: clubName.lecce,
    12: clubName.milan,13: clubName.monza,14: clubName.napoli,15: clubName.roma,
    16: clubName.salernitana,17: clubName.sassuolo,18: clubName.torino,19: clubName.udinese,
  },
  LeagueOfficialNames().italia2 : {
    0: clubName.ascoli, 1: clubName.bari,2: clubName.benevento,3: clubName.brescia,
    4: clubName.cagliari,5: clubName.como,6: clubName.crotone,7: clubName.palermo,
    8: clubName.parma,9: clubName.perugia,10: clubName.pisa,11: clubName.reggina,
    12: clubName.sampdoria,13: clubName.spal,14: clubName.spezia,15: clubName.venezia,
  },
  LeagueOfficialNames().espanha1 : {
    0: clubName.alaves,1: clubName.almeria,2: clubName.athleticbilbao,3: clubName.atleticomadrid,
    4: clubName.barcelona,5: clubName.cadiz,6: clubName.celtavigo,7: clubName.getafe,
    8: clubName.girona,9: clubName.granada,10: clubName.laspalmas,11: clubName.mallorca,
    12: clubName.osasuna,13: clubName.rayovallecano,14: clubName.realbetis,15: clubName.realmadrid,
    16: clubName.realsociedad,17: clubName.sevilla,18: clubName.valencia,19: clubName.villareal,
  },
  LeagueOfficialNames().espanha2 : {
    0: clubName.eibar,1: clubName.elche,2: clubName.espanyol,3: clubName.ibiza,
    4: clubName.lacoruna,5: clubName.leganes,6: clubName.levante,7: clubName.malaga,
    8: clubName.sportinggijon,9: clubName.tenerife,10: clubName.valladolid,11: clubName.zaragoza,
  },
  LeagueOfficialNames().alemanha1 : {
    0: clubName.augsburg,1: clubName.leverkusen,2: clubName.bayernmunique,3: clubName.dortmund,
    4: clubName.bochum,5: clubName.moenchengladbach,6: clubName.koln,7: clubName.hannover96,
    8: clubName.darmstadt,9: clubName.eintrachtfrankfurt,10: clubName.freiburg,11: clubName.hoffenheim,
    12: clubName.mainz05,13: clubName.rbleipzig,14: clubName.stuttgart,15: clubName.unionberlin,
    16: clubName.werderbremen,17: clubName.wolfsburg,
  },
  LeagueOfficialNames().alemanha2 : {
    0: clubName.arminiabiefeld,1: clubName.dynamodresden,2: clubName.fortunadusseldorf,3: clubName.hamburgo,
    4: clubName.herthaberlim,5: clubName.kaiserslautern,6: clubName.nurnberg,7: clubName.paderborn,
    8: clubName.schalke04,9: clubName.stpauli,
  },
  LeagueOfficialNames().franca1 : {
    0: clubName.brest,1: clubName.clermont,2: clubName.lens,3: clubName.lehavre,
    4: clubName.lille,5: clubName.lorient,6: clubName.lyon,7: clubName.metz,
    8: clubName.monaco,9: clubName.montpellier,10: clubName.nantes,11: clubName.nice,
    12: clubName.om,13: clubName.psg,14: clubName.reims,15: clubName.rennes,
    16: clubName.strasbourg,17: clubName.toulouse,
  },
  LeagueOfficialNames().franca2 : {
    0: clubName.ajaccio,1: clubName.angers, 2: clubName.auxerre,3: clubName.bastia,
    4: clubName.bordeaux,5: clubName.caen,6: clubName.dijon,7: clubName.guingamp,
    8:clubName.nimes, 9:clubName.parisfc, 10:clubName.saintetienne, 11:clubName.troyes,
  },
  LeagueOfficialNames().portugal : {
    0: clubName.benfica,1: clubName.porto,2: clubName.sporting,3: clubName.braga,
    4: clubName.belenenses,5: clubName.boavista,6: clubName.coimbra,7: clubName.gilvicente,
    8: clubName.famalicao,9: clubName.maritimo,10: clubName.portimonense,11: clubName.vitoriaguimaraes,
  },

  LeagueOfficialNames().holanda : {
    0: clubName.ajax,1: clubName.psv,2: clubName.feyenoord,3: clubName.az,
    4: clubName.heerenveen,5: clubName.twente,6: clubName.utrecht,7: clubName.vitesse,
    8: clubName.anderlecht,9: clubName.brugge,10: clubName.genk,11: clubName.gent,
    12: clubName.royalantwerp, 13: clubName.standardliege,
  },

  LeagueOfficialNames().turquiaGrecia : {
    0: clubName.olympiacos,1: clubName.aek,2: clubName.paok,3: clubName.panathinaikos,
    4: clubName.besiktas,5: clubName.fenerbahce,6: clubName.galatasaray,7: clubName.istanbulbasaksehir,
    8: clubName.trabzonspor,9: clubName.apoel,10:clubName.maccabihaifa,11:clubName.vardar,
  },
  LeagueOfficialNames().ligaEuropa : {
    0: clubName.celtic,1: clubName.rangers,2: clubName.slaviapraha,3: clubName.spartapraga,
    4: clubName.basel,5: clubName.zurich,6: clubName.youngboys,7: clubName.legiawarszawa,
    8: clubName.rakowczestochowa,9: clubName.rapidwien,10: clubName.rbsalzburg,11: clubName.copenhague,
    12: clubName.midtjylland,13: clubName.molde,14: clubName.rosenborg,15: clubName.helsinki,
    16: clubName.viktoriaplzen,17: clubName.hacken,18: clubName.malmo,19: clubName.ifkgoteborg,
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
    4: clubName.huachipato,5: clubName.colocolo,6: clubName.lau,7: clubName.palestino,
    8: clubName.univcatolica,9: clubName.bolivar,10: clubName.thestrongest,11: clubName.alianzalima,
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
    0: clubName.bate, 1: clubName.cluj,2: clubName.lasklinz,3: clubName.lechpoznan,
    4: clubName.maccabitelaviv, 5: clubName.saintgilloise, 6: clubName.sherifftiraspol,7: clubName.voltaredonda,
    8:clubName.patronato, 9:clubName.tigre, 10:clubName.jorge, 11:clubName.unionespanola,
  },
  LeagueOfficialNames().outros2 : {
    0:clubName.saprissa, 1:clubName.olimpiaHON,2:clubName.cincinnati, 3:clubName.charlotte,
    4:clubName.nashville, 5:clubName.montreal, 6:clubName.toronto, 7:clubName.vancouver,
    8:clubName.auckland, 9:clubName.alshabab, 10:clubName.alahli, 11:clubName.shanghaishenhua,
  },
  LeagueOfficialNames().lendas : {
    0:clubName.legends, 1:clubName.galatics, 2:clubName.veterans, 3:clubName.santos62,
    4: clubName.flamengo81, 5: clubName.napoli89, 6: clubName.palmeiras99,7: clubName.boca03,
    8: clubName.arsenal03, 9: clubName.juventus03, 10: clubName.real04, 11: clubName.porto04,
    12: clubName.milan05, 13: clubName.barcelona06, 14: clubName.chelsea08, 15: clubName.manutd09,
    16: clubName.inter09,17: clubName.dortmund13,
  },

};
