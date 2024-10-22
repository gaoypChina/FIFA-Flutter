import 'package:fifa/values/club_names.dart';
import 'package:fifa/values/league_names.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class RealClassification{

  LeagueOfficialNames n = LeagueOfficialNames();
  Map urls = {};
  List<Map<String, String>> standings  = [];

  getUrls(){
    urls = {
      n.inglaterra1: ['https://en.wikipedia.org/wiki/2023%E2%80%9324_Premier_League', 3],
      n.inglaterra2: ['https://en.wikipedia.org/wiki/2023%E2%80%9324_EFL_Championship', 3],
      n.inglaterra3: ['https://en.wikipedia.org/wiki/2023%E2%80%9324_EFL_League_One', 3],
      n.espanha1: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_La_Liga", 4],
      n.espanha2: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Segunda_Divisi%C3%B3n", 4],
      n.italia1: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Serie_A", 5],
      n.italia2: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Serie_B", 4],
      n.alemanha1: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Bundesliga", 4],
      n.alemanha2: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_2._Bundesliga", 4],
      n.franca1: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Ligue_1", 5],
      n.franca2: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Ligue_2", 4],
      n.holanda: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Eredivisie", 4],
      n.portugal: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Primeira_Liga", 3],
      n.turquia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_S%C3%BCper_Lig", 3],
      n.albania: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Kategoria_Superiore", 4],
      n.andorra: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Primera_Divisi%C3%B3", 1],
      n.armenia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Armenian_Premier_League", 3],
      n.austria: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Austrian_Football_Bundesliga", 3],
      n.azerbaijao: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Azerbaijan_Premier_League", 6],
      n.belarus: ["https://en.wikipedia.org/wiki/2023_Belarusian_Premier_League", 1],
      n.belgica: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Belgian_Pro_League", 4],
      n.bosnia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Premier_League_of_Bosnia_and_Herzegovina", 3],
      n.bulgaria: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_First_Professional_Football_League_(Bulgaria)", 2],
      n.cazaquistao: ["https://en.wikipedia.org/wiki/2023_Kazakhstan_Premier_League", 4],
      n.chipre: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Cypriot_First_Division", 1],
      n.croacia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Croatian_Football_League", 5],
      n.dinamarca: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Danish_Superliga", 3],
      n.escocia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Scottish_Premiership", 3],
      n.eslovenia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Slovenian_PrvaLiga", 2],
      n.eslovaquia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Slovak_First_Football_League", 4],
      n.estonia: ["https://en.wikipedia.org/wiki/2023_Meistriliiga", 3],
      n.georgia: ["https://en.wikipedia.org/wiki/2023_Erovnuli_Liga", 2],
      n.finlandia: ["https://en.wikipedia.org/wiki/2023_Veikkausliiga", 1],
      n.gibraltar: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Gibraltar_Football_League", 4],
      n.grecia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Super_League_Greece", 3],
      n.hungria: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Nemzeti_Bajnoks%C3%A1g_I", 4],
      n.ilhasfaroe: ["https://en.wikipedia.org/wiki/2023_Faroe_Islands_Premier_League", 1],
      n.irlanda: ["https://en.wikipedia.org/wiki/2023_League_of_Ireland_Premier_Division", 3],
      n.irlandanorte: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_NIFL_Premiership", 1],
      n.islandia: ["https://en.wikipedia.org/wiki/2023_Besta_deild_karla", 1],
      n.israel: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Israeli_Premier_League", 5],
      n.kosovo: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Football_Superleague_of_Kosovo", 2],
      n.letonia: ["https://en.wikipedia.org/wiki/2023_Latvian_Higher_League", 1],
      n.lituania: ["https://en.wikipedia.org/wiki/2023_A_Lyga", 3],
      n.luxemburgo: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Luxembourg_National_Division", 1],
      n.macedonia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Macedonian_First_Football_League", 2],
      n.malta: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Maltese_Premier_League", 4],
      n.moldova: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Moldovan_Super_Liga", 4],
      n.montenegro: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Montenegrin_First_League", 2],
      n.noruega: ["https://en.wikipedia.org/wiki/2023_Eliteserien", 3],
      n.paisgales: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Cymru_Premier", 3],
      n.polonia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Ekstraklasa", 5],
      n.reptcheca: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Czech_First_League", 3],
      n.romenia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_SuperLiga", 3],
      n.russia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Russian_Premier_League", 3],
      n.saomarino: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Campionato_Sammarinese_di_Calcio", 1],
      n.servia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Serbian_SuperLiga", 4],
      n.suecia: ["https://en.wikipedia.org/wiki/2023_Allsvenskan", 3],
      n.suica: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Swiss_Super_League", 3],
      n.ucrania: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Ukrainian_Premier_League", 3],

      n.brasil1: ["https://en.wikipedia.org/wiki/2023_Campeonato_Brasileiro_S%C3%A9rie_A", 7],
      n.brasil2: ["https://en.wikipedia.org/wiki/2023_Campeonato_Brasileiro_S%C3%A9rie_B", 6],
      n.brasil3: ["https://en.wikipedia.org/wiki/2023_Campeonato_Brasileiro_S%C3%A9rie_C", 6],
      n.argentina: ["https://en.wikipedia.org/wiki/2023_Argentine_Primera_Divisi%C3%B3n", 4],
      n.bolivia: ["https://en.wikipedia.org/wiki/2023_Bolivian_Primera_Divisi%C3%B3n", 3],
      n.colombia: ["https://en.wikipedia.org/wiki/2023_Categor%C3%ADa_Primera_A_season", 3],
      n.chile: ["https://en.wikipedia.org/wiki/2023_Chilean_Primera_Divisi%C3%B3n", 3],
      n.equador: ["https://en.wikipedia.org/wiki/2023_Ecuadorian_Serie_A", 3],
      n.peru: ["https://en.wikipedia.org/wiki/2023_Liga_1_(Peru)", 3],
      n.paraguai: ["https://en.wikipedia.org/wiki/2023_Paraguayan_Primera_Divisi%C3%B3n_season", 5],
      n.uruguai: ["https://en.wikipedia.org/wiki/2023_Uruguayan_Primera_Divisi%C3%B3n_season", 3],
      n.venezuela: ["https://en.wikipedia.org/wiki/2023_Venezuelan_Primera_Divisi%C3%B3n_season", 6],

      n.mexico: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Liga_MX_season", 18],
      n.estadosUnidos: ["https://en.wikipedia.org/wiki/2023_Major_League_Soccer_season", 5],

      n.australia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_A-League_Men", 4],

      n.arabia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Saudi_Professional_League", 4],
      n.bahrein: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Bahraini_Premier_League", 2],
      n.eau: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_UAE_Pro_League", 4],
      n.iran: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Persian_Gulf_Pro_League", 6],
      n.iraque: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Iraqi_Premier_League", 2],
      n.kuwait: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Kuwaiti_Premier_League", 0],
      n.libano: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Lebanese_Premier_League", 2],
      n.qatar: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Qatar_Stars_League", 3],
      n.siria: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Syrian_Premier_League", 3],

      n.uzbekistao: ["https://en.wikipedia.org/wiki/2023_Uzbekistan_Super_League", 3],

      n.cingapura: ["https://en.wikipedia.org/wiki/2023_Singapore_Premier_League", 5],
      n.china: ["https://en.wikipedia.org/wiki/2023_Chinese_Super_League", 3],
      n.coreiaSul: ["https://en.wikipedia.org/wiki/2023_K_League_1", 4],
      n.japao: ["https://en.wikipedia.org/wiki/2023_J1_League", 4],
      //n.filipinas: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Philippines_Football_League", 4],
      n.india: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Indian_Super_League", 4],
      n.indonesia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Liga_1_(Indonesia)", 4],
      n.malasia: ["https://en.wikipedia.org/wiki/2023_Malaysia_Super_League", 6],
      n.nepal: ["https://en.wikipedia.org/wiki/2023_Martyr%27s_Memorial_A-Division_League", 4],
      n.tailandia: ["https://en.wikipedia.org/wiki/2024%E2%80%9324_Thai_League_1", 5],
      n.vietna: ["https://en.wikipedia.org/wiki/2023_V.League_1", 5],

      n.argelia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Algerian_Ligue_Professionnelle_1", 4],
      n.egito: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Egyptian_Premier_League", 3],
      n.marrocos: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Botola", 5],
      n.tunisia: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Tunisian_Ligue_Professionnelle_1", 8],
      n.angola: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Girabola", 0],
      n.africasul: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_South_African_Premier_Division", 3],
      n.nigeria: ["https://en.wikipedia.org/wiki/2023%E2%80%9324_Nigeria_Professional_Football_League", 0],

    };
  }

  String getLeagueFromCountryName(String countryName) {
    Map map = getLeagueNationalityMap();
    for (var entry in map.entries) {
      if (entry.value == countryName) {
        return entry.key;
      }
    }
    return LeagueOfficialNames().inglaterra1;// Value not found in the map
  }

  Future<void> getLeagueTable(String chosenLeagueName) async {
    List parameters = urls[chosenLeagueName];

    String url = parameters[0];
    int tableNumber = parameters[1];

    final response = await http.get(Uri.parse(url));
    final document = parser.parse(response.body);
    final table = document.querySelectorAll('table.wikitable')[tableNumber];
    final rows = table.querySelectorAll('tr');


    standings = [];
    // iterate through each row in the table
    List oneDimensionalList = [];
    for (var row in rows) {
      // get the cells in this row
      final cells = row.querySelectorAll('th, td');

      for (var cell in cells) {
        oneDimensionalList.add(cell.text.trim());
      }
    }


    List<dynamic> lista = oneDimensionalList.map((str) => int.tryParse(str) ?? str).toList();
    List<List<dynamic>> lines = [];

    List<dynamic> currentLine = [];
    for (int i = 12; i < lista.length; i++) {
      if (lista[i] is String && currentLine.length>9) {
        if (currentLine.isNotEmpty) {
          currentLine.removeLast();
          lines.add(currentLine);
          currentLine = [];
        }
      }
      currentLine.add(lista[i]);
    }

    if (currentLine.isNotEmpty) {
      lines.add(currentLine);
    }

    for (dynamic lined in lines){
      if(lined[0].isNotEmpty){
        String clubName = lined[0];
        clubName = clubName.split('(')[0].trim();
        clubName = clubName.split('[')[0].trim();
        clubName = getAppClubName(clubName, chosenLeagueName, LeagueOfficialNames());

        lined[5] = lined[5].toString().split('[')[0].trim();
        lined[6] = lined[6].toString().split('[')[0].trim();
        lined[5] = int.parse(lined[5].toString());
        lined[6] = int.parse(lined[6].toString());

        standings.add({
          'team': clubName,
          'matchs': lined[1].toString(),
          'win': lined[2].toString(),
          'draw': lined[3].toString(),
          'loss': lined[4].toString(),
          'GM': lined[5].toString(),
          'GS': lined[6].toString(),
          'SG': (lined[5]-lined[6]).toString(),
          'points': lined[8].toString().split('[')[0].trim(),
        });
      }
    }

  }


  String getAppClubName(String name, String leagueName, LeagueOfficialNames l){
    ClubName n = ClubName();

    //Clubs with duplicate names
    if(name == "Arsenal"  && leagueName == l.inglaterra1) return n.arsenal;
    if(name == "Liverpool"  && leagueName == l.inglaterra1) return n.liverpool;
    if(name == "Barcelona"  && leagueName == l.espanha1) return n.barcelona;
    if(name == "Sabah" && leagueName == l.azerbaijao) return n.sabahFK;
    if(name == "Gorica" && leagueName==l.croacia) return n.gorica;
    if(name == "Gorica" && leagueName==l.eslovenia) return n.goricaSLO;
    if(name == "Bohemians"  && leagueName == l.irlanda) return n.bohemian;
    if(name == "Arsenal" && leagueName == l.montenegro) return n.arsenaltivat;
    if(name == "Portuguesa" && leagueName == l.brasil1) return n.portuguesa;
    if(name == "São José" && leagueName == l.brasil3) return n.saojoseRS;
    if(name == "Racing"  && leagueName == l.argentina) return n.racing;
    if(name == "River Plate"  && leagueName == l.argentina) return n.riverplate;
    if(name == "Arsenal" && leagueName == l.argentina) return n.arsenalsarandi;
    if(name == "Libertad" && leagueName == l.uruguai) return n.libertad;
    if(name == "Nacional" && leagueName == l.uruguai) return n.nacional;
    if(name == "Liverpool" && leagueName == l.uruguai) return n.liverpoolURU;
    if(name == "Racing" && leagueName == l.uruguai) return n.racinguru;
    if(name == "River Plate" && leagueName == l.uruguai) return n.riverURU;
    if(name == "Everton" && leagueName == l.chile) return n.evertonchi;
    if(name == "Nacional" && leagueName == l.paraguai) return n.nacionalPAR;
    if(name == "Libertad" && leagueName == l.equador) return n.libertadEQU;
    if(name == "Portuguesa" && leagueName == l.venezuela) return n.portuguesaven;
    if(name == "Olympic" && leagueName==l.uzbekistao) return n.olympictashkent;
    if(name == "Al-Ittihad" && leagueName==l.arabia) return n.alittihad;
    if(name == "Al-Shabab" && leagueName==l.arabia) return n.alshabab;
    if(name == "Al-Ahli" && leagueName==l.bahrein) return n.alahliBAH;
    if(name == "Al-Shabab" && leagueName==l.bahrein) return n.alshababBAH;
    if(name == "Al Nasr" && leagueName==l.eau) return n.alnasrEAU;
    if(name == "Al-Ahli" && leagueName==l.qatar) return n.alahlidoha;
    if(name == "Al-Arabi" && leagueName==l.kuwait) return n.alarabiKUW;
    if(name == "Al-Ittihad" && leagueName==l.siria) return n.alittihadSYR;
    if(name == "Al-Jazeera" && leagueName==l.siria) return n.aljazeeraSYR;
    if(name == "Al-Wahda" && leagueName==l.siria) return n.alwahdaSYR;
    if(name == "Al Ittihad" && leagueName==l.egito) return n.alittihadalexandriaclub;

    Map map = {};

    map["Brighton & Hove Albion"] = n.brighton;
    map["Leicester City"] = n.leicester;
    map["Newcastle United"] = n.newcastle;
    map["Tottenham Hotspur"] = n.tottenham;
    map["West Ham United"] = n.westham;
    map["Wolverhampton Wanderers"] = n.wolves;
    map["Accrington Stanley"] = n.accrington;
    map["Birmingham City"] = n.birmigham;
    map["Blackburn Rovers"] = n.blackburn;
    map["Bolton Wanderers"] = n.bolton;
    map["Cambridge United"] = n.cambridge;
    map["Cheltenham Town"] = n.cheltenham;
    map["Coventry City"] = n.coventry;
    map["Fleetwood Town"] = n.fleetwood;
    map["Forest Green Rovers"] = n.forestgreen;
    map["Norwich City"] = n.norwich;
    map["Oxford United"] = n.oxford;
    map["Queens Park Rangers"] = n.qpr;
    map["Peterborough United"] = n.peterborough;
    map["Swansea City"] = n.swansea;
    map["Shrewsbury Town"] = n.shrewsbury;
    map["West Bromwich Albion"] = n.westbromwich;
    map["Wycombe Wanderers"] = n.wycombe;

    map["Inter Milan"] = n.inter;
    map["Internazionale"] = n.inter;
    map["AC Milan"] = n.milan;
    map["Süd Tirol"] = n.sudtirol;
    map["Südtirol"] = n.sudtirol;
    map["Venezia"] = n.venezia;
    //ESPANHA
    map["Alavés"] = n.alaves;
    map["Andorra"] = n.andorra;
    map["Atlético Madrid"] = n.atleticomadrid;
    map["Celta Vigo"] = n.celtavigo;
    map["Girona"] = n.girona;
    map["Mirandés"] = n.mirandes;
    map["Oviedo"] = n.realOviedo;
    map["Sporting Gijón"] = n.sportinggijon;
    map["Villarreal B"] = n.villarrealB;
    map["Zaragoza"] = n.zaragoza;
    //FRANÇA
    map["Annecy"] = n.annecy;
    map["Brest"] = n.brest;
    map["Laval"] = n.lavallois;
    map["Lorient"] = n.lorient;
    map["Nîmes"] = n.nimes;
    map["Niort"] = n.chamois;
    map["Paris Saint-Germain"] = n.psg;
    map["Reims"] = n.reims;
    map["Stade de Reims"] = n.reims;
    map["Marseille"] = n.om;
    map["Pau"] = n.pau;
    map["Rodez"] = n.rodez;
    map["Saint-Étienne"] = n.saintetienne;
    //ALEMANHA
    map["FC Augsburg"] = n.augsburg;
    map["Bayern Munich"] = n.bayernmunique;
    map["VfL Bochum"] = n.bochum;
    map["Darmstadt 98"] = n.darmstadt;
    map["Eintracht Braunschweig"] = n.braunschweiger;
    map["Fortuna Düsseldorf"] = n.fortunadusseldorf;
    map["Hamburger SV"] = n.hamburgo;
    map["1. FC Heidenheim"] = n.heidenheim;
    map["Hertha BSC"] = n.herthaberlim;
    map["1899 Hoffenheim"] = n.hoffenheim;
    map["1. FC Kaiserslautern"] = n.kaiserslautern;
    map["Karlsruher SC"] = n.karlsruher;
    map["Jahn Regensburg"] = n.jahnregensburg;
    map["1. FC Köln"] = n.koln;
    map["SC Freiburg"] = n.freiburg;
    map["1. FC Magdeburg"] = n.magdeburg;
    map["Borussia Mönchengladbach"] = n.moenchengladbach;
    map["1. FC Nürnberg"] = n.nurnberg;
    map["SC Paderborn"] = n.paderborn;
    map["SV Sandhausen"] = n.sandhausen;
    map["Schalke 04"] = n.schalke04;
    map["VfB Stuttgart"] = n.stuttgart;
    map["FC St. Pauli"] = n.stpauli;
    map["VfL Wolfsburg"] = n.wolfsburg;
    //PORTUGAL
    map["Sporting CP"] = n.sporting;
    map["Estrela da Amadora"] = n.estrelaamadora;
    map["Vitória de Guimarães"] = n.vitoriaguimaraes;
    //HOLANDA
    map["AZ"] = n.az;
    map["Emmen"] = n.emmen;
    map["NEC"] = n.necnijmegen;
    map["Heracles Almelo"] = n.heracles;
    map["PSV Eindhoven"] = n.psv;
    map["RKC Waalwijk"] = n.waalwijk;
    map["SC Heerenveen"] = n.heerenveen;
    //TURQUIA
    map["İstanbul Başakşehir"] = n.istanbulbasaksehir;
    map["Çaykur Rizespor"] = n.rizespor;
    //ALBANIA
    map["Partizani"] = n.partizanitirane;
    map["Teuta"] = n.teuta;
    //ANDORRA
    map["FC Santa Coloma"] = n.santacolomafc;
    map["Ordino"] = n.ordino;
    map["Penya Encarnada"] = n.penyaencarnada;
    //ARMENIA
    map["BKMA"] = n.bkmayerevan;
    map["Pyunik"] = n.pyunik;
    //AUSTRIA
    map["Austria Wien"] = n.austria;
    map["LASK"] = n.lasklinz;
    map["Rapid Wien"] = n.rapidwien;
    map["Red Bull Salzburg"] = n.rbsalzburg;
    map["WSG Tirol"] = n.wsgtirol;
    map["TSV Hartberg"] = n.hartberg;
    //AZERBAIJAO
    map["Araz-Naxçıvan"] = n.araznaxcivan;
    map["Kapaz"] = n.kapaz;
    map["Gabala"] = n.qabala;
    map["Neftçi"] = n.neftci;
    map["Sabail"] = n.sebail;
    map["Shamakhi"] = n.shamakhi;
    map["Sumgayit"] = n.sumgayit;
    map["Qarabağ"] = n.qarabag;
    //BELGICA
    map["Club Brugge"] = n.brugge;
    map["Eupen"] = n.kaseupen;
    map["Kortrijk"] = n.kortrijk;
    map["OH Leuven"] = n.leuven;
    map["Antwerp"] = n.royalantwerp;
    map["Seraing"] = n.seraing;
    map["Union SG"] = n.saintgilloise;
    map["Standard Liège"] = n.standardliege;
    map["Sint-Truiden"] = n.sttruidense;
    map["RWD Molenbeek"] = n.molenbeek;
    //BELARUS
    map["BATE Borisov"] = n.bate;
    map["Dynamo Brest"] = n.dinamobrest;
    //BOSNIA
    map["Leotar"] = n.leotar;
    map["Leotar"] = n.leotar;
    map["GOŠK Gabela"] = n.gabela;
    map["Sloboda Tuzla"] = n.slobodatuzla;
    map["Zrinjski Mostar"] = n.zrinjski;
    map["Posušje"] = n.posusje;
    map["Tuzla City"] = n.tuzla;
    //BULGARIA
    map["Beroe"] = n.beroe;
    map["Etar"] = n.etarvelikotarnovo;
    map["Hebar"] = n.hebarpazardzhik;
    map["Ludogorets Razgrad"] = n.ludogorets;
    map["Cherno More"] = n.chernomorevarna;
    //CAZAQUISTAO
    map["Ordabasy"] = n.ordabasy;
    map["Tobol"] = n.tobol;
    //CROACIA
    map["Lokomotiva"] = n.lokzagreb;
    map["Rudeš"] = n.rudes;
    //CHIPRE
    map["Omonia"] = n.omonianicosia;
    map["Karmiotissa"] = n.karmiotissa;
    map["Pafos FC"] = n.pafos;
    map["Othellos Athienou"] = n.othellosathienou;
    map["Karmiotissa FC"] = n.karmiotissa;
    //DINAMARCA
    map["AaB"] = n.aalborg;
    map["AGF"] = n.aarhus;
    map["Brøndby"] = n.brondby;
    map["Copenhagen"] = n.copenhague;
    map["Nordsjælland"] = n.nordsjaelland;
    map["OB"] = n.obodense;
    //ESCÓCIA
    map["Heart of Midlothian"] = n.hearts;
    map["Rangers"] = n.rangers;
    map["Dundee"] = n.dundeefc;
    map["St Mirren"] = n.stmirren;
    map["St Johnstone"] = n.stjohnstone;
    //ESLOVAQUIA
    map["Žilina"] = n.zilina;
    map["Košice"] = n.kosice;
    //ESLOVENIA
    map["Bravo"] = n.bravo;
    map["Domžale"] = n.domzale;
    map["Olimpija Ljubljana"] = n.oljublijana;
    map["Mura"] = n.mura;
    //ESLOVAQUIA
    map["DAC Dunajská Streda"] = n.dac1904;
    map["Dukla Banská Bystrica"] = n.duklaBanska;
    map["Trenčín"] = n.trencin;
    //ESTONIA
    map["Harju"] = n.harju;
    map["FCI Levadia"] = n.levadiatallinn;
    map["Flora"] = n.floratallinn;
    map["Tammeka"] = n.tartutammeka;
    //FINLANDIA
    map["HJK"] = n.helsinki;
    map["KTP"] = n.ktp;
    map["Lahti"] = n.lahti;
    map["Oulu"] = n.oulu;
    map["VPS"] = n.vps;
    //GEORGIA
    map["FC Samtredia"] = n.samtredia;
    //GIBRALTAR
    map["Europa"] = n.europa;
    //GRECIA
    map["AEK Athens"] = n.aek;
    map["Aris"] = n.aris;
    map["Ionikos"] = n.ionikos;
    map["Lamia"] = n.lamia;
    map["Volos"] = n.volos;
    map["OFI"] = n.ofi;
    //HUNGRIA
    map["Debrecen"] = n.debreceni;
    map["Ferencváros"] = n.ferencvaros;
    map["Kecskemét"] = n.kecskemet;
    map["Budapest Honvéd"] = n.honved;
    map["Puskás Akadémia"] = n.puskas;
    map["Újpest"] = n.ujpest;
    //ILHAS FAROE
    map["AB Argir"] = n.abFaroe;
    map["EB/Streymur"] = n.ebstreymur;
    map["ÍF"] = n.iffuglafjordur;
    map["KÍ"] = n.kiklaksvik;
    map["07 Vestur"] = n.vestur;
    map["TB Tvøroyri"] = n.tbtvoroyri;
    map["Víkingur"] = n.vikingurgota;
    //IRLANDA
    map["Derry City"] = n.derrycity;
    map["Drogheda United"] = n.drogheda;
    //ISLANDIA
    map["Breiðablik"] = n.breidablik;
    map["FH"] = n.fh;
    map["HK"] = n.hk;
    map["ÍBV"] = n.ibv;
    map["KR"] = n.kr;
    map["Stjarnan"] = n.stjarnan;
    //ISRAEL
    map["F.C. Ashdod"] = n.ashdod;
    //KOSOVO
    map["Trepça '89"] = n.trepca89;
    //LATVIA LETONIA
    map["Auda"] = n.fkauda;
    map["Daugavpils"] = n.bfcdaugavpils;
    map["Liepāja"] = n.liepaja;
    map["Metta"] = n.mettalu;
    map["Riga"] = n.rigafc;
    map["RFS"] = n.rigasfs;
    map["Tukums 2000"] = n.tukums;
    //LITUANIA
    map["Banga"] = n.bangakaunas;
    map["Hegelmann"] = n.hegelmann;
    map["Sūduva"] = n.suduva;
    //LUXEMBURGO
    map["Racing Union"] = n.unionlux;
    map["UN Käerjéng 97"] = n.kaerjeng;
    //Macedonia
    map["Sileks"] = n.sileks;
    map["Makedonija G.P."] = n.makedonija;
    map["Rabotnicki"] = n.rabotnicki;
    map["Rabotnički"] = n.rabotnicki;
    map["Vardar"] = n.vardar;
    map["AP Brera"] = n.brerastrumica;
    //MALTA
    map["Gżira United"] = n.gziraunited;
    map["Ħamrun Spartans"] = n.hamrunspartans;
    map["Hibernians"] = n.hiberniansMALTA;
    map["Santa Lucia"] = n.stlucia;
    map["Żebbuġ Rangers"] = n.zebbugrangers;
    //MOLDAVIA MOLDOVA
    map["Zimbru Chișinău"] = n.zimbruchisinau;
    //MONTENEGRO
    map["Budućnost"] = n.buducnost;
    map["Dečić"] = n.decic;
    map["Sutjeska"] = n.sutjeska;
    map["Iskra"] = n.iskra;
    //NORUEGA
    map["Odd"] = n.oddgrenland;
    map["Sandefjord"] = n.sandefjord;
    map["Sarpsborg"] = n.sarpsborg;
    map["Tromsø"] = n.tromso;
    map["Vålerenga"] = n.valerenga;
    //PAIS DE GALES
    map["Barry Town United"] = n.barrytown;
    map["Newtown"] = n.newtown;
    map["Cardiff Metropolitan University"] = n.cardiffuni;
    //POLONIA
    map["Jagiellonia Białystok"] = n.jagiellonia;
    map["Legia Warsaw"] = n.legiawarszawa;
    map["Lech Poznań"] = n.lechpoznan;
    map["Widzew Łódź"] = n.widzewlodz;
    map["ŁKS Łódź"] = n.lkslodz;
    map["Wisła Płock"] = n.wislaplock;
    map["Zagłębie Lubin"] = n.zaglebielubin;
    map["Puszcza Niepołomice"] = n.puszczaniepolomice;
    map["Śląsk Wrocław"] = n.slaskwroclaw;
    //REP. TCHECA
    map["Baník Ostrava"] = n.banikostrava;
    map["Slavia Prague"] = n.slaviapraha;
    map["Sparta Prague"] = n.spartapraga;
    map["Bohemians 1905"] = n.bohemians;
    map["České Budějovice"] = n.budejovice;
    map["Mladá Boleslav"] = n.mladaboleslav;
    map["Viktoria Plzeň"] = n.viktoriaplzen;
    //ROMENIA
    map["Argeș Pitești"] = n.argespitesti;
    map["Botoșani"] = n.botosani;
    map["Chindia Târgoviște"] = n.chindiatargoviste;
    map["Dinamo București"] = n.dinamobucuresti;
    map["Oțelul Galați"] = n.otelul;
    map["CFR Cluj"] = n.cluj;
    map["Farul Constanța"] = n.farul;
    map["FC U Craiova 1948"] = n.craiova;
    map["Petrolul Ploiești"] = n.petrolul;
    map["Rapid București"] = n.rapidbucuresti;
    map["FCSB"] = n.steauabucuresti;
    map["Universitatea Cluj"] = n.unicluj;
    map["Voluntari"] = n.voluntari;
    //RUSSIA
    map["CSKA Moscow"] = n.cska;
    map["Dynamo Moscow"] = n.dinamoMoscou;
    map["Fakel Voronezh"] = n.fakel;
    map["Khimki"] = n.khimki;
    map["Krylia Sovetov Samara"] = n.krylyaSovetov;
    map["Lokomotiv Moscow"] = n.lokomotivMoscou;
    map["Pari Nizhny Novgorod"] = n.nizhnyNovgorod;
    map["Spartak Moscow"] = n.spartakmoscou;
    map["Torpedo Moscow"] = n.torpedo;
    map["Ural Yekaterinburg"] = n.ural;
    map["Zenit Saint Petersburg"] = n.zenit;
    //SAN MARINO
    map["Folgore"] = n.folgore;
    //SERVIA
    map["TSC"] = n.backatopola;
    map["TSC Bačka Topola"] = n.backatopola;
    map["Red Star Belgrade"] = n.estrelavermelha;
    map["Javor-Matis"] = n.javor;
    map["Kolubara"] = n.kolubara;
    map["Mladost GAT"] = n.mladostnovisad;
    map["Mladost Lučani"] = n.mladostlucani;
    map["Napredak Kruševac"] = n.napredakkrusevac;
    map["Novi Pazar"] = n.novipazar;
    map["Radnički 1923"] = n.radnicki1923;
    map["Radnički Niš"] = n.radnickinis;
    map["Železničar"] = n.zeleznicar;
    //SUECIA
    map["IF Brommapojkarna"] = n.brommapojkarna;
    map["Degerfors IF"] = n.degerfors;
    map["Djurgårdens IF"] = n.djurgardens;
    map["IF Elfsborg"] = n.elfsborg;
    map["BK Häcken"] = n.hacken;
    map["Halmstads BK"] = n.halmstads;
    map["Hammarby IF"] = n.hammarby;
    map["Kalmar FF"] = n.kalmar;
    map["Malmö FF"] = n.malmo;
    map["Mjällby AIF"] = n.mjallby;
    map["IFK Norrköping"] = n.norrkoping;
    map["IK Sirius"] = n.sirius;
    map["Varbergs BoIS"] = n.varbergs;
    map["IFK Värnamo"] = n.varnamo;
    //SUICA
    map["Grasshopper"] = n.grasshoppers;
    map["Zürich"] = n.zurich;
    map["Yverdon-Sport"] = n.yverdon;
    map["Lausanne-Sport"] = n.lausanne;
    //UCRANIA
    map["Dynamo Kyiv"] = n.dinamokiev;

    //BRASIL
    map["América Mineiro"] = n.americamg;
    map["América de Natal"] = n.americaRN;
    map["Atlético Mineiro"] = n.atleticomg;
    map["Athletico Paranaense"] = n.atleticopr;
    map["Atlético Goianiense"] = n.atleticogo;
    map["Red Bull Bragantino"] = n.bragantino;
    map["Náutico"] = n.nautico;
    map["Novorizontino"] = n.novorizontino;
    map["Operário Ferroviário"] = n.operarioPR;
    map["Vasco da Gama"] = n.vasco;
    map["Ypiranga"] = n.ypirangaRS;
    //ARGENTINA
    map["Estudiantes (LP)"] = n.estudiantes;
    map["Central Córdoba (SdE)"] = n.centralcordoba;
    map["Gimnasia y Esgrima (LP)"] = n.gimnasia;
    map["Instituto"] = n.instituto;
    map["Unión"] = n.unionsantafe;
    //URUGUAI
    map["Cerro"] = n.cerrouru;
    map["Defensor Sporting"] = n.defensor;
    map["Fénix"] = n.fenix;
    map["La Luz"] = n.laluz;
    map["Montevideo City Torque"] = n.montevideocity;
    //BOLIVIA
    map["Palmaflor del Trópico"] = n.palmaflor;
    //PERU
    map["ADT"] = n.tarma;
    map["Carlos A. Mannucci"] = n.carlosmanucci;
    map["Alianza Atlético"] = n.alianzasullana;
    map["Universidad César Vallejo"] = n.cesarvallejo;
    map["Unión Comercio"] = n.ucomercio;
    map["Deportivo Municipal"] = n.depmunicipal;
    map["UTC"] = n.cajamarca;
    //CHILE
    map["Deportes Copiapó"] = n.copiapo;
    map["Universidad de Chile"] = n.lau;
    map["Unión La Calera"] = n.lacalera;
    //PARAGUAI
    map["Guaraní"] = n.guaraniPAR;
    map["Sportivo Ameliano"] = n.ameliano;
    map["Sportivo Trinidense"] = n.trinidense;
    map["General Caballero (JLM)"] = n.generalcaballero;
    //COLOMBIA
    map["Águilas Doradas"] = n.rionegroaguilas;
    map["Atlético Bucaramanga"] = n.bucaramanga;
    map["Independiente Medellín"] = n.imedellin;
    map["Jaguares"] = n.jaguaresCOL;
    map["Deportes Tolima"] = n.tolima;
    map["Santa Fe"] = n.santafe;
    //EQUADOR
    map["Independiente del Valle"] = n.idelvalle;
    map["LDU Quito"] = n.ldu;
    map["Técnico Universitario"] = n.tecnicoUniv;
    //VENEZUELA
    map["Hermanos Colmenarez"] = n.hermanoscolmenarez;
    map["Academia Puerto Cabello"] = n.puertocabello;
    map["Deportivo La Guaira"] = n.laguaira;
    map["Mineros de Guayana"] = n.mineros;
    map["Universidad Central"] = n.ucv;
    map["Deportivo Rayo Zuliano"] = n.zulia;

    //MÉXICO
    map["Atlético San Luis"] = n.sanluis;
    map["León"] = n.leon;
    map["América"] = n.americamex;
    map["Guadalajara"] = n.chivas;
    map["UANL"] = n.tigres;
    map["UNAM"] = n.pumas;
    //EUA
    map["Atlanta United FC"] = n.atlanta;
    map["Chicago Fire FC"] = n.chicago;
    map["FC Cincinnati"] = n.cincinnati;
    map["D.C. United"] = n.dcunited;
    map["Houston Dynamo FC"] = n.houston;
    map["Inter Miami CF"] = n.intermiami;
    map["CF Montréal"] = n.montreal;
    map["Minnesota United FC"] = n.minnesota;
    map["New England Revolution"] = n.nerevolution;
    map["Nashville SC"] = n.nashville;
    map["New York City FC"] = n.nycity;
    map["New York Red Bulls"] = n.nyredbulls;
    map["Orlando City SC"] = n.orlando;
    map["Seattle Sounders FC"] = n.seattle;
    map["St. Louis City SC"] = n.stlouiscity;
    map["Vancouver Whitecaps FC"] = n.vancouver;

    //CHINA
    map["Chengdu Roncheng"] = n.chengdu;
    map["Dalian Pro"] = n.dalian;
    map["Henan Songshan Longmen"] = n.henan;
    map["Henan"] = n.henan;
    map["Shanghai Port"] = n.shanghaisipg;
    map["Tianjin Jinmen Tiger"] = n.tianjin;
    //COREIA DO SUL
    map["Daejeon Hana Citizen"] = n.daejeon;
    map["Gwangju FC"] = n.gwangju;
    map["Incheon United"] = n.incheon;
    map["Jeonbuk Hyundai Motors"] = n.jeonbuk;
    map["Suwon Samsung Bluewings"] = n.suwonsamsung;
    //INDIA
    map["ATK Mohun Bagan"] = n.mohunbagan;
    map["Mohun Bagan SG"] = n.mohunbagan;
    map["Bengaluru"] = n.bengaluru;
    map["East Bengal"] = n.eastbengal;
    map["Goa"] = n.goa;
    map["NorthEast United"] = n.northeast;
    map["Odisha"] = n.odisha;
    //INDONESIA
    map["Arema"] = n.arema;
    map["Borneo Samarinda"] = n.borneo;
    map["Madura United"] = n.madura;
    map["Persib"] = n.persib;
    map["Persebaya"] = n.persebaya;
    map["Persikabo 1973"] = n.persikabo;
    map["PSM"] = n.psmMakassar;
    map["PSS"] = n.pss;
    map["PSIS"] = n.psis;
    //MALASIA
    map["Kuala Lumpur City"] = n.kualalumpur;
    //NEPAL
    map["Jawalakhel YC"] = n.jawalakhel;
    map["FC Khumaltar"] = n.khumaltar;
    map["Machhindra FC"] = n.machhindra;
    map["Manang Marshyangdi F.C."] = n.manangMarshyangdi;
    map["Nepal APF F.C."] = n.nepalapf;
    map["Nepal Police Club"] = n.nepalPolice;
    map["New Road Team F.C."] = n.newroad;
    map["Sankata BSC"] = n.sankata;
    map["Satdobato Youth Club"] = n.satdobatoyouth;
    map["Tribhuvan Army F.C."] = n.tribhuvanarmy;
    //TAILANDIA
    map["Lamphun Warriors"] = n.lamphun;
    map["BG Pathum United"] = n.pathum;
    map["Port"] = n.portfc;
    map["PT Prachuap"] = n.prachuap;
    map["Ratchaburi"] = n.ratchaburi;
    map["Sukhotai"] = n.sukhothai;
    //VIETNA
    map["Haiphong FC"] = n.haiphong;
    map["Hanoi FC"] = n.hanoi;
    map["Hanoi Police"] = n.hanoipolice;
    map["Khanh Hoa FC"] = n.khanhhoa;
    map["Hoang Anh Gia Lai"] = n.gialai;
    map["Ho Chi Minh City FC"] = n.hochiminh;
    map["Thep Xanh Nam Dinh"] = n.namdinh;
    map["Topenland Binh Dinh"] = n.topenland;
    map["Dong A Thanh Hoa"] = n.thanhoa;
    //UZBEQUISTAO
    map["AGMK"] = n.agmk;
    map["Metallurg"] = n.metallurg;
    map["Navbahor"] = n.navbahor;
    map["Nasaf"] = n.nasafqarshi;
    map["Neftchi"] = n.neftchifargona;
    map["Sogdiana"] = n.sogdiyona;
    map["Surkhon"] = n.surkhon;

    //ARABIA SAUDITA
    map["Al-Ahli"] = n.alahli;
    map["Al-Adalah"] = n.aladalah;
    map["Al-Batin"] = n.albatin;
    map["Al-Ettifaq"] = n.alettifaq;
    map["Al-Fateh"] = n.alfateh;
    map["Al-Fayha"] = n.alfayha;
    map["Al-Hazem"] = n.alhazem;
    map["Al-Hilal"] = n.alhilal;
    map["Al-Khaleej"] = n.alkhaleej;
    map["Al-Nassr"] = n.alnassr;
    map["Al-Okhdood"] = n.alokhdood;
    map["Al-Raed"] = n.alraed;
    map["Al-Riyadh"] = n.alriad;
    map["Al-Tai"] = n.altai;
    map["Al-Taawoun"] = n.altaawoun;
    map["Al-Wehda"] = n.alwehda;
    //BAHREIN
    map["Bahrain SC"] = n.bahrain;
    //EAU
    map["Al Ain"] = n.alain;
    map["Al Bataeh"] = n.albataeh;
    map["Sharjah"] = n.alsharjah;
    map["Dibba Al Fujairah"] = n.dibbafuj;
    map["Shabab Al Ahli"] = n.shababalahli;
    //IRÃ
    map["Mes Kerman"] = n.meskerman;
    map["Naft Masjed Soleyman"] = n.naftmasjedsoleyman;
    map["Sanat Naft"] = n.sanatnaft;
    //KUWAIT
    //LEBANON
    map["Ansar"] = n.alansar;
    map["Ahed"] = n.alahed;
    map["Safa"] = n.alsafa;
    map["Tadamoun Sour"] = n.tadamonsour;
    map["Tripoli"] = n.tripoliLEB;
    //QATAR
    map["Al-Arabi"] = n.alarabi;
    map["Al-Duhail"] = n.alduhail;
    map["Al-Gharafa"] = n.algharafa;
    map["Al-Markhiya"] = n.almarkhiya;
    map["Al-Rayyan"] = n.alrayyan;
    map["Al-Sadd"] = n.alsadd;
    map["Al-Sailiya"] = n.alsailiya;
    map["Al-Shamal"] = n.alshamal;
    map["Al-Wakrah"] = n.alwakrah;
    map["Qatar SC"] = n.qatar;
    //SYRIA
    map["Al-Taliya"] = n.altaliya;

    //AUSTRALIA
    map["Western Sydney Wanderers"] = n.sydneywanderers;

    //ARGELIA
    map["HB Chelghoum Laïd"] = n.chelghoumlaid;
    //EGITO
    //MARROCOS
    map["RS Berkane"] = n.berkane;
    map["Difaâ El Jadidi"] = n.difaa;
    map["AS FAR"] = n.farrabat;
    map["Fath Union Sport"] = n.fusrabat;
    map["Ittihad Tanger"] = n.irtanger;
    map["SCC Mohammédia"] = n.chababmoh;
    map["Raja CA"] = n.rajacasablanca;
    map["MAS Fès"] = n.maghreb;
    map["MC Oujda"] = n.moulodiaoujda;
    map["Olympic Safi"] = n.safi;
    map["Olympic Club de Safi"] = n.safi;
    map["Jeunesse Sportive Soualem"] = n.soualem;
    map["MA Tétouan"] = n.moghrebtetouan;
    map["Moghreb Tétouan"] = n.moghrebtetouan;
    map["Wydad AC"] = n.wydad;
    map["RCA Zemamra"] = n.zemamra;
    //TUNISIA
    map["Olympique Béja"] = n.olympiquebeja;
    map["US Ben Guerdane"] = n.benguerdane;
    map["CS Sfaxien"] = n.sfaxien;
    map["US Tataouine"] = n.tataouine;

    //AFRICA DO SUL
    map["AmaZulu"] = n.amazulu;
    map["Lamontville Golden Arrows"] = n.goldenarrows;
    map["SuperSport United"] = n.supersport;
    //ANGOLA
    map["Primeiro de Agosto"] = n.agosto;
    map["Cuando Cubango FC"] = n.cuandocubango;
    map["Desportivo da Lunda Sul"] = n.lundasul;
    map["Desportivo da Huíla"] = n.huilaANG;
    map["Recreativo do Libolo"] = n.libolo;
    map["Bravos do Maquis"] = n.maquis;
    map["Sporting de Cabinda"] = n.sptCabinda;
    map["Wiliete SC"] = n.wiliete;

    if(map.containsKey(name)){
      return map[name];
    }else{
      return name;
    }
  }

}