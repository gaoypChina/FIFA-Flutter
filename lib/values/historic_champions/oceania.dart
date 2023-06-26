import 'package:fifa/values/club_names.dart';
import 'package:fifa/values/league_names.dart';


ClubName n = ClubName();
LeagueOfficialNames leagueName = LeagueOfficialNames();

Map<String,dynamic> mapOceania = {

  leagueName.australia : {
    //2025.0: [],
    //2024.0: [],
    2023.0: [n.centralcoast,n.melbournecity,n.adelaide,n.sydneywanderers,n.sydneyFC,n.wellingtonphoenix,n.westernunited,n.brisbane,n.perth,n.newcastlejets,n.melbournevictory,n.macarthur],
    2022.0: [n.westernunited,n.melbournecity,n.melbournevictory,n.adelaide,n.centralcoast,n.wellingtonphoenix,n.macarthur,n.sydneyFC,n.newcastlejets,n.sydneywanderers,n.brisbane,n.perth,n.newcastlejets,n.melbournevictory,n.macarthur,],
    2021.0: [n.melbournecity,n.sydneyFC,n.macarthur,n.adelaide,      n.centralcoast,n.brisbane,n.wellingtonphoenix,n.sydneywanderers,n.perth,n.westernunited,               n.newcastlejets,n.melbournevictory],
    2020.0: [n.sydneyFC,n.melbournecity,n.perth,n.westernunited,     n.wellingtonphoenix,n.brisbane,n.adelaide,n.newcastlejets,n.sydneywanderers,n.melbournevictory,   n.centralcoast],
    2019.0: [n.sydneyFC,n.perth,n.melbournevictory,n.adelaide,       n.melbournecity,n.wellingtonphoenix,n.newcastlejets,n.sydneywanderers,n.brisbane,n.centralcoast],
    2018.0: [n.melbournevictory,n.newcastlejets,n.sydneyFC,n.melbournecity,  n.adelaide,n.brisbane,n.sydneywanderers,n.perth,n.wellingtonphoenix,n.centralcoast],
    2017.0: [n.sydneyFC,n.melbournevictory,n.brisbane,n.melbournecity,       n.perth,n.sydneywanderers,n.wellingtonphoenix,n.centralcoast,n.adelaide,n.newcastlejets],
    2016.0: [n.adelaide,n.sydneywanderers,n.brisbane,n.melbournecity,        n.perth,n.melbournevictory,n.sydneyFC,n.newcastlejets,n.wellingtonphoenix,n.centralcoast],
    2015.0: [n.melbournevictory,n.sydneyFC,n.adelaide,n.wellingtonphoenix,   n.melbournecity,n.brisbane,n.perth,n.centralcoast,n.sydneywanderers,n.newcastlejets],
    2014.0: [n.brisbane,n.sydneywanderers,n.centralcoast,n.melbournevictory, n.sydneyFC,n.adelaide,n.newcastlejets,n.perth,n.wellingtonphoenix,n.melbournecity],
    2013.0: [n.centralcoast,n.sydneywanderers,n.melbournevictory,n.adelaide,  n.brisbane,n.perth,n.sydneyFC,n.newcastlejets,n.melbournecity,n.wellingtonphoenix],
    2012.0: [n.brisbane,n.perth,n.centralcoast,n.wellingtonphoenix,           n.sydneyFC,n.melbournecity,n.newcastlejets,n.melbournevictory,n.adelaide,n.goldCoast],
    2011.0: [n.brisbane,n.centralcoast,n.adelaide,n.goldCoast,                n.melbournevictory,n.wellingtonphoenix,n.newcastlejets,n.melbournecity,n.sydneyFC,n.perth,n.queensland],
    2010.0: [n.sydneyFC,n.melbournevictory,n.goldCoast,n.wellingtonphoenix,n.perth,  n.newcastlejets,n.queensland,n.centralcoast,n.brisbane,n.adelaide],
    2009.0: [n.melbournevictory,n.adelaide,n.brisbane,n.centralcoast,         n.sydneyFC,n.wellingtonphoenix,n.perth,n.newcastlejets],
    2008.0: [n.newcastlejets,n.centralcoast,n.sydneyFC,n.brisbane,            n.melbournevictory,n.adelaide,n.perth,n.wellingtonphoenix],
    2007.0: [n.melbournevictory,n.adelaide,n.newcastlejets,n.sydneyFC,       n.brisbane,n.centralcoast,n.perth,n.newzealandKnights],
    2006.0: [n.sydneyFC,n.centralcoast,n.adelaide,n.newcastlejets,           n.perth,n.brisbane,n.melbournevictory,n.newzealandKnights],
    2005.0: [],
    //National_Soccer_League
    2004.0: [n.perth,n.parramattaPower,n.adelaide,n.marconiStallions,n.southMelbourne],
    2003.0: [n.perth,n.sydneyOlympic,n.adelaideCity,n.parramattaPower,],
    2002.0: [n.sydneyOlympic,n.perth,],
    2001.0: [n.wollongongWolves,n.southMelbourne,],
    2000.0: [n.wollongongWolves,n.perth,],
    1999.0: [n.southMelbourne,n.sydneyUtd],
    1998.0: [n.southMelbourne,n.carlton],
    1997.0: [n.brisbaneStrikers,n.sydneyUtd,],
    1996.0: [n.melbourneKnights,n.marconiStallions,],
    1995.0: [n.melbourneKnights,n.adelaideCity,],
    1994.0: [n.adelaideCity,n.melbourneKnights,],
    1993.0: [n.marconiStallions,n.adelaideCity,],
    1992.0: [n.adelaideCity,n.melbourneKnights,],
    1991.0: [n.southMelbourne,n.melbourneKnights,],
    1990.0: [n.sydneyOlympic,n.marconiStallions,],
    1989.0: [n.marconiStallions,n.sydneyOlympic,],
    1988.0: [n.marconiStallions,n.sydneyUtd,],
    1987.0: [n.apiaLeichhardt,n.prestonLions,],
    1986.0: [n.adelaideCity,n.sydneyOlympic,],
    1985.0: [n.brunswick,n.maccabiHakoah,],
    1984.0: [n.southMelbourne,n.sydneyOlympic,],
    1983.0: [n.stGeorgeAUS,n.maccabiHakoah,],
    1982.0: [n.maccabiHakoah,n.stGeorgeAUS,],
    1981.0: [n.maccabiHakoah,],
    1980.0: [n.maccabiHakoah,],
    1979.0: [n.marconiStallions,],
    1978.0: [n.westAdelaide,n.maccabiHakoah,],
    1977.0: [n.maccabiHakoah,n.marconiStallions,],
  },

  leagueName.novazelandia : {
    //https://en.wikipedia.org/wiki/2022_New_Zealand_National_League
    //2025.0: [],
    //2024.0: [],
    2023.0: [],
    2022.0: [n.auckland,n.wellingtonoly,n.aucklandutd,n.birkenhead,n.melville,n.wellingtonphoenix,n.cashmere,n.napier,n.christchurch,n.miramarNZL],
    2021.0: [n.teamwellington,n.auckland,n.hamiltonwanderers,n.easternsuburbs,n.waitakere,  n.canterbury,n.hawkebay,n.wellingtonphoenix],
    2020.0: [n.auckland,n.teamwellington,n.waitakere,n.easternsuburbs,n.tasman,n.hamiltonwanderers,n.southernunited,n.wellingtonphoenix,n.hawkebay,n.canterbury],
    2019.0: [n.easternsuburbs,n.teamwellington,n.auckland,n.canterbury,n.southernunited,n.hamiltonwanderers,n.hawkebay,n.tasman,n.waitakere,n.wellingtonphoenix],
    2018.0: [n.auckland,n.teamwellington,n.canterbury,n.easternsuburbs,n.southernunited,n.tasman,n.hawkebay,n.waitakere,n.wellingtonphoenix,n.hamiltonwanderers],
    2017.0: [n.teamwellington,n.auckland,n.waitakere,n.hawkebay,n.easternsuburbs,n.canterbury,n.wellingtonphoenix,n.tasman,n.hamiltonwanderers,n.southernunited],
    2016.0: [n.teamwellington,n.auckland,n.hawkebay,n.canterbury,n.waibop,n.waitakere,n.wellingtonphoenix,n.southernunited],
    2015.0: [n.auckland,n.hawkebay,n.teamwellington,n.waitakere,n.waibop,n.wellingtonphoenix,n.wandererssc,n.canterbury,n.southernunited],
    2014.0: [n.auckland,n.teamwellington,n.hawkebay,n.waitakere,n.canterbury,n.waibop,n.southernunited,n.wandererssc],
    2013.0: [n.waitakere,n.auckland,n.canterbury,n.hawkebay,n.teamwellington,n.waikato,n.otago,n.manawatu],
    2012.0: [n.waitakere,n.teamwellington,n.auckland,n.canterbury,n.hawkebay,n.otago,n.waikato,n.manawatu],
    2011.0: [n.waitakere,n.auckland,n.teamwellington,n.canterbury,n.hawkebay,n.waikato,n.otago,n.manawatu],
    2010.0: [n.waitakere,n.canterbury,n.auckland,n.teamwellington,n.otago,n.hawkebay,n.manawatu,n.waikato],
    2009.0: [n.auckland,n.waitakere,n.manawatu,n.teamwellington,n.hawkebay,n.waikato,n.otago,n.canterbury],
    2008.0: [n.waitakere,n.teamwellington,n.auckland,n.hawkebay,n.waikato,n.manawatu,n.otago,n.canterbury],
    2007.0: [n.auckland,n.waitakere,n.manawatu,n.canterbury,n.teamwellington,n.hawkebay,n.waikato,n.otago],
    2006.0: [n.auckland,n.canterbury,n.manawatu,n.teamwellington,n.otago,n.waitakere,n.waikato,n.hawkebay],
    2005.0: [n.auckland,n.waitakere,n.waikato,n.canterbury,n.napier,n.teamwellington,n.otago,n.manawatu],
  },

  leagueName.fiji : {
    //2025.0: [],
    //2024.0: [],
    2023.0: [],
    2022.0: [n.rewa,],
    2021.0: [n.lautoka,],
    2020.0: [n.suva,],
    2019.0: [n.ba,],
    2018.0: [n.lautoka,],
    2017.0: [n.lautoka,],
    2016.0: [n.ba,],
    2015.0: [n.nadi,],
    2014.0: [n.suva,],
    2013.0: [n.ba,],
    2012.0: [n.ba,],
    2011.0: [n.ba,],
    2010.0: [n.ba,],
    2009.0: [n.lautoka,],
    2008.0: [n.ba,],
    2007.0: [n.labasa,],
    2006.0: [n.ba,],
    2005.0: [n.ba,],
    2004.0: [n.ba,],
    2003.0: [n.ba,],
    2002.0: [n.ba,],
    2001.0: [n.ba,],
    2000.0: [n.nadi,],
    1999.0: [n.ba,],
    1998.0: [n.nadi,],
    1997.0: [n.suva,],
    1996.0: [n.suva,],
    1995.0: [n.ba,],
    1994.0: [n.ba,],
    1993.0: [n.nadroga,],
    1992.0: [n.ba,],
    1991.0: [n.labasa,],
    1990.0: [n.nadroga,],
    1989.0: [n.nadroga,],
    1988.0: [n.lautoka,],
    1987.0: [n.ba,],
    1986.0: [n.ba,],
    1985.0: [n.lautoka,],
    1984.0: [n.nadi,],
    1983.0: [n.ba,],
    1982.0: [n.nadi,],
    1981.0: [n.nadi,],
    1980.0: [n.nadi,],
    1979.0: [n.ba,],
    1978.0: [n.nadi,],
    1977.0: [n.ba,],
  },

};