import 'package:fifa/values/club_names.dart';
import 'package:fifa/values/league_names.dart';


ClubName _name = ClubName();
LeagueOfficialNames leagueName = LeagueOfficialNames();

Map<String,dynamic> mapCopas = {

   leagueName.englandCup : {
    2022.0: [_name.liverpool, _name.chelsea],
    2021.0: [_name.leicester,_name.chelsea],
    2020.0: [_name.arsenal,_name.chelsea],
    2019.0: [_name.manchestercity,_name.watford],
    2018.0: [_name.chelsea,_name.manchesterunited],
    2017.0: [_name.arsenal,_name.chelsea],
    2016.0: [_name.manchesterunited,_name.crystalpalace],
    2015.0: [_name.arsenal,_name.astonvilla],
    2014.0: [_name.arsenal,_name.hullcity],
    2013.0: [_name.wigan,_name.manchestercity],
    2012.0: [_name.chelsea,_name.liverpool],
    2011.0: [_name.manchestercity,_name.stoke],
    2010.0: [_name.chelsea,_name.portsmouth],
    2009.0: [_name.chelsea,_name.everton],
    2008.0: [_name.portsmouth,_name.cardiffCity],
    2007.0: [_name.chelsea,_name.manchesterunited],
    2006.0: [_name.liverpool,_name.westham],
    2005.0: [_name.arsenal,_name.manchesterunited],
    2004.0: [_name.manchesterunited,_name.millwall],
    2003.0: [_name.arsenal,_name.southampton],
    2002.0: [_name.arsenal,_name.chelsea],
    2001.0: [_name.liverpool,_name.arsenal],
    2000.0: [_name.chelsea,_name.astonvilla],
    1999.0: [_name.manchesterunited,_name.newcastle],
    1998.0: [_name.arsenal,_name.newcastle],
    1997.0: [_name.chelsea,_name.middlesbrough],
    1996.0: [_name.manchesterunited,_name.liverpool],
    1995.0: [_name.everton,_name.manchesterunited],
    1994.0: [_name.manchesterunited,_name.chelsea],
    1993.0: [_name.arsenal,_name.sheffieldWednesday],
    1992.0: [_name.liverpool,_name.sunderland],
    1991.0: [_name.tottenham,_name.nottinghamforest],
    1990.0: [_name.manchesterunited,_name.crystalpalace],
    1989.0: [_name.liverpool,_name.everton],
    1988.0: [_name.wimbledon,_name.liverpool],
    1987.0: [_name.coventry,_name.tottenham],
    1986.0: [_name.liverpool,_name.everton],
    1985.0: [_name.manchesterunited,_name.everton],
    1984.0: [_name.everton,_name.watford],
    1983.0: [_name.manchesterunited,_name.brighton],
    1982.0: [_name.tottenham,_name.qpr],
    1981.0: [_name.tottenham,_name.manchestercity],
    1980.0: [_name.westham,_name.arsenal],
    1979.0: [_name.arsenal,_name.manchesterunited],
    1978.0: [_name.ipswichTown,_name.arsenal],
    1977.0: [_name.manchesterunited,_name.liverpool],
    1976.0: [_name.southampton,_name.manchesterunited],
    1975.0: [_name.westham,_name.fulham],
    1974.0: [_name.liverpool,_name.newcastle],
    1973.0: [_name.sunderland,_name.leeds],
    1972.0: [_name.leeds,_name.arsenal],
    1971.0: [_name.arsenal,_name.liverpool],
    1970.0: [_name.chelsea,_name.leeds],
    1969.0: [_name.manchestercity,_name.leicester],
    1968.0: [_name.westbromwich,_name.everton],
    1967.0: [_name.tottenham,_name.chelsea],
    1966.0: [_name.everton,_name.sheffieldWednesday],
    1965.0: [_name.liverpool,_name.leeds],
    1964.0: [_name.westham,_name.prestonNorthEnd],
    1963.0: [_name.manchesterunited,_name.leicester],
    1962.0: [_name.tottenham,_name.burnley],
    1961.0: [_name.tottenham,_name.leicester],
    1960.0: [_name.wolves,_name.blackburn],
    1959.0: [_name.nottinghamforest,_name.luton,],
    1958.0: [_name.bolton,_name.manchesterunited,],
    1957.0: [_name.astonvilla,_name.manchesterunited],
    1956.0: [_name.manchestercity,_name.birmigham,],
    1955.0: [_name.newcastle,_name.manchestercity,],
    1954.0: [_name.westbromwich,_name.prestonNorthEnd,],
    1953.0: [_name.blackpool,_name.bolton,],
    1952.0: [_name.newcastle,_name.arsenal,],
    1951.0: [_name.newcastle,_name.blackpool,],
    1950.0: [_name.arsenal,_name.liverpool,],
    1949.0: [_name.wolves,_name.leicester,],
    1948.0: [_name.manchesterunited,_name.blackpool,],
    1947.0: [_name.charlton,_name.burnley,],
    1946.0: [_name.derbycount,_name.charlton,],
  },
  
  leagueName.italyCup : {
    2022.0: [_name.inter, _name.juventus,_name.milan,_name.fiorentina,],
    2021.0: [_name.juventus,_name.atalanta,_name.napoli,_name.inter,],
    2020.0: [_name.napoli,_name.juventus,_name.milan,_name.inter,],
    2019.0: [_name.lazio,_name.atalanta,_name.fiorentina,_name.milan,],
    2018.0: [_name.juventus,_name.milan,_name.lazio,_name.atalanta,],
    2017.0: [_name.juventus,_name.lazio,_name.napoli,_name.roma],
    2016.0: [_name.juventus,_name.milan,_name.alessandria,_name.inter],
    2015.0: [_name.juventus,_name.lazio,_name.fiorentina,_name.napoli],
    2014.0: [_name.napoli,_name.fiorentina,_name.roma,_name.udinese],
    2013.0: [_name.lazio,_name.roma,_name.juventus,_name.inter],
    2012.0: [_name.napoli,_name.juventus,_name.siena,_name.milan],
    2011.0: [_name.inter,_name.palermo,_name.roma,_name.milan],
    2010.0: [_name.inter,_name.roma,_name.fiorentina,_name.udinese],
    2009.0: [_name.lazio,_name.sampdoria,_name.juventus,_name.inter],
    2008.0: [_name.roma,_name.inter,_name.catania,_name.lazio],
    2007.0: [_name.roma,_name.inter,_name.sampdoria,_name.milan],
    2006.0: [_name.inter,_name.roma,_name.palermo,_name.udinese],
    2005.0: [_name.inter,_name.roma,_name.cagliari,_name.udinese],
    2004.0: [_name.lazio,_name.juventus,_name.milan,_name.inter],
    2003.0: [_name.milan,_name.roma,_name.perugia,_name.lazio],
    2002.0: [_name.parma,_name.juventus,_name.milan,_name.brescia],
    2001.0: [_name.fiorentina,_name.parma,_name.udinese,_name.milan],
    2000.0: [_name.lazio,_name.inter,_name.cagliari,_name.venezia],
    1999.0: [_name.parma,_name.fiorentina,_name.inter,_name.bologna],
    1998.0: [_name.lazio,_name.milan,_name.parma,_name.juventus],
    1997.0: [_name.vicenza,_name.napoli,_name.inter,_name.bologna],
    1996.0: [_name.fiorentina,_name.atalanta,_name.bologna,_name.inter],
    1995.0: [_name.juventus,_name.parma,_name.foggia,_name.lazio],
    1994.0: [_name.sampdoria,_name.ancona,_name.torino,_name.parma],
    1993.0: [_name.torino,_name.roma,_name.juventus,_name.milan],
    1992.0: [_name.parma,_name.juventus,_name.sampdoria,_name.milan],
    1991.0: [_name.roma,_name.sampdoria,_name.napoli,_name.milan],
    1990.0: [_name.juventus,_name.milan,_name.napoli,_name.roma],
    1989.0: [_name.sampdoria,_name.napoli,_name.atalanta,_name.pisa],
    1988.0: [_name.sampdoria,_name.torino,_name.juventus,_name.inter],
    1987.0: [_name.napoli,_name.atalanta,_name.cagliari,_name.cremonese],
    1986.0: [_name.roma,_name.sampdoria,_name.fiorentina,_name.como],
    1985.0: [_name.sampdoria,_name.milan,_name.inter,_name.fiorentina],
    1984.0: [_name.roma,_name.hellasVerona,_name.bari,_name.torino],
    1983.0: [_name.juventus,_name.hellasVerona,_name.torino,_name.inter],
    1982.0: [_name.inter,_name.torino,_name.catanzaro,_name.sampdoria],
    1981.0: [_name.roma,_name.torino,_name.bologna,_name.juventus],
    1980.0: [_name.roma,_name.torino,_name.ternana,_name.juventus],
    1979.0: [_name.juventus,_name.palermo,_name.napoli,_name.catanzaro],
    1978.0: [_name.inter,_name.napoli,_name.milan,_name.fiorentina],
    1977.0: [_name.milan,_name.inter,_name.juventus,_name.bologna],
    1976.0: [_name.napoli,_name.hellasVerona,_name.inter,_name.fiorentina],
    1975.0: [_name.fiorentina,_name.milan,_name.juventus,_name.torino],
    1974.0: [_name.bologna,_name.palermo,_name.inter,_name.fiorentina],
    1973.0: [_name.milan,_name.juventus,_name.inter,_name.atalanta],
    1972.0: [_name.milan,_name.napoli,_name.fiorentina,_name.torino],
    1971.0: [_name.torino,_name.milan,_name.fiorentina,_name.napoli],
    1970.0: [_name.bologna,_name.torino,_name.cagliari,_name.varese],
    1969.0: [_name.roma,_name.cagliari,_name.foggia,_name.torino],
    1968.0: [_name.torino,_name.milan,_name.inter,_name.bologna],
    1967.0: [_name.milan,_name.padova,_name.inter,_name.juventus],
    1966.0: [_name.fiorentina,_name.catanzaro,_name.juventus,_name.inter],
    1965.0: [_name.juventus,_name.inter,_name.roma,_name.torino],
    1964.0: [_name.roma,_name.torino,_name.fiorentina,_name.juventus],
    1963.0: [_name.atalanta,_name.torino,_name.hellasVerona,_name.bari],
    1962.0: [_name.napoli,_name.spal,_name.mantova,_name.juventus],
    1961.0: [_name.fiorentina,_name.lazio,_name.juventus,_name.torino],
    1960.0: [_name.juventus,_name.fiorentina,_name.lazio,_name.torino],
    1959.0: [_name.juventus,_name.inter,_name.genoa,_name.hellasVerona],
    1958.0: [_name.lazio,_name.fiorentina,_name.bologna,_name.juventus],
  },
  leagueName.spainCup : {
    2022.0: [_name.realbetis, _name.valencia],
    2021.0: [_name.barcelona,_name.athleticbilbao],
    2020.0: [_name.realsociedad,_name.athleticbilbao],
    2019.0: [_name.valencia,_name.barcelona],
    2018.0: [_name.barcelona,_name.sevilla],
    2017.0: [_name.barcelona,_name.alaves],
    2016.0: [_name.barcelona,_name.sevilla],
    2015.0: [_name.barcelona,_name.athleticbilbao],
    2014.0: [_name.realmadrid,_name.barcelona],
    2013.0: [_name.atleticomadrid,_name.realmadrid],
    2012.0: [_name.barcelona,_name.athleticbilbao],
    2011.0: [_name.realmadrid,_name.barcelona],
    2010.0: [_name.sevilla,_name.atleticomadrid],
    2009.0: [_name.barcelona,_name.athleticbilbao],
    2008.0: [_name.valencia,_name.getafe],
    2007.0: [_name.sevilla,_name.getafe],
    2006.0: [_name.espanyol,_name.zaragoza],
    2005.0: [_name.realbetis,_name.osasuna],
    2004.0: [_name.zaragoza,_name.realmadrid],
    2003.0: [_name.mallorca,_name.huelva],
    2002.0: [_name.lacoruna,_name.realmadrid],
    2001.0: [_name.zaragoza,_name.celtavigo],
    2000.0: [_name.espanyol,_name.atleticomadrid],
    1999.0: [_name.valencia,_name.atleticomadrid],
    1998.0: [_name.barcelona,_name.mallorca],
    1997.0: [_name.barcelona,_name.realbetis],
    1996.0: [_name.atleticomadrid,_name.barcelona],
    1995.0: [_name.lacoruna,_name.valencia],
    1994.0: [_name.zaragoza,_name.celtavigo],
    1993.0: [_name.realmadrid,_name.zaragoza],
    1992.0: [_name.atleticomadrid,_name.realmadrid],
    1991.0: [_name.atleticomadrid,_name.mallorca],
    1990.0: [_name.barcelona,_name.realmadrid],
    1989.0: [_name.realmadrid,_name.valladolid],
    1988.0: [_name.barcelona,_name.valladolid],
    1987.0: [_name.realsociedad,_name.atleticomadrid],
    1986.0: [_name.zaragoza,_name.barcelona],
    1985.0: [_name.atleticomadrid,_name.athleticbilbao],
    1984.0: [_name.athleticbilbao,_name.barcelona],
    1983.0: [_name.barcelona,_name.realmadrid],
    1982.0: [_name.realmadrid,_name.sportingGijon],
    1981.0: [_name.barcelona,_name.sportingGijon],
    1980.0: [_name.realmadrid,_name.realmadridB],
    1979.0: [_name.valencia,_name.realmadrid],
    1978.0: [_name.barcelona,_name.lasPalmas],
    1977.0: [_name.realbetis,_name.athleticbilbao],
    1976.0: [_name.atleticomadrid,_name.zaragoza],
    1975.0: [_name.realmadrid,_name.atleticomadrid],
    1974.0: [_name.realmadrid,_name.barcelona],
    1973.0: [_name.athleticbilbao,_name.castellon],
    1972.0: [_name.atleticomadrid,_name.valencia],
    1971.0: [_name.barcelona,_name.valencia],
    1970.0: [_name.realmadrid,_name.valencia],
    1969.0: [_name.athleticbilbao,_name.elche],
    1968.0: [_name.barcelona,_name.realmadrid],
    1967.0: [_name.valencia,_name.athleticbilbao],
    1966.0: [_name.zaragoza,_name.athleticbilbao],
    1965.0: [_name.atleticomadrid,_name.zaragoza],
    1964.0: [_name.zaragoza,_name.atleticomadrid],
    1963.0: [_name.barcelona,_name.zaragoza],
    1962.0: [_name.realmadrid,_name.sevilla],
    1961.0: [_name.atleticomadrid,_name.realmadrid],
    1960.0: [_name.atleticomadrid,_name.realmadrid],

  },

   leagueName.franceCup : {
    2022.0: [_name.nantes,_name.nice],
    2021.0: [_name.psg,_name.monaco,],
    2020.0: [_name.psg,_name.saintetienne],
    2019.0: [_name.rennes,_name.psg],
    2018.0: [_name.psg,_name.vendee],
    2017.0: [_name.psg,_name.angers],
    2016.0: [_name.psg,_name.om],
    2015.0: [_name.psg,_name.auxerre],
    2014.0: [_name.guingamp,_name.rennes],
    2013.0: [_name.bordeaux,_name.evian],
    2012.0: [_name.lyon,_name.quevilly],
    2011.0: [_name.lille,_name.psg],
    2010.0: [_name.psg,_name.monaco],
    2009.0: [_name.guingamp,_name.rennes],
    2008.0: [_name.lyon,_name.psg],
    2007.0: [_name.sochaux,_name.om],
    2006.0: [_name.psg,_name.om],
    2005.0: [_name.auxerre,_name.sedan],
    2004.0: [_name.psg,_name.chateauroux],
    2003.0: [_name.auxerre,_name.psg],
    2002.0: [_name.lorient,_name.bastia],
    2001.0: [_name.strasbourg,_name.amiens],
    2000.0: [_name.nantes,_name.calais],
    1999.0: [_name.nantes,_name.sedan],
    1998.0: [_name.psg,_name.lens],
    1997.0: [_name.nice,_name.guingamp],
    1996.0: [_name.auxerre,_name.nimes],
    1995.0: [_name.psg,_name.strasbourg],
    1994.0: [_name.auxerre,_name.montpellier,],
    1993.0: [_name.psg,_name.nantes],
    1992.0: [],
    1991.0: [_name.monaco,_name.om],
    1990.0: [_name.montpellier,_name.racingParis],
    1989.0: [_name.om,_name.monaco,],
    1988.0: [_name.metz,_name.sochaux,],
    1987.0: [_name.bordeaux,_name.om],
    1986.0: [_name.bordeaux,_name.om],
    1985.0: [_name.monaco,_name.psg],
    1984.0: [_name.metz,_name.monaco],
    1983.0: [_name.psg,_name.nantes],
    1982.0: [_name.psg,_name.saintetienne],
    1981.0: [_name.bastia,_name.saintetienne],
    1980.0: [_name.monaco,_name.orleans],
    1979.0: [_name.nantes,_name.auxerre],
    1978.0: [_name.nancy,_name.nice],
    1977.0: [_name.saintetienne,_name.reims],
    1976.0: [_name.om,_name.lyon],
    1975.0: [_name.saintetienne,_name.lens],
    1974.0: [_name.saintetienne,_name.monaco],
    1973.0: [_name.lyon,_name.nantes],
    1972.0: [_name.om,_name.bastia],
    1971.0: [_name.rennes,_name.lyon],
    1970.0: [_name.saintetienne,_name.nantes],
    1969.0: [_name.om,_name.bordeaux],
    1968.0: [_name.saintetienne,_name.bordeaux],
    1967.0: [_name.lyon,_name.sochaux],
    1966.0: [_name.strasbourg,_name.nantes],
    1965.0: [_name.rennes,_name.sedan],
    1964.0: [_name.lyon,_name.bordeaux],
    1963.0: [_name.monaco,_name.lyon],
    1962.0: [_name.saintetienne,_name.nancy],
    1961.0: [_name.sedan,_name.nimes],
    1960.0: [_name.monaco,_name.saintetienne],

  },

  leagueName.germanyCup : {
    2022.0: [_name.rbleipzig,_name.freiburg],
    2021.0: [_name.dortmund,_name.rbleipzig],
    2020.0: [_name.bayernmunique,_name.leverkusen],
    2019.0: [_name.bayernmunique,_name.rbleipzig],
    2018.0: [_name.eintrachtfrankfurt,_name.bayernmunique],
    2017.0: [_name.dortmund,_name.eintrachtfrankfurt],
    2016.0: [_name.bayernmunique,_name.dortmund],
    2015.0: [_name.wolfsburg,_name.dortmund],
    2014.0: [_name.bayernmunique,_name.dortmund],
    2013.0: [_name.bayernmunique,_name.stuttgart],
    2012.0: [_name.dortmund,_name.bayernmunique],
    2011.0: [_name.schalke04,_name.duisburg],
    2010.0: [_name.bayernmunique,_name.werderbremen],
    2009.0: [_name.werderbremen,_name.leverkusen],
    2008.0: [_name.bayernmunique,_name.dortmund],
    2007.0: [_name.nurnberg,_name.stuttgart],
    2006.0: [_name.bayernmunique,_name.eintrachtfrankfurt],
    2005.0: [_name.bayernmunique,_name.schalke04],
    2004.0: [_name.werderbremen,_name.aachen],
    2003.0: [_name.bayernmunique,_name.kaiserslautern],
    2002.0: [_name.schalke04,_name.leverkusen],
    2001.0: [_name.schalke04,_name.unionBerlin],
    2000.0: [_name.bayernmunique,_name.werderbremen],
    1999.0: [_name.werderbremen,_name.bayernmunique],
    1998.0: [_name.bayernmunique,_name.duisburg],
    1997.0: [_name.stuttgart,_name.energieCottbus],
    1996.0: [_name.kaiserslautern,_name.karlsruher],
    1995.0: [_name.moenchengladbach,_name.wolfsburg],
    1994.0: [_name.werderbremen,_name.rotWeissEssen],
    1993.0: [_name.leverkusen,_name.herthaberlim],
    1992.0: [_name.hannover96,_name.moenchengladbach],
    1991.0: [_name.werderbremen,_name.colonia],
    1990.0: [_name.kaiserslautern,_name.werderbremen],
    1989.0: [_name.dortmund,_name.werderbremen],
    1988.0: [_name.eintrachtfrankfurt,_name.bochum],
    1987.0: [_name.hamburgo,_name.stutKickers],
    1986.0: [_name.bayernmunique,_name.stuttgart],
    1985.0: [_name.uerdigen,_name.bayernmunique],
    1984.0: [_name.bayernmunique,_name.moenchengladbach],
    1983.0: [_name.colonia,_name.fortunakoln],
    1982.0: [_name.bayernmunique,_name.nurnberg],
    1981.0: [_name.eintrachtfrankfurt,_name.kaiserslautern],
    1980.0: [_name.fortunaDusseldorf,_name.colonia],
    1979.0: [_name.fortunaDusseldorf,_name.herthaberlim],
    1978.0: [_name.colonia,_name.fortunaDusseldorf],
    1977.0: [_name.colonia,_name.herthaberlim],
    1976.0: [_name.hamburgo,_name.kaiserslautern],
    1975.0: [_name.eintrachtfrankfurt,_name.duisburg],
    1974.0: [_name.eintrachtfrankfurt,_name.hamburgo],
    1973.0: [_name.moenchengladbach,_name.colonia],
    1972.0: [_name.schalke04,_name.kaiserslautern,],
    1971.0: [_name.bayernmunique,_name.colonia],
    1970.0: [_name.kickersOffenbach,_name.colonia],
    1969.0: [_name.bayernmunique,_name.schalke04],
    1968.0: [_name.colonia,_name.bochum],
    1967.0: [_name.bayernmunique,_name.hamburgo],
    1966.0: [_name.bayernmunique,_name.duisburg],
    1965.0: [_name.dortmund,_name.aachen],
    1964.0: [_name.munique1860,_name.eintrachtfrankfurt],
    1963.0: [_name.hamburgo,_name.dortmund],
    1962.0: [_name.nurnberg,_name.fortunaDusseldorf],
    1961.0: [_name.werderbremen,_name.kaiserslautern],
    1960.0: [_name.moenchengladbach,_name.karlsruher],
  },

   leagueName.portugalCup : {
    2022.0: [_name.porto,_name.tondela,],
    2021.0: [_name.braga,_name.benfica,],
    2020.0: [_name.porto,_name.benfica,],
    2019.0: [_name.sporting,_name.porto,],
    2018.0: [_name.aves,_name.sporting,],
    2017.0: [_name.benfica,_name.vitoriaguimaraes,],
    2016.0: [_name.braga,_name.porto,],
    2015.0: [_name.sporting,_name.braga,],
    2014.0: [_name.benfica,_name.rioAve,],
    2013.0: [_name.vitoriaguimaraes,_name.benfica,],
    2012.0: [_name.coimbra,_name.sporting,],
    2011.0: [_name.porto,_name.vitoriaguimaraes,],
    2010.0: [_name.porto,_name.chaves,],
    2009.0: [_name.porto,_name.pacosDeFerreira,],
    2008.0: [_name.sporting,_name.porto,],
    2007.0: [_name.sporting,_name.belenenses,],
    2006.0: [_name.porto,_name.setubal,],
    2005.0: [_name.setubal,_name.benfica,],
    2004.0: [_name.benfica,_name.porto,],
    2003.0: [_name.porto,_name.leiria,],
    2002.0: [_name.sporting,_name.leixoes,],
    2001.0: [_name.porto,_name.maritimo,],
    2000.0: [_name.porto,_name.sporting,],
    1999.0: [_name.beiramar,_name.campomaiorense,],
    1998.0: [_name.porto,_name.braga,],
    1997.0: [_name.boavista,_name.benfica,],
    1996.0: [_name.benfica,_name.sporting,],
    1995.0: [_name.sporting,_name.maritimo,],
    1994.0: [_name.porto,_name.sporting,],
    1993.0: [_name.benfica,_name.boavista,],
    1992.0: [_name.boavista,_name.porto,],
    1991.0: [_name.porto,_name.beiramar,],
    1990.0: [_name.estrelavermelha,_name.farense,],
    1989.0: [_name.belenenses,_name.benfica,],
    1988.0: [_name.porto,_name.vitoriaguimaraes,],
    1987.0: [_name.benfica,_name.sporting,],
    1986.0: [_name.benfica,_name.belenenses,],
    1985.0: [_name.benfica,_name.porto,],
    1984.0: [_name.porto,_name.rioAve,],
    1983.0: [_name.benfica,_name.porto,],
    1982.0: [_name.sporting,_name.braga,],
    1981.0: [_name.benfica,_name.porto,],
    1980.0: [_name.benfica,_name.porto,],
    1979.0: [_name.boavista,_name.sporting,],
    1978.0: [_name.sporting,_name.porto,],
    1977.0: [_name.porto,_name.braga,],
    1976.0: [_name.boavista,_name.vitoriaguimaraes,],
    1975.0: [_name.boavista,_name.benfica,],
    1974.0: [_name.sporting,_name.benfica,],
    1973.0: [_name.sporting,_name.setubal,],
    1972.0: [_name.benfica,_name.sporting,],
    1971.0: [_name.sporting,_name.benfica,],
    1970.0: [_name.benfica,_name.sporting,],
    1969.0: [_name.benfica,_name.coimbra,],
    1968.0: [_name.porto,_name.setubal,],
    1967.0: [_name.setubal,_name.coimbra,],
    1966.0: [_name.braga,_name.setubal,],
    1965.0: [_name.setubal,_name.benfica,],
    1964.0: [_name.benfica,_name.porto,],
    1963.0: [_name.sporting,_name.vitoriaguimaraes,],
    1962.0: [_name.benfica,_name.setubal,],
    1961.0: [_name.leixoes,_name.porto,],
    1960.0: [_name.belenenses,_name.sporting,],
  },

  leagueName.turkeyCup : {
    2022.0: [_name.sivasspor,_name.kayserispor,],
    2021.0: [_name.besiktas,_name.antalyaspor,],
    2020.0: [_name.trabzonspor,_name.alanyaspor,],
    2019.0: [_name.galatasaray,_name.akhisar,],
    2018.0: [_name.akhisar,_name.fenerbahce,],
    2017.0: [_name.konyaspor,_name.instanbul,],
    2016.0: [_name.galatasaray,_name.fenerbahce,],
    2015.0: [_name.galatasaray,_name.bursaspor,],
    2014.0: [_name.galatasaray,_name.eskisehirspor,],
    2013.0: [_name.fenerbahce,_name.trabzonspor,],
    2012.0: [_name.fenerbahce,_name.trabzonspor,],
    2011.0: [_name.besiktas,_name.instanbul,],
    2010.0: [_name.trabzonspor,_name.fenerbahce,],
    2009.0: [_name.besiktas,_name.fenerbahce,],
    2008.0: [_name.kayserispor,_name.genclerbirligi,],
    2007.0: [_name.besiktas,],
    2006.0: [_name.besiktas,_name.fenerbahce,],
    2005.0: [_name.galatasaray,_name.fenerbahce,],
    2004.0: [_name.trabzonspor,_name.genclerbirligi,],
    2003.0: [_name.trabzonspor,_name.genclerbirligi,],
    2002.0: [_name.kocaelispor,_name.besiktas,],
    2001.0: [_name.genclerbirligi,_name.fenerbahce,],
    2000.0: [_name.galatasaray,_name.antalyaspor,],
    1999.0: [_name.galatasaray,_name.besiktas,],
    1998.0: [_name.besiktas,_name.galatasaray,],
    1997.0: [_name.kocaelispor,_name.trabzonspor,],
    1996.0: [_name.galatasaray,_name.fenerbahce,],
    1995.0: [_name.trabzonspor,_name.galatasaray,],
    1994.0: [_name.besiktas,_name.galatasaray,],
    1993.0: [_name.galatasaray,_name.besiktas,],
    1992.0: [_name.trabzonspor,_name.bursaspor,],
    1991.0: [_name.galatasaray,_name.ankaragucu,],
    1990.0: [_name.besiktas,_name.trabzonspor,],
    1989.0: [_name.besiktas,_name.fenerbahce,],
    1988.0: [_name.sakaryaspor,_name.samsunspor,],
    1987.0: [_name.genclerbirligi,_name.eskisehirspor,],
    1986.0: [_name.bursaspor,_name.altay,],
    1985.0: [_name.galatasaray,_name.trabzonspor,],
    1984.0: [_name.trabzonspor,_name.besiktas,],
    1983.0: [_name.fenerbahce,_name.mersin,],
    1982.0: [_name.galatasaray,_name.ankaragucu,],
    1981.0: [_name.ankaragucu,_name.boluspor,],
    1980.0: [_name.altay,_name.galatasaray,],
    1979.0: [_name.fenerbahce,_name.altay,],
    1978.0: [_name.trabzonspor,_name.besiktas,],
    1977.0: [_name.trabzonspor,_name.besiktas,],
    1976.0: [_name.galatasaray,_name.trabzonspor,],
    1975.0: [_name.besiktas,_name.trabzonspor,],
    1974.0: [_name.fenerbahce,_name.bursaspor,],
    1973.0: [_name.galatasaray,_name.ankaragucu,],
    1972.0: [_name.ankaragucu,_name.altay,],
    1971.0: [_name.eskisehirspor,_name.bursaspor,],
    1970.0: [_name.goztepe,_name.eskisehirspor,],
    1969.0: [_name.goztepe,_name.galatasaray,],
    1968.0: [_name.fenerbahce,_name.altay,],
    1967.0: [_name.altay,_name.goztepe,],
    1966.0: [_name.galatasaray,_name.besiktas,],
    1965.0: [_name.galatasaray,_name.fenerbahce,],
    1964.0: [_name.galatasaray,_name.altay,],
    1963.0: [_name.galatasaray,_name.fenerbahce,],
  },

   leagueName.brazilCup : {
    2022.0: [_name.flamengo,_name.corinthians,_name.saopaulo,_name.fluminense],
    2021.0: [_name.atleticomg, _name.atleticopr,_name.fortaleza,_name.flamengo],
    2020.0: [_name.palmeiras, _name.gremio,_name.americamg,_name.saopaulo],
    2019.0: [_name.atleticopr, _name.internacional,_name.gremio,_name.cruzeiro],
    2018.0: [_name.cruzeiro,_name.corinthians,_name.palmeiras,_name.flamengo],
    2017.0: [_name.cruzeiro,_name.flamengo,_name.gremio,_name.botafogo],
    2016.0: [_name.gremio,_name.atleticomg,_name.cruzeiro,_name.internacional],
    2015.0: [_name.palmeiras,_name.santos,_name.fluminense,_name.saopaulo],
    2014.0: [_name.atleticomg,_name.cruzeiro,_name.flamengo,_name.santos],
    2013.0: [_name.flamengo,_name.atleticopr,_name.goias,_name.gremio],
    2012.0: [_name.palmeiras,_name.coritiba,_name.gremio,_name.saopaulo],
    2011.0: [_name.vasco,_name.coritiba,_name.avai,_name.ceara],
    2010.0: [_name.santos,_name.vitoria,_name.gremio,_name.atleticogo],
    2009.0: [_name.corinthians,_name.internacional,_name.vasco,_name.coritiba],
    2008.0: [_name.sport,_name.corinthians,_name.vasco,_name.botafogo],
    2007.0: [_name.fluminense,_name.figueirense,_name.brasiliense,_name.botafogo],
    2006.0: [_name.flamengo,_name.vasco,_name.ipatinga,_name.fluminense],
    2005.0: [_name.paulista,_name.fluminense,_name.cruzeiro,_name.ceara],
    2004.0: [_name.santoandre,_name.flamengo,_name.novembro15,_name.vitoria],
    2003.0: [_name.cruzeiro,_name.flamengo,_name.goias,_name.sport],
    2002.0: [_name.corinthians,_name.brasiliense,_name.saopaulo,_name.atleticomg],
    2001.0: [_name.gremio,_name.corinthians,_name.coritiba,_name.pontepreta],
    2000.0: [_name.cruzeiro,_name.saopaulo,_name.santos,_name.atleticomg],
    1999.0: [_name.juventude,_name.botafogo,_name.internacional,_name.palmeiras],
    1998.0: [_name.palmeiras,_name.cruzeiro,_name.santos,_name.vasco],
    1997.0: [_name.gremio,_name.flamengo,_name.corinthians,_name.palmeiras],
    1996.0: [_name.cruzeiro,_name.palmeiras,_name.flamengo,_name.gremio],
    1995.0: [_name.corinthians,_name.gremio,_name.vasco,_name.flamengo],
    1994.0: [_name.gremio,_name.ceara,_name.vasco,_name.linhares],
    1993.0: [_name.cruzeiro,_name.gremio,_name.vasco,_name.flamengo],
    1992.0: [_name.internacional,_name.fluminense,_name.palmeiras,_name.sport],
    1991.0: [_name.criciuma,_name.gremio,_name.remo,_name.coritiba],
    1990.0: [_name.flamengo,_name.goias,_name.nautico,_name.criciuma],
    1989.0: [_name.gremio,_name.sport,_name.flamengo,_name.goias],

    //TAÇA BRASIL
    1967.0: [_name.palmeiras,_name.nautico,_name.gremio,_name.cruzeiro],
    1966.0: [_name.cruzeiro,_name.santos,_name.fluminense,_name.nautico],
    1965.0: [_name.santos,_name.vasco,_name.palmeiras,_name.nautico],
    1964.0: [_name.santos,_name.flamengo,_name.palmeiras,_name.ceara],
    1963.0: [_name.santos,_name.bahia,_name.gremio,_name.botafogo],
    1962.0: [_name.santos,_name.botafogo,_name.sport,_name.internacional],
    1961.0: [_name.santos,_name.bahia,_name.americaRJ,_name.nautico],
    1960.0: [_name.palmeiras,_name.fortaleza,_name.fluminense,_name.santacruz],
    1959.0: [_name.bahia,_name.santos,_name.vasco,_name.gremio],
  },

};