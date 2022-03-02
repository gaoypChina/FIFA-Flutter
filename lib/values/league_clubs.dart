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
  clubName.palmeiras,clubName.velezsarsfield,clubName.barcelonaequ,clubName.bolivar,
  clubName.atleticomg,clubName.monterrey,clubName.colocolo,clubName.sportingcristal,
  clubName.bocajuniors,clubName.fortaleza,clubName.americamg,clubName.millonarios,
  clubName.atleticopr,clubName.penarol,clubName.americamex,clubName.cerroporteno,
  clubName.fluminense,clubName.nacional,clubName.colon,clubName.caracas,
  clubName.riverplate,clubName.bragantino,clubName.univcatolica,clubName.idelvalle,
  clubName.corinthians,clubName.tigres,clubName.atleticonacional,clubName.junior,
  clubName.flamengo,clubName.talleres,clubName.libertad,clubName.emelec,
];

///////////////////////////////////////////////////////////
//  CLUBS IN EACH LEAGUE
//////////////////////////////////////////////////////////
Map clubNameMapPermanent = Map.from(clubNameMap);
Map clubNameMap = {
  LeagueOfficialNames().inglaterra1 : {
    0: clubName.arsenal,1: clubName.astonvilla,2: clubName.chelsea,3: clubName.crystalpalace,
    4: clubName.everton,5: clubName.leedsunited,6: clubName.leicester,7: clubName.liverpool,
    8: clubName.manchestercity,9: clubName.manchesterunited,10: clubName.newcastle,11: clubName.tottenham,
    12: clubName.southampton,13: clubName.westbromwich,14: clubName.westham,15: clubName.wolves,
  },
  LeagueOfficialNames().inglaterra2 : {
    0: clubName.birmigham,1: clubName.blackburn,2: clubName.bournemouth,3: clubName.burnley,
    4: clubName.brighton,5: clubName.derbycount,6: clubName.fulham,7: clubName.middlesbrough,
    8: clubName.norwich,9: clubName.nottinghamforest,10: clubName.qpr, 11: clubName.reading,
    12: clubName.sheffieldunited,13: clubName.stoke, 14: clubName.swansea, 15: clubName.watford,
  },
  LeagueOfficialNames().italia1 : {
    0: clubName.atalanta, 1: clubName.bologna,2: clubName.cagliari,3: clubName.fiorentina,
    4: clubName.genoa,5: clubName.inter,6: clubName.juventus,7: clubName.milan,
    8: clubName.lazio,9: clubName.napoli,10: clubName.parma,11: clubName.roma,
    12: clubName.sampdoria,13: clubName.sassuolo,14: clubName.torino,15: clubName.udinese,
  },
  LeagueOfficialNames().espanha1 : {
    0: clubName.athleticbilbao,1: clubName.atleticomadrid,2: clubName.barcelona,3: clubName.celtavigo,
    4: clubName.espanyol,5: clubName.getafe,6: clubName.lacoruna,7: clubName.levante,
    8: clubName.osasuna,9: clubName.realbetis,10: clubName.realmadrid,11: clubName.realsociedad,
    12: clubName.sevilla,13: clubName.valencia,14: clubName.valladolid,15: clubName.villareal,
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
    12: clubName.metz,13: clubName.anderlecht,14: clubName.brugge,15: clubName.standardliege,
  },
  LeagueOfficialNames().ligaEuropa : {
    0: clubName.benfica,1: clubName.porto,2: clubName.sporting,3: clubName.braga,
    4: clubName.vitoriaguimaraes,5: clubName.ajax,6: clubName.feyenoord,7: clubName.psv,
    8: clubName.celtic,9: clubName.glasgowrangers,10: clubName.rosemborg,11: clubName.malmo,
    12: clubName.copenhague,13: clubName.rbsalzburg,14: clubName.rapidviena,15: clubName.basel,
  },
  LeagueOfficialNames().lesteEuropeu : {
    0: clubName.zenit,1: clubName.cska,2: clubName.krasnodar,3: clubName.spartakmoscou,
    4: clubName.galatasaray,5: clubName.fenerbahce,6: clubName.besiktas,7: clubName.olympiakos,
    8: clubName.estrelavermelha,9: clubName.partizan,10: clubName.ludogorets,11: clubName.dinamozagreb,
    12: clubName.shaktardonetsk,13: clubName.dinamokiev,14: clubName.spartapraga,15: clubName.apoel,
  },
  LeagueOfficialNames().brasil1 : {
    0: clubName.palmeiras,1: clubName.atleticogo,2: clubName.atleticomg, 3: clubName.atleticopr,
    4: clubName.botafogo,5: clubName.bragantino,6: clubName.ceara,7: clubName.corinthians,
    8: clubName.coritiba,9: clubName.flamengo,10: clubName.fluminense,11: clubName.fortaleza,
    12: clubName.goias,13: clubName.internacional,14: clubName.santos,15: clubName.saopaulo,
  },
  LeagueOfficialNames().brasil2 : {
    0: clubName.americamg,1: clubName.bahia,2: clubName.chapecoense,3: clubName.cuiaba,
    4: clubName.criciuma,5: clubName.cruzeiro,6: clubName.figueirense,7: clubName.gremio,
    8: clubName.guarani,9: clubName.juventude,10: clubName.nautico,11: clubName.parana,
    12: clubName.pontepreta,13: clubName.sport,14: clubName.vasco,15: clubName.vitoria,
  },
  LeagueOfficialNames().brasil3 : {
    0: clubName.avai,1: 'Brasil Pelotas',2: 'Brusque',3: 'CRB',
    4: 'CSA',5: 'Ituano',6: 'Londrina',7: 'Manaus',
    8: 'Novorizontino',9: 'Operário-PR',10: 'Paysandu',11: 'Portuguesa',
    12: 'Remo',13: 'Sampaio Corrêa',14: 'Santa Cruz',15: 'Vila Nova',
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
    8: clubName.bolivar,9: clubName.idelvalle,10: clubName.sportingcristal,11: clubName.cienciano,
    12: clubName.barcelonaequ,13: clubName.emelec,14: clubName.ldu,15: clubName.caracas,
  },
  LeagueOfficialNames().colombiaMexico : {
    0: clubName.americadecali,1: clubName.atleticonacional,2: clubName.deportivocali,3: clubName.junior,
    4: clubName.imedellin,5: clubName.oncecaldas,6: clubName.millonarios,7: clubName.santafe,
    8: clubName.americamex,9: clubName.chivasguadalajara,10: clubName.cruzazul,11: clubName.monterrey,
    12: clubName.pachuca,13: clubName.pumas,14: clubName.tigres,15: clubName.toluca,
  },
  LeagueOfficialNames().estadosUnidos : {
    0: clubName.atlantaunited,1: clubName.columbuscrew,2:clubName.dcunited,3: clubName.fcdallas,
    4: clubName.intermiami,5: clubName.losangelesfc,6: clubName.lagalaxy,7: clubName.minnesota,
    8: clubName.nerevolution,9: clubName.nycity,10: clubName.nyredbulls,11: clubName.orlando,
    12: clubName.portland,13: clubName.seattle,14: clubName.torontofc,15:clubName.vancouver,
  },
  LeagueOfficialNames().asia : {
    0: clubName.ghuagzhouevergrande,1: clubName.beijingguoan,2: clubName.shandongluneng,3: clubName.shanghaisipg,
    4: clubName.kashimaantlers,5: clubName.urawareddiamonds,6: clubName.visselkobe,7: clubName.kawasakifrontale,
    8: clubName.fcseoul,9: clubName.jeonbuk,10: clubName.alnassr,11: clubName.alain,
    12: clubName.alsadd,13: clubName.alduhail,14: clubName.alahli,15: clubName.alhilal,
  },
  LeagueOfficialNames().africa : {
    0: clubName.alahly,1: 'Espérance',2: 'Kaiser Chiefs',3: 'Mazembe',
    4: 'Mamelodi Sundowns',5: 'Orlando Pirates',6: clubName.rajacasablanca,7: 'Simba',
    8: 'Wydad',9: clubName.zamalek
  },
  LeagueOfficialNames().outros : {
    0: 'Avaí',1: 'Paysandu',2: 'Santa Cruz',3: 'Hull City',
    4: 'Huracán',5: clubName.alianzalima,
  }
};
