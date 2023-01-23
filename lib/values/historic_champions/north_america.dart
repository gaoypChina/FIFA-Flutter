import 'package:fifa/values/club_names.dart';
import 'package:fifa/values/league_names.dart';


ClubName n = ClubName();
LeagueOfficialNames leagueName = LeagueOfficialNames();

Map<String,dynamic> mapNorthAmerica = {
  /////////////////////////////////////////////////////////////////
  // AMERICA DO NORTE
  ///////////////////////////////////////////////////////////////
  leagueName.mexico : {
    //APERTURA
    2022.0: [],
    2021.0: [n.atlas,n.leon,n.pumas,n.tigres,                       n.americamex,n.santosLaguna,n.toluca,n.puebla,n.cruzazul,n.monterrey,     n.chivas,n.sanluis,n.mazatlan,n.necaxa,n.pachuca,n.juarez,n.queretaro,n.tijuana],
    2020.0: [n.leon,n.pumas,n.chivas,n.cruzazul,                    n.americamex,n.monterrey,n.tigres,n.santosLaguna,n.pachuca,n.necaxa,      n.toluca,n.puebla,n.juarez,n.mazatlan,n.tijuana,n.atlas,n.queretaro,n.sanluis],
    2019.0: [n.monterrey,n.americamex,n.necaxa,n.morelia,           n.santosLaguna,n.leon,n.tigres,n.queretaro,n.pachuca,n.chivas,            n.tijuana,n.cruzazul,n.pumas,n.atlas,n.sanluis,n.juarez,n.toluca,n.puebla,n.veracruz],
    2018.0: [n.americamex,n.cruzazul,n.monterrey,n.pumas,           n.santosLaguna,n.tigres,n.toluca,n.queretaro,n.morelia,n.pachuca,         n.chivas,n.puebla,n.lobos,n.leon,n.tijuana,n.necaxa,n.atlas,n.veracruz],
    2017.0: [n.tigres,n.monterrey,n.americamex,n.morelia,           n.toluca,n.cruzazul,n.leon,n.atlas,n.necaxa,n.lobos,                      n.tijuana,n.pachuca,n.chivas,n.santosLaguna,n.puebla,n.queretaro,n.veracruz],
    2016.0: [n.tigres,n.americamex,n.leon,n.necaxa,                 n.tijuana,n.pachuca,n.chivas,n.pumas,n.monterrey,n.toluca,                n.queretaro,n.puebla,n.morelia,n.cruzazul,n.atlas,n.santosLaguna,n.veracruz,n.jaguares],
    2015.0: [n.tigres,n.pumas,n.toluca,n.americamex,                n.leon,n.jaguares,n.puebla,n.veracruz,n.monterrey,n.morelia,              n.queretaro,n.pachuca,n.chivas,n.cruzazul,n.santosLaguna,n.atlas,n.tijuana,n.dorados],
    2014.0: [n.americamex,n.tigres,n.monterrey,n.toluca,            n.atlas,n.jaguares,n.pachuca,n.pumas,n.santosLaguna,n.leon,               n.tijuana,n.queretaro,n.cruzazul,n.leonesNegros,n.puebla,n.chivas,n.veracruz,n.morelia],
    2013.0: [n.leon,n.americamex,n.santosLaguna,n.toluca,           n.cruzazul,n.morelia,n.queretaro,n.tigres,n.jaguares,n.tijuana,           n.monterrey,n.veracruz,n.puebla,n.pachuca,n.atlas,n.chivas,n.atlante,n.pumas],
    2012.0: [n.tijuana,n.toluca,n.leon,n.americamex,                n.morelia,n.cruzazul,n.monterrey,n.chivas,n.santosLaguna,n.pumas,         n.jaguares,n.tigres,n.pachuca,n.atlante,n.sanluis,n.puebla,n.atlas,n.queretaro],
    2011.0: [n.tigres,n.santosLaguna,n.queretaro,n.morelia,         n.chivas,n.cruzazul,n.jaguares,n.pachuca,n.pumas,n.sanluis,               n.monterrey,n.puebla,n.toluca,n.atlante,n.tijuana,n.tecos,n.americamex,n.atlas],
    2010.0: [n.monterrey,n.santosLaguna,n.pumas,n.americamex,       n.toluca,n.cruzazul,n.pachuca,n.morelia,n.pumas,n.chivas,n.sanLuisPotosi,  n.puebla,n.tigres,n.tecos,n.jaguares,n.atlante,n.atlas,n.queretaro,n.necaxa],
    2009.0: [n.monterrey,n.cruzazul,n.toluca,n.morelia,             n.americamex,n.santosLaguna,n.puebla,n.pachuca,n.atlante,n.tigres,        n.sanLuisPotosi,n.tecos,n.jaguares,n.chivas,n.atlas,n.queretaro,n.pumas,n.indios],
    2008.0: [n.toluca,n.cruzazul,n.santosLaguna,n.atlante,          n.sanLuisPotosi,n.pumas,n.tigres,n.tecos,n.chivas,n.morelia,n.atlas,  n.pachuca,n.americamex,n.monterrey,n.indios,n.jaguares,n.necaxa,n.puebla],
    2007.0: [n.atlante,n.pumas,n.chivas,n.santosLaguna,             n.toluca,n.sanLuisPotosi,n.americamex,n.cruzazul,n.pachuca,n.morelia,     n.necaxa,n.jaguares,n.veracruz,n.puebla,n.tecos,n.tigres,n.monterrey,n.atlas],
    2006.0: [n.chivas,n.toluca,n.americamex,n.pachuca,              n.cruzazul,n.pumas,n.monterrey,n.atlas,n.veracruz,n.jaguares,             n.atlante,n.morelia,n.sanLuisPotosi,n.queretaro,n.necaxa,n.tigres,n.tecos,n.santosLaguna],
    2005.0: [n.toluca,n.monterrey,n.pachuca,n.tigres,               n.americamex,n.necaxa,n.cruzazul,n.tecos,n.atlas,n.jaguares,              n.santosLaguna,n.morelia,n.chivas,n.dorados,n.sanLuisPotosi,n.pumas,n.atlante,n.veracruz],
    2004.0: [n.pumas,n.monterrey,n.atlas,n.atlante,                 n.veracruz,n.toluca,n.pachuca,n.chivas,n.tigres,n.morelia,                n.necaxa,n.puebla,n.americamex,n.santosLaguna,n.jaguares,n.cruzazul,n.dorados,n.tecos],
    2003.0: [n.pachuca,n.tigres,n.atlante,n.toluca,                 n.pumas,n.santosLaguna,n.tecos,n.necaxa,n.chivas,n.americamex,            n.cruzazul,n.veracruz,n.morelia,n.monterrey,n.irapuato,n.jaguares,n.puebla,n.atlas,n.sanLuisPotosi,n.queretaro],
    2002.0: [n.toluca,n.morelia,n.santosLaguna,n.pumas,             n.americamex,n.tecos,n.cruzazul,n.chivas,n.necaxa,n.atlante,              n.sanLuisPotosi,n.tigres,n.queretaro,n.monterrey,n.atlas,n.puebla,n.celaya,n.veracruz,n.jaguares,n.pachuca],
    //INVIERNO
    2001.0: [n.pachuca,n.tigres,n.toluca,n.cruzazul,                n.necaxa,n.atlante,n.chivas,n.santosLaguna,n.americamex,n.puebla, n.atlas,n.morelia,n.monterrey,n.irapuato,n.tecos,n.celaya,n.leon,n.lapiedad,n.pumas],
    2000.0: [n.morelia,n.toluca,n.santosLaguna,n.atlas,             n.cruzazul,n.necaxa,n.pachuca,n.americamex,n.irapuato,n.tecos,    n.tigres,n.monterrey,n.pumas,n.leon,n.atlante,n.puebla,n.chivas,n.celaya],
    1999.0: [n.pachuca,n.cruzazul,n.atlas,n.americamex,             n.toluca,n.necaxa,n.chivas,n.tecos,n.tigres,n.morelia,            n.pumas,n.puebla,n.monterrey,n.santosLaguna,n.celaya,n.leon,n.atlante,n.torosNeza],
    1998.0: [n.necaxa,n.chivas,n.atlas,n.pumas,                     n.cruzazul,n.toluca,n.tecos,n.morelia,n.tigres,n.americamex,      n.celaya,n.atlante,n.monterrey,n.santosLaguna,n.leon,n.pachuca,n.torosNeza,n.puebla],
    1997.0: [n.cruzazul,n.leon,n.atlante,n.americamex,              n.chivas,n.morelia,n.atlas,n.torosNeza,n.monterrey,n.veracruz,    n.celaya,n.toluca,n.puebla,n.necaxa,n.tigres,n.pumas,n.tecos,n.santosLaguna],
    //1996.0: [n.santosLaguna,n.necaxa,n.torosNeza,n.puebla,          n.atlante,n.chivas,n.toluca,n.atlas,n.leon,n.cruzazul,            n.monterrey,n.pumas,n.veracruz,n.tecos,n.americamex,n.celaya,n.pachuca,n.morelia],
    //NORMAL
    1996.0: [n.necaxa,n.celaya,n.americamex,n.veracruz,             n.cruzazul,n.atlas,n.monterrey,n.pumas,n.leon,n.torosNeza,        n.tigres,n.chivas,n.tecos,n.santosLaguna,n.toluca,n.morelia,n.atlante,n.puebla],
    1995.0: [n.necaxa,n.cruzazul,n.chivas,n.americamex,             n.tecos,n.pumas,n.puebla,n.santosLaguna,n.veracruz,n.atlante,     n.monterrey,n.torosNeza,n.atlas,n.leon,n.morelia,n.toluca,n.correcaminos,n.tigres,n.tampico],
    1994.0: [n.tecos,n.santosLaguna,n.americamex,n.toluca,          n.cruzazul,n.atlas,n.chivas,n.atlante,n.necaxa,n.morelia,         n.pumas,n.leon,n.monterrey,n.puebla,n.veracruz,n.torosNeza,n.tigres,n.leonesNegros,n.correcaminos,n.queretaro],
    1993.0: [n.atlante,n.monterrey,n.leon,n.americamex,             n.necaxa,n.tecos,n.cruzazul,n.pumas,n.tigres,n.puebla,            n.veracruz,n.atlas,n.chivas,n.toluca,n.morelia,n.leonesNegros,n.santosLaguna,n.pachuca,n.queretaro,n.correcaminos],
    1992.0: [n.leon,n.puebla,n.cruzazul,n.necaxa,                   n.atlante,n.chivas,n.pumas,n.correcaminos,n.americamex,               n.tigres,n.toluca,n.monterrey,n.atlas,n.morelia,n.santosLaguna,n.queretaro,n.tecos,n.leonesNegros,n.cobras],
    1991.0: [n.pumas,n.americamex,n.puebla,n.chivas,                n.monterrey,n.cruzazul,n.leonesNegros,n.leon,n.atlas,n.veracruz,  n.toluca,n.tigres,n.morelia,n.necaxa,n.correcaminos,n.tecos,n.cobras,n.queretaro,n.santosLaguna,n.irapuato],
    1990.0: [n.puebla,n.leonesNegros,n.pumas,n.americamex,          n.tigres,n.correcaminos,n.necaxa,n.toluca,n.monterrey,n.morelia,  n.chivas,n.cobras,n.atlas,n.irapuato,n.veracruz,n.tecos,n.santosLaguna,n.cruzazul,n.tampico,n.atlante],
    1989.0: [n.americamex,n.cruzazul,n.chivas,n.tampico,            n.pumas,n.puebla,n.atlante,n.tecos,                n.necaxa,n.morelia,n.leonesNegros,n.correcaminos,n.tigres,n.toluca,n.irapuato,n.monterrey,n.santosLaguna,n.atlas,n.atlPotosino],
    1988.0: [n.americamex,n.pumas,n.morelia,n.leonesNegros,         n.chivas,n.tecos,n.toluca,n.puebla,                 ],
    1987.0: [n.chivas,n.cruzazul,n.puebla,n.morelia,                n.americamex,n.tigres,n.tecos,n.monterrey,          ],
    1986.0: [n.monterrey,n.tampico,n.chivas,n.americamex,           n.puebla,n.cruzazul,n.morelia,n.atlante,            ],
    1985.0: [n.americamex,n.pumas,n.atlas,n.leon,                   n.leonesNegros,n.cruzazul,n.chivas,n.puebla,        ],
    1984.0: [n.americamex,n.chivas,n.pumas,n.cruzazul,              n.atlante,n.tecos,n.tigres,n.monterrey,             ],
    1983.0: [n.puebla,n.chivas,n.leonesNegros,n.americamex,         n.atlante,n.toluca,n.tecos,n.atlPotosino,           ],
    1982.0: [n.tigres,n.atlante,n.americamex,n.depNeza,             n.zacatepec,n.leonesNegros,n.monterrey,n.atlEspanol, ],
    1981.0: [n.pumas,n.cruzazul,n.zacatepec,n.depNeza,              n.chivas,n.toluca,n.atlEspanol,n.tecos,              n.atlante,n.monterrey,n.tigres,n.puebla,    n.americamex,n.atlPotosino,n.tampico,n.leonesNegros,  ],
    1980.0: [n.cruzazul,n.tigres,n.atlante,n.americamex,            n.depNeza,n.pumas,n.zacatepec,n.tampico],
    1979.0: [n.cruzazul,n.pumas,n.tigres,n.toluca,                  n.americamex,n.monterrey,n.atlPotosino,n.zacatepec,],
    1978.0: [n.tigres,n.pumas,n.cruzazul,n.tampico,                 n.americamex,n.toluca,n.tecos,n.leonesNegros,],
    1977.0: [n.pumas,n.leonesNegros,n.americamex,n.cruzazul,        n.atlPotosino,n.sanLuisPotosi,n.atlEspanol,n.chivas,],
    1976.0: [n.americamex,n.leonesNegros,n.curtidores,n.monterrey,  n.pumas,n.leon,n.cruzazul,n.toluca,n.santosLaguna,n.atlEspanol,          n.atlas,n.tigres,n.tecos,n.chivas,n.jalisco,n.zacatepec,n.veracruz,n.puebla,n.atlante,n.atlPotosino],
    1975.0: [n.toluca,n.leon,n.curtidores,n.cruzazul,               n.atlEspanol,n.americamex,n.monterrey,n.leonesNegros,n.atlas,n.puebla,   n.chivas,n.jalisco,n.tigres,n.pumas,n.veracruz,n.zacatepec,n.atlPotosino,n.atlante,n.santosLaguna,n.madero],
    1974.0: [n.cruzazul,n.atlEspanol,n.puebla,n.monterrey,          n.leon,n.toluca,n.pumas,n.americamex,],
    1973.0: [n.cruzazul,n.leon,n.atlas,n.atlEspanol,                n.americamex,n.toluca,n.pumas,n.puebla,],
    1972.0: [n.cruzazul,n.americamex,n.chivas,n.monterrey,          n.jalisco,n.leon,n.puebla,n.atlante,],
    1971.0: [n.americamex,n.toluca,n.monterrey,n.leon,              n.leon,n.zacatepec,n.cruzazul,n.pumas,n.atlante,n.veracruz,      n.puebla,n.necaxa,n.torreon,n.chivas,n.irapuato,n.pachuca,n.santosLaguna,n.atlas],
    //1970.0: [n.cruzazul,n.chivas,n.leon,n.toluca,                   n.pachuca,n.atlas,n.monterrey,n.torreon,n.pumas,n.santosLaguna,  n.veracruz,n.atlante,n.irapuato,n.americamex,n.necaxa,n.oro],
    1970.0: [n.chivas,n.cruzazul,n.veracruz,n.toluca,               n.necaxa,n.americamex,n.leon,n.pachuca,n.monterrey,n.atlante,    n.atlante,n.oro,n.atlas,n.pumas,n.irapuato,n.torreon,n.santosLaguna],
    1969.0: [n.cruzazul,n.chivas,n.toluca,n.pumas,                  n.americamex,n.atlas,n.leon,n.atlante,n.necaxa,n.pachuca,        n.monterrey,n.veracruz,n.santosLaguna,n.irapuato,n.nuevoLeon,n.oro],
    1968.0: [n.toluca,n.pumas,n.veracruz,n.necaxa,                  n.leon,n.chivas,n.cruzazul,n.atlante,n.americamex,n.atlas,       n.irapuato,n.pachuca,n.nuevoLeon,n.monterrey,n.oro,n.morelia],
    1967.0: [n.toluca,n.americamex,n.chivas,n.necaxa,               n.leon,n.nuevoLeon,n.atlas,n.monterrey,n.irapuato,n.cruzazul,    n.oro,n.atlante,n.pumas,n.veracruz,n.morelia,n.madero],
    1966.0: [n.americamex,n.atlas,n.chivas,n.monterrey,             n.atlante,n.pumas,n.necaxa,n.morelia,n.leon,n.irapuato,          n.veracruz,n.toluca,n.cruzazul,n.madero,n.oro,n.zacatepec],
    1965.0: [n.chivas,n.oro,],
    1964.0: [n.chivas,n.americamex,],
    1963.0: [n.oro,n.chivas,],
    1962.0: [n.chivas,n.americamex,],
    1961.0: [n.chivas,n.oro,],
    1960.0: [n.chivas,n.americamex,],
    1959.0: [n.chivas,n.leon,],
    1958.0: [n.zacatepec,n.toluca,],
    1957.0: [n.chivas,n.toluca,],
    1956.0: [n.leon,n.oro,],
    1955.0: [n.zacatepec,n.chivas,],
    1954.0: [],
    1953.0: [n.tampico,n.zacatepec,],
    1952.0: [n.leon,n.chivas,],
    1951.0: [n.atlas,n.atlante,],
    1950.0: [n.veracruz,n.atlante,],
  },
  leagueName.estadosUnidos : {
    2022.0: [],
    2021.0: [n.nycity,n.portland,n.philadelphia,n.realSaltLake,        n.nerevolution,n.colorado,n.seattle,n.kansas,n.nashville,n.atlanta,n.orlando,n.minnesota,n.vancouver,n.nyredbulls,n.lagalaxy,n.dcunited,n.columbuscrew,n.montreal,n.losangelesfc,n.intermiami,],
    2020.0: [n.columbuscrew,n.seattle,n.nerevolution,n.minnesota,      n.philadelphia,n.toronto,n.kansas,n.orlando,n.nycity,n.portland,n.colorado,n.fcdallas,n.losangelesfc,n.nyredbulls,n.nashville,n.sanJoseEarthquakes,n.vancouver,n.montreal,n.intermiami,n.lagalaxy],
    2019.0: [n.seattle,n.toronto,n.losangelesfc,n.atlanta,             n.nycity,n.philadelphia,n.realSaltLake,n.minnesota,n.lagalaxy,n.dcunited,n.portland,n.nyredbulls,n.fcdallas,n.nerevolution,n.sanJoseEarthquakes,n.colorado,n.chicago,n.montreal,n.houston,n.columbuscrew,],
    2018.0: [n.atlanta,n.portland,n.nyredbulls,n.kansas,               n.nycity,n.seattle,n.columbuscrew,n.fcdallas,n.realSaltLake,n.philadelphia,n.houston,n.chicago,n.nerevolution,n.dcunited,n.lagalaxy,n.minnesota,n.orlando,n.sanJoseEarthquakes,n.colorado,n.losangelesfc],
    2017.0: [n.toronto,n.seattle,n.columbuscrew,n.houston,             n.nycity,n.chicago,n.atlanta,n.portland,n.vancouver,n.nyredbulls,n.kansas,n.sanJoseEarthquakes,n.fcdallas,n.realSaltLake,n.nerevolution,n.philadelphia,n.montreal,n.orlando,n.minnesota,n.colorado,n.dcunited,n.lagalaxy],
    2016.0: [n.seattle,n.toronto,n.colorado,n.montreal,                n.fcdallas,n.nyredbulls,n.nycity,n.lagalaxy,n.kansas,n.realSaltLake,n.dcunited,n.portland,n.philadelphia,n.nerevolution,n.orlando,n.vancouver,n.sanJoseEarthquakes,n.columbuscrew,n.houston,n.chicago],
    2015.0: [n.portland,n.columbuscrew,n.fcdallas,n.nyredbulls,        n.vancouver,n.columbuscrew,n.seattle,n.montreal,n.dcunited,n.lagalaxy,n.kansas,n.nerevolution,n.toronto,n.sanJoseEarthquakes,n.orlando,n.houston,n.realSaltLake,n.nycity,n.philadelphia,n.colorado,n.chicago],
    2014.0: [n.lagalaxy,n.nerevolution,n.seattle,n.nyredbulls,         n.dcunited,n.realSaltLake,n.fcdallas,n.columbuscrew,n.vancouver,n.kansas,n.portland,n.philadelphia,n.toronto,n.houston,n.chicago,n.chivasUSA,n.colorado,n.sanJoseEarthquakes,n.montreal],
    2013.0: [n.kansas,n.realSaltLake,n.houston,n.portland,             n.nyredbulls,n.lagalaxy,n.seattle,n.nerevolution,n.colorado,n.sanJoseEarthquakes,n.montreal,n.chicago,n.vancouver,n.philadelphia,n.fcdallas,n.columbuscrew,n.toronto,n.chivasUSA,n.dcunited],
    2012.0: [n.lagalaxy,n.houston,n.seattle,n.dcunited,                n.sanJoseEarthquakes,n.kansas,n.nyredbulls,n.realSaltLake,n.chicago,n.columbuscrew, n.vancouver,n.montreal,n.fcdallas,n.colorado,n.philadelphia,n.nerevolution,n.portland,n.chivasUSA,n.toronto],
    2011.0: [n.lagalaxy,n.houston,n.realSaltLake,n.kansas,             n.seattle,n.fcdallas,n.colorado,n.philadelphia,n.columbuscrew,n.nyredbulls,         n.chicago,n.portland,n.dcunited,n.sanJoseEarthquakes,n.chivasUSA,n.toronto,n.nerevolution,n.vancouver],
    2010.0: [n.colorado,n.fcdallas,n.sanJoseEarthquakes,n.lagalaxy,    n.realSaltLake,n.nyredbulls,n.columbuscrew,n.seattle,n.sanJoseEarthquakes,n.kansas,n.chicago,      n.toronto,n.houston,n.nerevolution,n.philadelphia,n.chivasUSA,n.dcunited],
    2009.0: [n.realSaltLake,n.lagalaxy,n.chicago,n.houston,            n.columbuscrew,n.seattle,n.chivasUSA,n.nerevolution,n.colorado,n.dcunited,          n.fcdallas,n.toronto,n.kansas,n.sanJoseEarthquakes,n.nyredbulls],
    2008.0: [n.columbuscrew,n.nyredbulls,n.chicago,n.realSaltLake,     n.houston,n.chivasUSA,n.nerevolution,n.kansas,n.colorado,n.dcunited,                n.fcdallas,n.toronto,n.lagalaxy,n.sanJoseEarthquakes],
    2007.0: [n.houston,n.nerevolution,n.kansas,n.chicago,              n.dcunited,n.chivasUSA,n.fcdallas,n.nyredbulls,n.columbuscrew,n.colorado,           n.lagalaxy,n.realSaltLake,n.toronto],
    2006.0: [n.houston,n.nerevolution,n.colorado,n.dcunited,           n.fcdallas,n.chicago,n.chivasUSA,n.nyredbulls,n.lagalaxy,n.realSaltLake,            n.kansas,n.columbuscrew],
    2005.0: [n.lagalaxy,n.nerevolution,n.colorado,n.chicago,           n.sanJoseEarthquakes,n.dcunited,n.fcdallas,n.nyredbulls,n.kansas,n.columbuscrew,    n.realSaltLake,n.chivasUSA],
    2004.0: [n.dcunited,n.kansas,n.nerevolution,n.lagalaxy,            n.columbuscrew,n.colorado,n.nyredbulls,n.sanJoseEarthquakes,n.fcdallas,n.nerevolution,n.chicago],
    2003.0: [n.sanJoseEarthquakes,n.chicago,n.kansas,n.nerevolution,   n.nyredbulls,n.colorado,n.dcunited,n.columbuscrew,n.lagalaxy,n.fcdallas],
    2002.0: [n.lagalaxy,n.nerevolution,n.colorado,n.columbuscrew,      n.sanJoseEarthquakes,n.fcdallas,n.chicago,n.kansas,n.nyredbulls,n.dcunited],
    2001.0: [n.sanJoseEarthquakes,n.lagalaxy,n.miamiFusion,n.chicago,  n.columbuscrew,n.nyredbulls,n.kansas,n.fcdallas,n.nerevolution,n.dcunited,n.colorado,n.tampaBayMutiny],
    2000.0: [n.kansas,n.chicago,n.lagalaxy,n.nyredbulls,               n.tampaBayMutiny,n.fcdallas,n.nerevolution,n.colorado,n.miamiFusion,n.columbuscrew,       n.dcunited,n.sanJoseEarthquakes],
    1999.0: [n.dcunited,n.lagalaxy,n.columbuscrew,n.fcdallas,          n.chicago,n.colorado,n.sanJoseEarthquakes,n.tampaBayMutiny,n.miamiFusion,n.nerevolution,  n.kansas,n.nyredbulls],
    1998.0: [n.chicago,n.dcunited,n.lagalaxy,n.columbuscrew,           n.colorado,n.nyredbulls,n.fcdallas,n.miamiFusion,n.tampaBayMutiny,n.sanJoseEarthquakes,   n.kansas,n.nerevolution],
    1997.0: [n.dcunited,n.colorado,n.fcdallas,n.columbuscrew,          n.kansas,n.tampaBayMutiny,n.lagalaxy,n.nerevolution,n.nyredbulls,n.sanJoseEarthquakes],
    1996.0: [n.dcunited,n.lagalaxy,n.tampaBayMutiny,n.kansas,          n.fcdallas,n.nyredbulls,n.sanJoseEarthquakes,n.columbuscrew,n.nerevolution,n.colorado],

    1984.0: [n.chicagosting,n.torontoblizzard,n.vancouver,n.sandiegoSockers,  n.minnesotastrikers,n.nycosmos,n.tulsaroughnecks,n.tampabay,n.sanJoseEarthquakes],
    1983.0: [n.tulsaroughnecks,n.torontoblizzard,n.sanJoseEarthquakes,n.montrealmanic,  n.nycosmos,n.vancouver,n.chicagosting,n.fortlauderdale,],
    1982.0: [n.nycosmos,n.seattle,n.sandiegoSockers,n.fortlauderdale,  n.vancouver,n.montrealmanic,n.torontoblizzard,n.tulsaroughnecks,],
    1981.0: [n.chicagosting,n.nycosmos,n.sandiegoSockers,n.fortlauderdale, n.montrealmanic,n.tampabay,n.jacksonville,n.minnesotakicks,],
    1980.0: [n.nycosmos,n.fortlauderdale,n.laaztecs,n.sandiegoSockers, n.dallastornado,n.edmonton,n.seattle,n.tampabay,],
    1979.0: [n.vancouver,n.tampabay,n.nycosmos,n.sandiegoSockers,      n.laaztecs,n.philaatoms,n.tulsaroughnecks,n.chicagosting,],
    1978.0: [n.nycosmos,n.tampabay,n.portland,n.fortlauderdale,        n.minnesotakicks,n.sandiegoSockers,n.vancouver,n.detroitexpress, ],
    1977.0: [n.nycosmos,n.seattle,n.rochester,n.laaztecs,              n.fortlauderdale,n.minnesotakicks,n.tmc,n.dallastornado,         n.tampabay,n.sanJoseEarthquakes,n.vancouver,n.stlouis],
    1976.0: [n.tmc,n.minnesotakicks,n.tampabay,n.sanJoseEarthquakes,   ],
    1975.0: [n.tampabay,n.portland,n.miamitoros,n.stlouis,             n.tmc,n.seattle,n.boston,n.laaztecs],
    1974.0: [n.laaztecs,n.miamitoros,n.boston,n.dallastornado,         n.sanJoseEarthquakes,n.baltimore,n.tmc,n.seattle,n.rochester,n.philaatoms,n.denver,n.vancouver,n.nycosmos],
    1973.0: [n.philaatoms,n.dallastornado,n.tmc,n.nycosmos,            n.stlouis,n.montrealoly,n.miamitoros,n.atlantachiefs,n.rochester],
    1972.0: [n.nycosmos,n.stlouis,n.dallastornado,n.rochester,         n.montrealoly,n.atlantachiefs,n.tmc,n.miamitoros],
    1971.0: [n.dallastornado,n.atlantachiefs,n.rochester,n.nycosmos,   n.darts,n.tmc,n.stlouis,n.montrealoly],
    1970.0: [n.rochester,n.darts,n.atlantachiefs,n.kansasspurs,n.dallastornado,n.stlouis],
    1969.0: [n.kansasspurs,n.atlantachiefs,n.dallastornado,n.baltimorebays,n.stlouis],
  },

  leagueName.costaRica : {
    2022.0: [n.herediano,n.saprissa,],
    2021.0: [n.alajuelense,],
    2020.0: [n.herediano,n.alajuelense,],
    2019.0: [n.herediano,n.saprissa,],
    2018.0: [n.perezZeledon,n.herediano,],
    2017.0: [n.saprissa,n.herediano,],
    2016.0: [n.saprissa,n.alajuelense,],
    2015.0: [n.saprissa,n.herediano,],
    2014.0: [n.alajuelense,n.herediano,],
    2013.0: [n.alajuelense,n.herediano,],
    2012.0: [n.alajuelense,n.herediano,],
    2011.0: [n.alajuelense,n.herediano,],
    2010.0: [n.brujas,n.puntarenas,],
    2009.0: [n.saprissa,n.alajuelense,],
    2008.0: [n.saprissa,n.herediano,],
    2007.0: [n.saprissa,n.alajuelense,],
    2006.0: [n.saprissa,n.puntarenas,],
    2005.0: [n.alajuelense,n.perezZeledon,],
    2004.0: [n.saprissa,n.herediano,],
    2003.0: [n.alajuelense,],
    2002.0: [n.alajuelense,],
    2001.0: [n.alajuelense,],
    2000.0: [n.alajuelense,],
    1999.0: [n.saprissa,],
    1998.0: [n.saprissa,],
    1997.0: [n.alajuelense,],
    1996.0: [n.alajuelense,],
    1995.0: [n.saprissa,],
    1994.0: [n.saprissa,],
    1993.0: [n.herediano,n.cartagines,],
    1992.0: [n.alajuelense,n.saprissa,],
    1991.0: [n.alajuelense,n.saprissa,],
    1990.0: [],
    1989.0: [n.saprissa,n.alajuelense,],
    1988.0: [n.saprissa,n.herediano,],
    1987.0: [n.herediano,n.cartagines,],
    1986.0: [n.puntarenas,n.alajuelense,],
    1985.0: [n.herediano,n.alajuelense],
    1984.0: [n.alajuelense,n.saprissa,],
    1983.0: [n.alajuelense,n.puntarenas,],
    1982.0: [n.saprissa,n.puntarenas],
    1981.0: [n.herediano,n.limonense,],
    1980.0: [n.alajuelense,n.herediano,],
    1979.0: [n.herediano,n.cartagines,],
    1978.0: [n.herediano,n.puntarenas,],
    1977.0: [n.saprissa,n.cartagines,],
    1976.0: [n.saprissa,n.barrioMexico],
    1975.0: [n.saprissa,n.cartagines],
    1974.0: [n.saprissa,n.herediano,],
    1973.0: [n.saprissa,n.cartagines,],
    1972.0: [n.saprissa,n.alajuelense,],
    1971.0: [n.alajuelense,n.saprissa,],
    1970.0: [n.alajuelense,n.saprissa,],
    1969.0: [n.saprissa,n.alajuelense,],
    1968.0: [n.saprissa,n.cartagines,],
    1967.0: [n.saprissa,n.alajuelense],
    1966.0: [n.alajuelense,n.saprissa,],
    1965.0: [n.saprissa,n.alajuelense,],
    1964.0: [n.saprissa,n.orion,],
    1963.0: [n.uruguay,n.saprissa,],
    1962.0: [n.saprissa,n.alajuelense,],
    1961.0: [n.herediano,n.saprissa,],
    1960.0: [n.alajuelense,n.herediano],
  },

  leagueName.honduras : {
    2022.0: [n.olimpiaHON,n.rcdespana,n.vida,n.motagua,],
    2021.0: [n.olimpiaHON,n.marathon,n.motagua,n.vida,],
    2020.0: [n.olimpiaHON,n.marathon,n.motagua],
    2019.0: [n.motagua,n.olimpiaHON,n.rcdespana,n.platenseHON,],
    2018.0: [n.rcdespana,n.motagua,],
    2017.0: [n.motagua,n.platenseHON,],
    2016.0: [],
    2015.0: [n.motagua,n.sociedadHON,],
    2014.0: [n.rcdespana,n.sociedadHON,],
    2013.0: [n.olimpiaHON,n.victoriaHON],
    2012.0: [n.olimpiaHON,n.rcdespana,],
    2011.0: [n.rcdespana,n.olimpiaHON,],
    2010.0: [n.marathon,n.olimpiaHON,],
    2009.0: [n.marathon,n.rcdespana,],
    2008.0: [n.marathon,n.motagua,],
    2007.0: [n.motagua,n.olimpiaHON,],
    2006.0: [n.olimpiaHON,n.marathon,],
    2005.0: [n.marathon,n.olimpiaHON,],
    2004.0: [n.rcdespana,n.olimpiaHON,],
    2003.0: [n.olimpiaHON,n.platenseHON,],
    2002.0: [n.motagua,n.marathon,],
    2001.0: [n.olimpiaHON,n.platenseHON,],
    2000.0: [n.motagua,n.olimpiaHON,],
    1999.0: [n.olimpiaHON,n.rcdespana,],
    1998.0: [n.motagua,n.olimpiaHON,],
    1997.0: [n.olimpiaHON,n.platenseHON,],
    1996.0: [n.olimpiaHON,n.rcdespana,],
    1995.0: [n.victoriaHON,n.olimpiaHON,],
    1994.0: [n.rcdespana,n.motagua,],
    1993.0: [n.olimpiaHON,],
    1992.0: [n.motagua,n.rcdespana,],
    1991.0: [n.rcdespana,n.motagua,],
    1990.0: [n.olimpiaHON,n.rcdespana,],
    1989.0: [n.rcdespana,n.olimpiaHON,],
    1988.0: [n.olimpiaHON,n.marathon,],
    1987.0: [n.olimpiaHON,n.rcdespana,],
    1986.0: [n.marathon,n.vida,],
    1985.0: [n.olimpiaHON,n.vida,],
    1984.0: [n.vida,],
    1983.0: [n.olimpiaHON,n.motagua,],
    1982.0: [n.vida,],
    1981.0: [n.rcdespana,n.marathon,],
    1980.0: [n.marathon,],
    1979.0: [n.motagua,n.rcdespana,],
    1978.0: [n.olimpiaHON,n.rcdespana,],
    1977.0: [n.rcdespana,n.motagua,],
    1976.0: [n.rcdespana,n.olimpiaHON,],
    1975.0: [n.rcdespana,n.motagua,],
    1974.0: [n.motagua,n.marathon,],
    1973.0: [],
    1972.0: [n.olimpiaHON,],
    1971.0: [n.motagua,],
    1970.0: [n.olimpiaHON,],
    1969.0: [n.motagua,],
    1968.0: [n.olimpiaHON,],
    1967.0: [n.olimpiaHON,],
    1966.0: [n.platenseHON,],
    1965.0: [],
    1964.0: [],
    1963.0: [],
    1962.0: [],
    1961.0: [],
    1960.0: [],
  },

  leagueName.elsalvador : {
    //https://en.wikipedia.org/wiki/Primera_Divisi%C3%B3n_de_F%C3%BAtbol_de_El_Salvador
    2022.0: [],
    2021.0: [],
    2020.0: [n.alianzaELS,],
    2019.0: [n.aguila,],
    2018.0: [n.alianzaELS,],
    2017.0: [n.santaTecla,],
    2016.0: [n.dragonELS,],
    2015.0: [n.santaTecla,],
    2014.0: [n.isidro,],
    2013.0: [n.firpo,],
    2012.0: [n.aguila,],
    2011.0: [n.alianzaELS,],
    2010.0: [n.isidro,],
    2009.0: [n.isidro,],
    2008.0: [n.firpo,],
    2007.0: [n.isidro,],
    2006.0: [n.aguila,],
    2005.0: [n.fas,],
    2004.0: [n.alianzaELS,],
    2003.0: [n.sansalvador,],
    2002.0: [n.fas,],
    2001.0: [n.aguila,],
    2000.0: [n.firpo,],
    1999.0: [n.firpo,],
    1998.0: [n.firpo,],
    1997.0: [n.alianzaELS,],
    1996.0: [n.fas,],
    1995.0: [n.fas,],
    1994.0: [n.alianzaELS,],
    1993.0: [n.firpo,],
    1992.0: [n.firpo,],
    1991.0: [n.firpo,],
    1990.0: [n.alianzaELS,],
    1989.0: [n.firpo,],
    1988.0: [n.aguila,],
    1987.0: [n.alianzaELS,],
    1986.0: [],
    1985.0: [n.atleticomarte,],
    1984.0: [n.fas,],
    1983.0: [n.aguila,],
    1982.0: [n.atleticomarte],
    1981.0: [n.fas,],
    1980.0: [],
    1979.0: [n.fas,],
    1978.0: [n.fas,],
    1977.0: [n.aguila,],
    1976.0: [n.aguila,],
    1975.0: [],
    1974.0: [],
    1973.0: [n.juvOlimpica,],
    1972.0: [n.aguila,],
    1971.0: [n.juvOlimpica,],
    1970.0: [n.atleticomarte,],
    1969.0: [n.atleticomarte,],
    1968.0: [n.aguila,],
    1967.0: [n.alianzaELS,],
    1966.0: [n.alianzaELS,],
    1965.0: [],
    1964.0: [n.aguila,],
    1963.0: [n.aguila,],
    1962.0: [n.fas,],
    1961.0: [n.fas,],
    1960.0: [],
  },
  leagueName.guatemala : {
    2022.0: [],
    2021.0: [],
    2020.0: [n.depGuastatoya,],
    2019.0: [],
    2018.0: [n.depGuastatoya,],
    2017.0: [n.municipal,],
    2016.0: [],
    2015.0: [n.comunicaciones,],
    2014.0: [n.comunicaciones,],
    2013.0: [n.comunicaciones,],
    2012.0: [n.xelaju,],
    2011.0: [n.comunicaciones,],
    2010.0: [n.municipal,],
    2009.0: [],
    2008.0: [n.municipal,],
    2007.0: [n.xelaju,],
    2006.0: [n.municipal,],
    2005.0: [n.municipal,],
    2004.0: [n.coban,],
    2003.0: [n.comunicaciones,],
    2002.0: [n.municipal,],
    2001.0: [n.comunicaciones,],
    2000.0: [n.municipal,],
  },

  leagueName.nicaragua : {
    2022.0: [n.diriangen,n.walterferreti,n.managua,n.realEsteli],
    2021.0: [n.diriangen,n.managua,n.walterferreti,n.realEsteli,],
    2020.0: [n.realEsteli,n.managua,n.diriangen,n.jalapa,],
    2019.0: [n.realEsteli,n.managua,n.juvmanagua,n.diriangen,],
    2018.0: [n.diriangen,n.realEsteli,n.juvmanagua,n.walterferreti,],
    2017.0: [n.realEsteli],
    2016.0: [n.realEsteli,],
    2015.0: [n.walterferreti,],
    2014.0: [n.realEsteli,],
    2013.0: [n.realEsteli,],
    2012.0: [n.realEsteli,],
    2011.0: [n.realEsteli,],
    2010.0: [n.realEsteli,],
    2009.0: [n.realEsteli,],
    2008.0: [n.realEsteli],
    2007.0: [n.realEsteli],
    2006.0: [n.diriangen],
    2005.0: [n.diriangen,],
    2004.0: [n.realEsteli,],
    2003.0: [n.realEsteli],
    2002.0: [n.jalapa],
    2001.0: [n.walterferreti,],
    2000.0: [n.diriangen,],
    1999.0: [n.realEsteli,],
    1998.0: [n.walterferreti,],
    1997.0: [n.diriangen,],
    1996.0: [n.diriangen,],
    1995.0: [n.diriangen,],
    1994.0: [n.juvmanagua,],
    1993.0: [n.juvmanagua,],
    1992.0: [n.diriangen,],
    1991.0: [n.realEsteli,],
    1990.0: [n.americamanagua,],
    1989.0: [n.diriangen,],
    1988.0: [n.americamanagua,],
    1987.0: [n.diriangen,],
    1986.0: [n.masaya,],
    1985.0: [n.americamanagua,],
    1984.0: [n.masaya,],
    1983.0: [n.diriangen,],
    1982.0: [n.diriangen,],
    1981.0: [n.diriangen,],
    1980.0: [n.bufalos,],
    1979.0: [],
    1978.0: [],
    1977.0: [n.uca,],
    1976.0: [n.uca,],
    1975.0: [n.uca,],
    1974.0: [n.diriangen,],
    },

  leagueName.panama : {
    2022.0: [n.alianzaPAN,n.sanMiguelito,],
    2021.0: [n.plazaAmador,n.chorrillo,],
    2020.0: [n.independienteChorrera,n.sanfranciscoPAN,],
    2019.0: [n.independienteChorrera,n.sanfranciscoPAN,],
    2018.0: [n.independienteChorrera,n.tauro,],
    2017.0: [n.tauro,n.arabeunido,],
    2016.0: [n.plazaAmador,n.chorrillo,],
    2015.0: [n.arabeunido,n.independienteChorrera,],
    2014.0: [n.chorrillo,],
    2013.0: [n.sanMiguelito,n.sanfranciscoPAN,],
    2012.0: [n.tauro,],
    2011.0: [n.sanfranciscoPAN,n.chorrillo,],
    2010.0: [n.arabeunido,n.sanfranciscoPAN,],
    2009.0: [n.sanfranciscoPAN,n.chorrillo,],
    2008.0: [n.sanfranciscoPAN,n.tauro,],
    2007.0: [n.tauro,n.sanfranciscoPAN,],
    2006.0: [n.sanfranciscoPAN,n.plazaAmador,],
    2005.0: [n.plazaAmador,n.arabeunido,],
    2004.0: [n.arabeunido,n.plazaAmador,],
    2003.0: [n.tauro,n.arabeunido,],
    2002.0: [n.arabeunido,n.sanfranciscoPAN,],
    2001.0: [],
    2000.0: [n.tauro,n.plazaAmador,],
    1999.0: [n.arabeunido,n.tauro,],
    1998.0: [n.tauro,n.arabeunido,],
    1997.0: [n.tauro,],
    1996.0: [n.sanfranciscoPAN,n.plazaAmador,],
    1995.0: [n.sanfranciscoPAN,n.tauro,],
    1994.0: [n.arabeunido,],
    1993.0: [n.plazaAmador,],
    1992.0: [n.plazaAmador,],
    1991.0: [n.tauro,],
    1990.0: [n.plazaAmador,n.tauro,],
    1989.0: [n.tauro,],
    1988.0: [n.plazaAmador,],
  },

  leagueName.jamaica : {
    2022.0: [],
    2021.0: [n.cavalier,n.waterhouse,],
    2020.0: [],
    2019.0: [n.portmore,n.waterhouse,],
    2018.0: [n.portmore,n.waterhouse,],
    2017.0: [n.arnettGardens,n.portmore,],
    2016.0: [n.montego,n.portmore,],
    2015.0: [n.arnettGardens],
    2014.0: [n.montego,n.waterhouse,],
    2013.0: [n.harbourView,n.waterhouse,],
    2012.0: [n.portmore,],
    2011.0: [n.tivoliGardens,],
    2010.0: [n.harbourView,n.tivoliGardens,],
    2009.0: [n.tivoliGardens,n.portmore,],
    2008.0: [n.portmore,n.tivoliGardens,],
    2007.0: [n.harbourView,n.portmore,],
    2006.0: [n.waterhouse,n.harbourView,],
    2005.0: [n.portmore,n.tivoliGardens,],
    2004.0: [n.tivoliGardens,n.harbourView,],
    2003.0: [n.portmore,n.arnettGardens,],
    2002.0: [n.arnettGardens,],
    2001.0: [n.arnettGardens,n.waterhouse,],
    2000.0: [n.harbourView,n.waterhouse,],
    1999.0: [n.tivoliGardens,n.harbourView,],
    1998.0: [n.waterhouse,],
    1997.0: [n.montego,n.arnettGardens,],
    1996.0: [],
    1995.0: [n.reno,],
    1994.0: [],
    1993.0: [n.portmore,n.arnettGardens,],
    1992.0: [n.wadadah,n.reno,],
    1991.0: [n.reno,n.arnettGardens,],
    1990.0: [n.reno,],
  },

};