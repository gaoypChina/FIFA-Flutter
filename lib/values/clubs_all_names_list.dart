
import 'package:fifa/values/club_names.dart';

ClubName clubName = ClubName();

List<String> clubsNotPlayable = clubsAllNameList.sublist(clubsAllNameList.length - 14);

///////////////////////////
// CLUBS
//A ordem vai ser a dos "IDs" no jogo
List<String> clubsAllNameList = [
  //england
  clubName.arsenal,  clubName.astonvilla,  clubName.chelsea,  clubName.crystalpalace,
  clubName.everton,  clubName.leeds,  clubName.leicester,  clubName.liverpool,
  clubName.mancity,  clubName.manutd,  clubName.newcastle,  clubName.tottenham,
  clubName.southampton,  clubName.westbromwich,  clubName.westham,  clubName.wolves,

  clubName.birmigham,  clubName.blackburn,  clubName.bournemouth,  clubName.burnley,
  clubName.brighton,  clubName.derbycount,  clubName.fulham,  clubName.middlesbrough,
  clubName.norwich,  clubName.nottinghamforest,  clubName.qpr,  clubName.reading,
  clubName.sheffieldunited,  clubName.stoke,  clubName.swansea,  clubName.watford,

  clubName.hullcity,clubName.sunderland,clubName.brentford,clubName.portsmouth,
  clubName.plymouth,clubName.millwall,clubName.huddersfield,clubName.charlton,
  clubName.bristol,clubName.prestonnorthend,clubName.bolton,clubName.luton,
  clubName.cardiffcity,clubName.rotherham,clubName.ipswich,clubName.coventry,
  clubName.peterborough,clubName.blackpool,clubName.sheffieldwednesday,clubName.wigan,
  //italy
  clubName.atalanta,  clubName.bologna,  clubName.cremonese,  clubName.fiorentina,
  clubName.genoa,  clubName.inter,  clubName.juventus,  clubName.milan,
  clubName.lazio,  clubName.napoli,  clubName.roma,  clubName.salernitana,
  clubName.sampdoria,  clubName.sassuolo,  clubName.torino,  clubName.udinese,

  clubName.bari,clubName.brescia,clubName.benevento,clubName.cagliari,
  clubName.crotone,clubName.empoli,clubName.hellasverona,clubName.lecce,
  clubName.monza,clubName.palermo,clubName.parma,clubName.perugia,
  clubName.pisa,clubName.spal,clubName.spezia,clubName.venezia,
  clubName.ascoli,clubName.frosinone,clubName.como,clubName.reggina,
  //spain
  clubName.athleticbilbao,  clubName.atleticomadrid,  clubName.barcelona,  clubName.celtavigo,
  clubName.espanyol,  clubName.getafe,  clubName.granada,  clubName.levante,
  clubName.osasuna,  clubName.realbetis,  clubName.realmadrid,  clubName.realsociedad,
  clubName.sevilla,  clubName.valencia,  clubName.valladolid,  clubName.villareal,

  clubName.alaves,clubName.almeria,clubName.cadiz,clubName.elche,
  clubName.girona,clubName.ibiza,clubName.lacoruna,clubName.laspalmas,
  clubName.zaragoza,clubName.malaga,clubName.mallorca,clubName.rayovallecano,
  clubName.sportinggijon,clubName.tenerife,clubName.elche,clubName.leganes,
  clubName.eibar,
  //germany
  clubName.moenchengladbach,  clubName.dortmund,  clubName.bayernmunique,  clubName.leverkusen,
  clubName.koln,  clubName.eintrachtfrankfurt,  clubName.freiburg,  clubName.hamburgo,
  clubName.augsburg,  clubName.herthaberlim,  clubName.hoffenheim,  clubName.rbleipzig,
  clubName.schalke04,  clubName.stuttgart,  clubName.werderbremen,  clubName.wolfsburg,

  clubName.arminiabiefeld,clubName.bochum,clubName.darmstadt,clubName.dynamodresden,
  clubName.kaiserslautern,clubName.mainz05,clubName.fortunadusseldorf,clubName.nurnberg,
  clubName.hannover96,clubName.paderborn,clubName.stpauli,clubName.unionberlin,
  //france
  clubName.angers,clubName.bordeaux,  clubName.lille,  clubName.lyon,
  clubName.montpellier,  clubName.nantes,  clubName.nice,  clubName.om,
  clubName.psg,  clubName.reims,  clubName.rennes,  clubName.saintetienne,
  clubName.metz,clubName.toulouse,clubName.lens,clubName.monaco,

  clubName.auxerre,clubName.ajaccio,clubName.brest,clubName.caen,
  clubName.clermont,clubName.dijon,clubName.lorient,clubName.nimes,
  clubName.strasbourg,clubName.troyes,clubName.parisfc,clubName.bastia,
  clubName.lehavre,clubName.guingamp,

  //portugal
  clubName.benfica,  clubName.porto,  clubName.sporting,  clubName.braga,
  clubName.boavista,clubName.maritimo,clubName.portimonense,clubName.vitoriaguimaraes,
  clubName.coimbra,clubName.famalicao,clubName.gilvicente,clubName.belenenses,
  //netherlands
  clubName.ajax,  clubName.feyenoord,  clubName.psv,clubName.az,
  clubName.twente,clubName.utrecht,clubName.vitesse,clubName.heerenveen,
  //turquia-grecia
  clubName.galatasaray,  clubName.fenerbahce,  clubName.besiktas,  clubName.istanbulbasaksehir,clubName.trabzonspor,
  clubName.olympiacos,clubName.aek,clubName.paok,clubName.panathinaikos,clubName.apoel,

  clubName.anderlecht,  clubName.brugge,  clubName.standardliege,clubName.genk,clubName.gent,
  clubName.celtic,  clubName.rangers,
  clubName.rbsalzburg,  clubName.rapidwien,
  clubName.basel,clubName.youngboys,clubName.zurich,
  clubName.rosenborg,  clubName.malmo, clubName.ifkgoteborg,
  clubName.copenhague,  clubName.midtjylland,
  clubName.helsinki,clubName.molde,
  clubName.legiawarszawa,clubName.lechpoznan,

  //russia
  clubName.zenit,  clubName.cska,  clubName.krasnodar,  clubName.spartakmoscou,
  clubName.sochi,clubName.rubinKazan,clubName.lokomotivMoscou,clubName.dinamoMoscou,

  clubName.bate,
  clubName.qarabag,clubName.astana,clubName.vardar,clubName.sherifftiraspol,
  clubName.estrelavermelha,  clubName.partizan,  clubName.ludogorets,  clubName.cskasofia,
  clubName.shakhtardonetsk,  clubName.dinamokiev,
  clubName.spartapraga,  clubName.slaviapraha, clubName.viktoriaplzen,
  clubName.dinamozagreb,clubName.cluj,clubName.slovanbratislava,clubName.ferencvaros,
  clubName.steauabucuresti,clubName.maccabitelaviv,

  //////////////////////////////////////////////////////
  //brasil
  clubName.palmeiras,  clubName.botafogo,  clubName.atleticomg,  clubName.atleticopr,
  clubName.bahia,  clubName.bragantino,  clubName.cruzeiro,  clubName.corinthians,
  clubName.flamengo,  clubName.fluminense,  clubName.fortaleza,  clubName.gremio,
  clubName.internacional,  clubName.santos,  clubName.saopaulo,  clubName.vasco,

  clubName.americamg,  clubName.atleticogo,  clubName.chapecoense,  clubName.coritiba,
  clubName.cuiaba,  clubName.criciuma,  clubName.ceara,  clubName.figueirense,
  clubName.goias,  clubName.guarani,  clubName.juventude,  clubName.nautico,
  clubName.parana,  clubName.pontepreta,  clubName.sport,  clubName.vitoria,

  clubName.brusque,clubName.tombense,
  clubName.avai, clubName.paysandu, clubName.santacruz, clubName.portuguesa,
  clubName.brusque,clubName.crb,clubName.csa,clubName.manaus,
  clubName.sampaio,clubName.vilanova,clubName.brasilPelotas,clubName.ituano,
  clubName.novorizontino,clubName.mirassol,clubName.operarioPR,
  clubName.londrina,clubName.remo,clubName.abc,clubName.saocaetano,clubName.santoandre,
  clubName.mirassol,clubName.botafogoSP,clubName.botafogoPB,clubName.caxias,
  clubName.bangu,clubName.joinville,clubName.paulista,clubName.campinense,
  clubName.brasiliense,clubName.ferroviaria,clubName.ibis,clubName.juventusMooca,
  clubName.voltaredonda,

  //argentina
  clubName.argentinojuniors,  clubName.banfield,  clubName.bocajuniors,
  clubName.colon,  clubName.defensayjusticia,  clubName.estudiantes,  clubName.independiente,
  clubName.lanus,  clubName.newells,  clubName.racing,  clubName.riverplate,
  clubName.rosario,  clubName.sanlorenzo,  clubName.talleres,  clubName.velez,
  clubName.huracan,clubName.gimnasia,clubName.unionsantafe,clubName.godoycruz,
  clubName.atleticotucuman,clubName.tigre,clubName.patronato,

  //MERCOSUL
  clubName.penarol,  clubName.nacional,  clubName.danubio,
  clubName.olimpia,  clubName.libertad,clubName.cerroporteno,clubName.guaraniPAR,
  clubName.univcatolica, clubName.colocolo,  clubName.lau,
  clubName.palestino,clubName.huachipato, clubName.unionespanola,
  clubName.bolivar, clubName.thestrongest,
  clubName.sportingcristal,  clubName.cienciano, clubName.alianzalima,clubName.universitario,
  clubName.jorge,clubName.melgar,clubName.orientepetrolero,

  //colombia
  clubName.americadecali,  clubName.atleticonacional, clubName.deportivocali,  clubName.junior,
  clubName.imedellin,  clubName.oncecaldas, clubName.millonarios,  clubName.santafe,
  clubName.tolima,
  //ecuador
  clubName.idelvalle, clubName.aucas,
  clubName.barcelonaequ,  clubName.emelec,  clubName.ldu,
  //venezuela
  clubName.caracas,clubName.tachira,clubName.laguaira,
  clubName.metropolitanos,clubName.monagas,clubName.estudiantesmerida,

  //Mexico
  clubName.americamex,  clubName.chivas, clubName.cruzazul,  clubName.monterrey,
  clubName.pachuca,  clubName.pumas, clubName.tigres,  clubName.toluca,
  clubName.tijuana,  clubName.santoslaguna, clubName.puebla,  clubName.necaxa,
  clubName.atlas,  clubName.queretaro, clubName.leon,  clubName.juarez,
  //USA
  clubName.atlanta,  clubName.columbuscrew, clubName.dcunited,  clubName.fcdallas,
  clubName.coloradorapids, clubName.chicago, clubName.austin, clubName.charlotte,
  clubName.houston,
  clubName.intermiami,  clubName.losangelesfc, clubName.lagalaxy,  clubName.minnesota,
  clubName.nerevolution,  clubName.nycity, clubName.nyredbulls,  clubName.orlando,
  clubName.philadelphia, clubName.portland,  clubName.seattle,  clubName.kansas,
  clubName.toronto,  clubName.vancouver, clubName.montreal,

  //Central America
  clubName.saprissa,clubName.olimpiaHON,
  ///////////////////////////////////////////
  //Asia
  clubName.pohang, clubName.fcseoul, clubName.ulsan,
  clubName.shandong,  clubName.shanghaisipg,
  clubName.kashimaantlers,  clubName.urawareddiamonds, clubName.visselkobe,  clubName.kawasakifrontale,

  //Middle East
  clubName.aljazira,  clubName.jeonbuk, clubName.alnassr,
  clubName.alain,clubName.alwahda, clubName.alshabab,
  clubName.alsadd,  clubName.alduhail, clubName.alrayyan,
  clubName.alhilal,clubName.alittihad,
  clubName.persepolis,

  //oceania
  clubName.melbournevictory,clubName.sydneyFC,clubName.auckland,

  //africa
  clubName.alahly, clubName.zamalek,clubName.rajacasablanca,clubName.wydad,
  clubName.esperance, clubName.essetif,
  clubName.belouizdad, clubName.omdurman,
  clubName.mamelodi,  clubName.orlandopirates,  clubName.kaizer,
  clubName.mazembe, clubName.agosto,  clubName.cotonsport,

  //outros
  clubName.galatics, clubName.legends, clubName.veterans,

  clubName.napoli89,
  clubName.arsenal03,
  clubName.juventus03,
  clubName.porto04,
  clubName.real04,
  clubName.milan05,
  clubName.barcelona06,
  clubName.chelsea08,
  clubName.manutd09,
  clubName.inter09,
  clubName.dortmund13,

  clubName.santos62,
  clubName.flamengo81,
  clubName.palmeiras99,
  clubName.boca03,
];