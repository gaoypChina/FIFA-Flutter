import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/leagues_historic.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/club_names.dart';
import 'package:fifa/values/historic_champions/historic_champions.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:fifa/widgets/bottom_sheet_league_classification.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class RealClassificationPage extends StatefulWidget {
  const RealClassificationPage({Key? key}) : super(key: key);

  @override
  State<RealClassificationPage> createState() => _RealClassificationPageState();
}

class _RealClassificationPageState extends State<RealClassificationPage> {
  List<Map<String, String>> _standings  = [];

  LeagueOfficialNames n = LeagueOfficialNames();
  Map urls = {};
  String choosenLeagueName = "";

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    getUrls();
  }
  getUrls(){
    urls = {
      n.inglaterra1: ['https://en.wikipedia.org/wiki/2022%E2%80%9323_Premier_League', 3],
      n.inglaterra2: ['https://en.wikipedia.org/wiki/2022%E2%80%9323_EFL_Championship', 3],
      n.inglaterra3: ['https://en.wikipedia.org/wiki/2022%E2%80%9323_EFL_League_One', 3],
      n.espanha1: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_La_Liga", 4],
      n.espanha2: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Segunda_Divisi%C3%B3n", 4],
      n.italia1: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Serie_A", 5],
      n.italia2: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Serie_B", 4],
      n.alemanha1: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Bundesliga", 4],
      n.alemanha2: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_2._Bundesliga", 4],
      n.franca1: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Ligue_1", 5],
      n.franca2: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Ligue_2", 4],
      n.holanda: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Eredivisie", 4],
      n.portugal: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Primeira_Liga", 3],
      n.turquiaGrecia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_S%C3%BCper_Lig", 3],
      n.albania: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Kategoria_Superiore", 4],
      n.andorra: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Primera_Divisi%C3%B3", 1],
      n.armenia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Armenian_Premier_League", 3],
      n.austria: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Austrian_Football_Bundesliga", 2],
      n.azerbaijao: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Azerbaijan_Premier_League", 5],
      n.belarus: ["https://en.wikipedia.org/wiki/2023_Belarusian_Premier_League", 1],
      n.belgica: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Belgian_Pro_League", 4],
      n.bosnia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Premier_League_of_Bosnia_and_Herzegovina", 2],
      n.bulgaria: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_First_Professional_Football_League_(Bulgaria)", 3],
      n.cazaquistao: ["https://en.wikipedia.org/wiki/2023_Kazakhstan_Premier_League", 4],
      n.chipre: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Cypriot_First_Division", 1],
      n.croacia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Croatian_Football_League", 5],
      n.dinamarca: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Danish_Superliga", 3],
      n.escocia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Scottish_Premiership", 3],
      n.eslovenia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Slovenian_PrvaLiga", 3],
      n.eslovaquia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Slovak_First_Football_League", 4],
      n.estonia: ["https://en.wikipedia.org/wiki/2023_Meistriliiga", 3],
      n.georgia: ["https://en.wikipedia.org/wiki/2023_Erovnuli_Liga", 2],
      n.finlandia: ["https://en.wikipedia.org/wiki/2023_Veikkausliiga", 1],
      n.gibraltar: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Gibraltar_Football_League", 4],
      n.grecia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Super_League_Greece", 3],
      n.hungria: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Nemzeti_Bajnoks%C3%A1g_I", 4],
      n.ilhasfaroe: ["https://en.wikipedia.org/wiki/2023_Faroe_Islands_Premier_League", 1],
      n.irlanda: ["https://en.wikipedia.org/wiki/2023_League_of_Ireland_Premier_Division", 2],
      n.irlandanorte: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_NIFL_Premiership", 1],
      n.islandia: ["https://en.wikipedia.org/wiki/2023_Besta_deild_karla", 1],
      n.israel: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Israeli_Premier_League", 5],
      n.kosovo: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Football_Superleague_of_Kosovo", 2],
      n.letonia: ["https://en.wikipedia.org/wiki/2023_Latvian_Higher_League", 1],
      n.lituania: ["https://en.wikipedia.org/wiki/2023_A_Lyga", 3],
      n.luxemburgo: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Luxembourg_National_Division", 1],
      n.macedonia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Macedonian_First_Football_League", 3],
      n.malta: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Maltese_Premier_League", 4],
      n.moldova: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Moldovan_Super_Liga", 4],
      n.montenegro: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Montenegrin_First_League", 2],
      n.noruega: ["https://en.wikipedia.org/wiki/2023_Eliteserien", 3],
      n.paisgales: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Cymru_Premier", 3],
      n.polonia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Ekstraklasa", 5],
      n.repTcheca: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Czech_First_League", 4],
      n.romenia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_SuperLiga", 3],
      n.russia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Russian_Premier_League", 3],
      n.saomarino: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Campionato_Sammarinese_di_Calcio", 1],
      n.servia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Serbian_SuperLiga", 4],
      n.suecia: ["https://en.wikipedia.org/wiki/2023_Allsvenskan", 3],
      n.suica: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Swiss_Super_League", 3],
      n.ucrania: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Ukrainian_Premier_League", 3],

      n.brasil1: ["https://en.wikipedia.org/wiki/2022_Campeonato_Brasileiro_S%C3%A9rie_A", 7],
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

      n.australia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_A-League_Men", 4],

      n.arabia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Saudi_Professional_League", 4],
      n.bahrein: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Bahraini_Premier_League", 0],
      n.eau: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_UAE_Pro_League", 4],
      n.iran: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Persian_Gulf_Pro_League", 5],
      n.iraque: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Iraqi_Premier_League", 2],
      n.kuwait: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Kuwaiti_Premier_League", 0],
      n.libano: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Lebanese_Premier_League", 2],
      n.qatar: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Qatar_Stars_League", 3],
      n.siria: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Syrian_Premier_League", 3],

      n.uzbekistao: ["https://en.wikipedia.org/wiki/2023_Uzbekistan_Super_League", 3],

      n.cingapura: ["https://en.wikipedia.org/wiki/2023_Singapore_Premier_League", 5],
      n.china: ["https://en.wikipedia.org/wiki/2023_Chinese_Super_League", 3],
      n.coreiaSul: ["https://en.wikipedia.org/wiki/2023_K_League_1", 4],
      n.japao: ["https://en.wikipedia.org/wiki/2023_J1_League", 4],
      //n.filipinas: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Philippines_Football_League", 4],
      n.india: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Indian_Super_League", 4],
      n.indonesia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Liga_1_(Indonesia)", 4],
      n.malasia: ["https://en.wikipedia.org/wiki/2023_Malaysia_Super_League", 6],
      n.nepal: ["https://en.wikipedia.org/wiki/2023_Martyr%27s_Memorial_A-Division_League", 4],
      n.tailandia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Thai_League_1", 5],
      n.vietna: ["https://en.wikipedia.org/wiki/2023_V.League_1", 5],

      n.argelia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Algerian_Ligue_Professionnelle_1", 4],
      n.egito: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Egyptian_Premier_League", 4],
      n.marrocos: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Botola", 5],
      n.tunisia: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Tunisian_Ligue_Professionnelle_1", 7],
      n.angola: ["https://en.wikipedia.org/wiki/2021%E2%80%9322_Girabola", 0],
      n.africaSul: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_South_African_Premier_Division", 2],
      n.nigeria: ["https://en.wikipedia.org/wiki/2022%E2%80%9323_Nigeria_Professional_Football_League", 0],

    };
  }
  Future<void> getLeagueTable(List parameters) async {
    String url = parameters[0];
    int tableNumber = parameters[1];

    final response = await http.get(Uri.parse(url));
    final document = parser.parse(response.body);
    final table = document.querySelectorAll('table.wikitable')[tableNumber];
    final rows = table.querySelectorAll('tr');


    _standings = [];
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

    //print(lines);
    for (dynamic lined in lines){
        if(lined[0].isNotEmpty){
          String clubName = lined[0].replaceFirst(" (Y)","").replaceFirst(" (J)","").replaceFirst(" (R)","");
          clubName = clubName.replaceFirst(" (P)","").replaceFirst(" (X)","");
          clubName = clubName.replaceFirst(" (A)","").replaceFirst(" (C)","").replaceFirst(" (Q)","");
          clubName = clubName.replaceFirst(" (S)","").replaceFirst(" (T)","").replaceFirst(" (Z)","");
          clubName = clubName.replaceFirst(" (C, Q)","").replaceFirst(" (T, Y)","").replaceFirst(" (C, P)","");
          clubName = clubName.replaceFirst("[a]","").replaceFirst("[b]","").replaceFirst("[c]","").replaceFirst("[d]","").replaceFirst("[e]","");
          clubName = getAppClubName(clubName, choosenLeagueName, n);

          lined[5] = lined[5].toString().replaceFirst("[a]","").replaceFirst("[b]","").replaceFirst("[c]","").replaceFirst("[d]","").replaceFirst("[e]","");
          lined[6] = lined[6].toString().replaceFirst("[a]","").replaceFirst("[b]","").replaceFirst("[c]","").replaceFirst("[d]","").replaceFirst("[e]","");
          lined[5] = int.parse(lined[5].toString());
          lined[6] = int.parse(lined[6].toString());

          _standings.add({
            'team': clubName,
            'matchs': lined[1].toString(),
            'win': lined[2].toString(),
            'draw': lined[3].toString(),
            'loss': lined[4].toString(),
            'GM': lined[5].toString(),
            'GS': lined[6].toString(),
            'SG': (lined[5]-lined[6]).toString(),
            'points': lined[8].toString().replaceFirst("[a]","").replaceFirst("[b]","").replaceFirst("[c]","").replaceFirst("[d]",""),
          });
        }
    }

    setState(() {});
  }

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          Images().getWallpaper(),

          Column(
            children: [
              Row(
                children: [
                  backButtonText(context,'Tabela de Classificação'),
                  const Spacer(),
                  Container(
                    color: Colors.red,
                    height:25,
                    width:25,
                    child: GestureDetector(
                      onTap:(){
                        List classificationNames = mapChampions(choosenLeagueName)[ano-1];
                        bottomSheetShowLeagueClassification(context, classificationNames);
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: IconButton(onPressed: (){
                      navigatorPush(context, HistoricLeague(choosenLeagueName: choosenLeagueName));
                    }, icon: const Icon(Icons.outbond_rounded,color: Colors.white,size: 32,)),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: _standings.length,
                  itemBuilder: (context, index) {
                    Map data = _standings[index];
                    return rowTile(index, data);
                  },
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(int i=0;i<leaguesListRealIndex.length;i++)
                      leagueSelectionRow(i),

                    for(String leagueName in LeagueOfficialNames().getAllLeagueNames())
                      leagueHistoric(leagueName)
                  ],
                ),
              ),

            ],
          ),


        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

Widget rowTile(int index,Map data){
    String clubName = data['team'];
    return Container(
      padding: const EdgeInsets.only(top:5, bottom: 5),
      color: ClubDetails().getColors(clubName).primaryColor.withOpacity(0.5),
      child: GestureDetector(
        onTap: (){
          clickClub(context: context, clubName: clubName);
      },
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: Text((index + 1).toString(),style: EstiloTextoBranco.negrito18)),
            Images().getEscudoWidget(clubName, 45,45),
            Container(width: 4),
            SizedBox(
              width: 140,
              child: Text(clubName, style: EstiloTextoBranco.text14),),
            SizedBox(
              width: 30,
              child: Text(data['points'],style: EstiloTextoBranco.negrito18)),
            Container(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('OVR: ${ClubDetails().getOverall(clubName).toStringAsFixed(1)}',style: EstiloTextoBranco.negrito14),
                const Text('J  V  E  D   GM GS SG',style: EstiloTextoBranco.text12),
                Text('${data['matchs']} ${data['win']} ${data['draw']} ${data['loss']}    ${data['GM']}  ${data['GS']}  ${data['SG']}',style: EstiloTextoBranco.text12),
              ],
            ),
          ],
        ),
      ),
    );
}
  Widget leagueSelectionRow(int i){
    int leagueID = leaguesListRealIndex[i];
    String leagueName = League(index: leagueID).getName();

    return GestureDetector(
      onTap: (){
        choosenLeagueName = leagueName;
        getLeagueTable(urls[choosenLeagueName]);
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        color: choosenLeagueName == leagueName ? Colors.redAccent: Colors.white54,
        child: Image.asset(FIFAImages().campeonatoLogo(leagueName),height: 50,width: 50,),
      ),
    );
  }
  Widget leagueHistoric(String leagueName) {
    return GestureDetector(
      onTap: (){
        choosenLeagueName = leagueName;
        getLeagueTable(urls[choosenLeagueName]);
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 9),
        color: choosenLeagueName == leagueName ? Colors.redAccent: Colors.white54,
        child: funcFlagsList(getCountryFromLeague(leagueName), 35, 50),
      ),
    );
  }
}

String getAppClubName(String name, String leagueName, LeagueOfficialNames l){
  ClubName n = ClubName();
  if(name == "Arsenal"  && leagueName == l.inglaterra1){    name = n.arsenal;  }
  else if(name == "Liverpool"  && leagueName == l.inglaterra1){    name = n.liverpool;  }
  else if(name == "Brighton & Hove Albion"){    name = n.brighton;  }
  else if(name == "Leicester City"){    name = n.leicester;  }
  else if(name == "Newcastle United"){    name = n.newcastle;  }
  else if(name == "Tottenham Hotspur"){    name = n.tottenham;  }
  else if(name == "West Ham United"){    name = n.westham;  }
  else if(name == "Wolverhampton Wanderers"){    name = n.wolves;  }
  else if(name == "Accrington Stanley"){    name = n.accrington;  }
  else if(name == "Birmingham City"){    name = n.birmigham;  }
  else if(name == "Blackburn Rovers"){    name = n.blackburn;  }
  else if(name == "Bolton Wanderers"){    name = n.bolton;  }
  else if(name == "Cambridge United"){    name = n.cambridge;  }
  else if(name == "Cheltenham Town"){    name = n.cheltenham;  }
  else if(name == "Coventry City"){    name = n.coventry;  }
  else if(name == "Fleetwood Town"){    name = n.fleetwood;  }
  else if(name == "Forest Green Rovers"){    name = n.forestgreen;  }
  else if(name == "Norwich City"){    name = n.norwich;  }
  else if(name == "Oxford United"){    name = n.oxford;  }
  else if(name == "Queens Park Rangers"){    name = n.qpr;  }
  else if(name == "Peterborough United"){    name = n.peterborough;  }
  else if(name == "Swansea City"){    name = n.swansea;  }
  else if(name == "Shrewsbury Town"){    name = n.shrewsbury;  }
  else if(name == "West Bromwich Albion"){    name = n.westbromwich;  }
  else if(name == "Wycombe Wanderers"){    name = n.wycombe;  }

  if(name == "Inter Milan"){    name = n.inter;  }
  if(name == "Internazionale"){    name = n.inter;  }
  else if(name == "AC Milan"){    name = n.milan;  }
  else if(name == "Süd Tirol"){    name = n.sudtirol;  }
  else if(name == "Südtirol"){    name = n.sudtirol;  }
  else if(name == "Venezia"){    name = n.venezia;  }

  else if(name == "Alavés"){    name = n.alaves;  }
  else if(name == "Andorra"){    name = n.andorra;  }
  else if(name == "Atlético Madrid"){    name = n.atleticomadrid;  }
  else if(name == "Barcelona"  && leagueName == l.espanha1){    name = n.barcelona;  }
  else if(name == "Celta Vigo"){    name = n.celtavigo;  }
  else if(name == "Girona"){    name = n.girona;  }
  else if(name == "Mirandés"){    name = n.mirandes;  }
  else if(name == "Oviedo"){    name = n.realOviedo;  }
  else if(name == "Sporting Gijón"){    name = n.sportinggijon;  }
  else if(name == "Villarreal B"){    name = n.villarrealB;  }
  else if(name == "Zaragoza"){    name = n.zaragoza;  }

  else if(name == "Annecy"){    name = n.annecy;  }
  else if(name == "Brest"){    name = n.brest;  }
  else if(name == "Laval"){    name = n.lavallois;  }
  else if(name == "Lorient"){    name = n.lorient;  }
  else if(name == "Nîmes"){    name = n.nimes;  }
  else if(name == "Niort"){    name = n.chamois;  }
  else if(name == "Paris Saint-Germain"){    name = n.psg;  }
  else if(name == "Marseille"){    name = n.om;  }
  else if(name == "Pau"){    name = n.pau;  }
  else if(name == "Rodez"){    name = n.rodez;  }
  else if(name == "Saint-Étienne"){    name = n.saintetienne;  }
  //ALEMANHA
  else if(name == "FC Augsburg"){    name = n.augsburg;  }
  else if(name == "Bayern Munich"){    name = n.bayernmunique;  }
  else if(name == "VfL Bochum"){    name = n.bochum;  }
  else if(name == "Darmstadt 98"){    name = n.darmstadt;  }
  else if(name == "Eintracht Braunschweig"){    name = n.braunschweiger;  }
  else if(name == "Fortuna Düsseldorf"){    name = n.fortunadusseldorf;  }
  else if(name == "Hamburger SV"){    name = n.hamburgo;  }
  else if(name == "1. FC Heidenheim"){    name = n.heidenheim;  }
  else if(name == "Hertha BSC"){    name = n.herthaberlim;  }
  else if(name == "1899 Hoffenheim"){    name = n.hoffenheim;  }
  else if(name == "1. FC Kaiserslautern"){    name = n.kaiserslautern;  }
  else if(name == "Karlsruher SC"){    name = n.karlsruher;  }
  else if(name == "Jahn Regensburg"){    name = n.jahnregensburg;  }
  else if(name == "1. FC Köln"){    name = n.koln;  }
  else if(name == "SC Freiburg"){    name = n.freiburg;  }
  else if(name == "1. FC Magdeburg"){    name = n.magdeburg;  }
  else if(name == "Borussia Mönchengladbach"){    name = n.moenchengladbach;  }
  else if(name == "1. FC Nürnberg"){    name = n.nurnberg;  }
  else if(name == "SC Paderborn"){    name = n.paderborn;  }
  else if(name == "SV Sandhausen"){    name = n.sandhausen;  }
  else if(name == "Schalke 04"){    name = n.schalke04;  }
  else if(name == "VfB Stuttgart"){    name = n.stuttgart;  }
  else if(name == "FC St. Pauli"){    name = n.stpauli;  }
  else if(name == "VfL Wolfsburg"){    name = n.wolfsburg;  }
  //PORTUGAL
  else if(name == "Sporting CP"){    name = n.sporting;  }
  else if(name == "Vitória de Guimarães"){    name = n.vitoriaguimaraes;  }
  //HOLANDA
  else if(name == "AZ"){    name = n.az;  }
  else if(name == "Emmen"){    name = n.emmen;  }
  else if(name == "NEC"){    name = n.necnijmegen;  }
  else if(name == "PSV Eindhoven"){    name = n.psv;  }
  else if(name == "RKC Waalwijk"){    name = n.waalwijk;  }
  else if(name == "SC Heerenveen"){    name = n.heerenveen;  }
  //TURQUIA
  else if(name == "İstanbul Başakşehir"){    name = n.istanbulbasaksehir;  }
  //ALBANIA
  else if(name == "Partizani"){    name = n.partizanitirane;  }
  else if(name == "Teuta"){    name = n.teuta;  }
  //ANDORRA
  else if(name == "FC Santa Coloma"){    name = n.santacolomafc;  }
  else if(name == "Ordino"){    name = n.ordino;  }
  else if(name == "Penya Encarnada"){    name = n.penyaencarnada;  }
  //ARMENIA
  else if(name == "BKMA"){    name = n.bkmayerevan;  }
  else if(name == "Pyunik"){    name = n.pyunik;  }
  //AUSTRIA
  else if(name == "Austria Wien"){    name = n.austria;  }
  else if(name == "LASK"){    name = n.lasklinz;  }
  else if(name == "Rapid Wien"){    name = n.rapidwien;  }
  else if(name == "Red Bull Salzburg"){    name = n.rbsalzburg;  }
  else if(name == "WSG Tirol"){    name = n.wsgtirol;  }
  //AZERBAIJAO
  else if(name == "Kapaz"){    name = n.kapaz;  }
  else if(name == "Gabala"){    name = n.qabala;  }
  else if(name == "Neftçi"){    name = n.neftci;  }
  else if(name == "Sabah" && leagueName == l.azerbaijao){    name = n.sabahFK;  }
  else if(name == "Sabail"){    name = n.sebail;  }
  else if(name == "Shamakhi"){    name = n.shamakhi;  }
  else if(name == "Sumgayit"){    name = n.sumgayit;  }
  else if(name == "Qarabağ"){    name = n.qarabag;  }
  //BELGICA
  else if(name == "Club Brugge"){    name = n.brugge;  }
  else if(name == "Eupen"){    name = n.kaseupen;  }
  else if(name == "Kortrijk"){    name = n.kortrijk;  }
  else if(name == "OH Leuven"){    name = n.leuven;  }
  else if(name == "Antwerp"){    name = n.royalAntwerp;  }
  else if(name == "Seraing"){    name = n.seraing;  }
  else if(name == "Union SG"){    name = n.saintgilloise;  }
  else if(name == "Standard Liège"){    name = n.standardliege;  }
  else if(name == "Sint-Truiden"){    name = n.sttruidense;  }
  //BELARUS
  else if(name == "BATE Borisov"){    name = n.bate;  }
  else if(name == "Dynamo Brest"){    name = n.dinamobrest;  }
  //BOSNIA
  else if(name == "Leotar"){    name = n.leotar;  }
  else if(name == "Posušje"){    name = n.posusje;  }
  else if(name == "Sloboda Tuzla"){    name = n.slobodatuzla;  }
  else if(name == "Zrinjski Mostar"){    name = n.zrinjski;  }
  else if(name == "Tuzla City"){    name = n.tuzla;  }
  //BULGARIA
  else if(name == "Beroe"){    name = n.beroe;  }
  else if(name == "Hebar"){    name = n.hebarpazardzhik;  }
  else if(name == "Ludogorets Razgrad"){    name = n.ludogorets;  }
  else if(name == "Cherno More"){    name = n.chernomorevarna;  }
  //CAZAQUISTAO
  else if(name == "Ordabasy"){    name = n.ordabasy;  }
  else if(name == "Tobol"){    name = n.tobol;  }
  //CROACIA
  else if(name == "Lokomotiva"){    name = n.lokzagreb;  }
  else if(name == "Gorica" && leagueName==l.croacia){    name = n.gorica;  }
  //CHIPRE
  else if(name == "Omonia"){    name = n.omonianicosia;  }
  else if(name == "Karmiotissa"){    name = n.karmiotissa;  }
  //DINAMARCA
  else if(name == "AaB"){    name = n.aalborg;  }
  else if(name == "AGF"){    name = n.aarhus;  }
  else if(name == "Brøndby"){    name = n.brondby;  }
  else if(name == "Copenhagen"){    name = n.copenhague;  }
  else if(name == "Nordsjælland"){    name = n.nordsjaelland;  }
  else if(name == "OB"){    name = n.obodense;  }
  //ESCÓCIA
  else if(name == "Heart of Midlothian"){    name = n.hearts;  }
  else if(name == "Rangers"){    name = n.rangers;  }
  else if(name == "St Mirren"){    name = n.stmirren;  }
  else if(name == "St Johnstone"){    name = n.stjohnstone;  }
  //ESLOVAQUIA
  else if(name == "Žilina"){    name = n.zilina;  }
  //ESLOVENIA
  else if(name == "Bravo"){    name = n.bravo;  }
  else if(name == "Domžale"){    name = n.domzale;  }
  else if(name == "Gorica" && leagueName==l.eslovenia){    name = n.goricaSLO;  }
  else if(name == "Olimpija Ljubljana"){    name = n.oljublijana;  }
  else if(name == "Mura"){    name = n.mura;  }
  //ESLOVAQUIA
  else if(name == "DAC Dunajská Streda"){    name = n.dac1904;  }
  else if(name == "Dukla Banská Bystrica"){    name = n.duklaBanska;  }
  else if(name == "Trenčín"){    name = n.trencin;  }
  //ESTONIA
  else if(name == "Harju"){    name = n.harju;  }
  else if(name == "FCI Levadia"){    name = n.levadiatallinn;  }
  else if(name == "Flora"){    name = n.floratallinn;  }
  else if(name == "Tammeka"){    name = n.tartutammeka;  }
  //FINLANDIA
  else if(name == "HJK"){    name = n.helsinki;  }
  else if(name == "KTP"){    name = n.ktp;  }
  else if(name == "Lahti"){    name = n.lahti;  }
  else if(name == "Oulu"){    name = n.oulu;  }
  else if(name == "VPS"){    name = n.vps;  }
  //GEORGIA
  else if(name == "FC Samtredia"){    name = n.samtredia;  }
  //GIBRALTAR
  else if(name == "Europa"){    name = n.europa;  }
  //GRECIA
  else if(name == "AEK Athens"){    name = n.aek;  }
  else if(name == "Aris"){    name = n.aris;  }
  else if(name == "Ionikos"){    name = n.ionikos;  }
  else if(name == "Lamia"){    name = n.lamia;  }
  else if(name == "Volos"){    name = n.volos;  }
  else if(name == "OFI"){    name = n.ofi;  }
  //HUNGRIA
  else if(name == "Debrecen"){    name = n.debreceni;  }
  else if(name == "Ferencváros"){    name = n.ferencvaros;  }
  else if(name == "Kecskemét"){    name = n.kecskemet;  }
  else if(name == "Budapest Honvéd"){    name = n.honved;  }
  else if(name == "Puskás Akadémia"){    name = n.puskas;  }
  else if(name == "Újpest"){    name = n.ujpest;  }
  //ILHAS FAROE
  else if(name == "AB Argir"){    name = n.abFaroe;  }
  else if(name == "EB/Streymur"){    name = n.ebstreymur;  }
  else if(name == "ÍF"){    name = n.iffuglafjordur;  }
  else if(name == "KÍ"){    name = n.kiklaksvik;  }
  else if(name == "07 Vestur"){    name = n.vestur;  }
  else if(name == "Víkingur"){    name = n.vikingurgota;  }
  //IRLANDA
  else if(name == "Bohemians"  && leagueName == l.irlanda){    name = n.bohemian;  }
  else if(name == "Derry City"){    name = n.derrycity;  }
  else if(name == "Drogheda United"){    name = n.drogheda;  }
  //ISLANDIA
  else if(name == "Breiðablik"){    name = n.breidablik;  }
  else if(name == "FH"){    name = n.fh;  }
  else if(name == "HK"){    name = n.hk;  }
  else if(name == "ÍBV"){    name = n.ibv;  }
  else if(name == "KR"){    name = n.kr;  }
  else if(name == "Stjarnan"){    name = n.stjarnan;  }
  //ISRAEL
  else if(name == "F.C. Ashdod"){    name = n.ashdod;  }
  //KOSOVO
  else if(name == "Trepça '89"){    name = n.trepca89;  }
  //LATVIA LETONIA
  else if(name == "Auda"){    name = n.fkauda;  }
  else if(name == "Daugavpils"){    name = n.bfcdaugavpils;  }
  else if(name == "Liepāja"){    name = n.liepaja;  }
  else if(name == "Metta"){    name = n.mettalu;  }
  else if(name == "Riga"){    name = n.rigafc;  }
  else if(name == "RFS"){    name = n.rigasfs;  }
  else if(name == "Tukums 2000"){    name = n.tukums;  }
  //LITUANIA
  else if(name == "Banga"){    name = n.bangakaunas;  }
  else if(name == "Hegelmann"){    name = n.hegelmann;  }
  else if(name == "Sūduva"){    name = n.suduva;  }
  //LUXEMBURGO
  else if(name == "Racing Union"){    name = n.unionlux;  }
  else if(name == "UN Käerjéng 97"){    name = n.kaerjeng;  }
  //MALTA
  else if(name == "Gżira United"){    name = n.gziraunited;  }
  else if(name == "Ħamrun Spartans"){    name = n.hamrunspartans;  }
  else if(name == "Hibernians"){    name = n.hiberniansMALTA;  }
  else if(name == "Santa Lucia"){    name = n.stlucia;  }
  else if(name == "Żebbuġ Rangers"){    name = n.zebbugrangers;  }
  //MOLDAVIA MOLDOVA
  else if(name == "Zimbru Chișinău"){    name = n.zimbruchisinau;  }
  //MONTENEGRO
  else if(name == "Arsenal" && leagueName == l.montenegro){    name = n.arsenaltivat;  }
  else if(name == "Budućnost"){    name = n.buducnost;  }
  else if(name == "Dečić"){    name = n.decic;  }
  else if(name == "Sutjeska"){    name = n.sutjeska;  }
  else if(name == "Iskra"){    name = n.iskra;  }
  //NORUEGA
  else if(name == "Odd"){    name = n.odd;  }
  else if(name == "Sandefjord"){    name = n.sanderfjord;  }
  else if(name == "Tromsø"){    name = n.tromso;  }
  else if(name == "Vålerenga"){    name = n.valerenga;  }
  //PAIS DE GALES
  else if(name == "Newtown"){    name = n.newtown;  }
  else if(name == "Cardiff Metropolitan University"){    name = n.cardiffuni;  }
  //POLONIA
  else if(name == "Jagiellonia Białystok"){    name = n.jagiellonia;  }
  else if(name == "Legia Warsaw"){    name = n.legiawarszawa;  }
  else if(name == "Lech Poznań"){    name = n.lechpoznan;  }
  else if(name == "Widzew Łódź"){    name = n.widzewlodz;  }
  else if(name == "Wisła Płock"){    name = n.wislaplock;  }
  else if(name == "Zagłębie Lubin"){    name = n.zaglebielubin;  }
  else if(name == "Śląsk Wrocław"){    name = n.slaskwroclaw;  }
  //REP. TCHECA
  else if(name == "Baník Ostrava"){    name = n.banikostrava;  }
  else if(name == "Slavia Prague"){    name = n.slaviapraha;  }
  else if(name == "Sparta Prague"){    name = n.spartapraga;  }
  else if(name == "Bohemians 1905"){    name = n.bohemians;  }
  else if(name == "České Budějovice"){    name = n.budejovice;  }
  else if(name == "Mladá Boleslav"){    name = n.mladaboleslav;  }
  else if(name == "Viktoria Plzeň"){    name = n.viktoriaplzen;  }
  //ROMENIA
  else if(name == "Argeș Pitești"){    name = n.argespitesti;  }
  else if(name == "Botoșani"){    name = n.botosani;  }
  else if(name == "Chindia Târgoviște"){    name = n.chindiatargoviste;  }
  else if(name == "CFR Cluj"){    name = n.cluj;  }
  else if(name == "Farul Constanța"){    name = n.farul;  }
  else if(name == "FC U Craiova 1948"){    name = n.craiova;  }
  else if(name == "Petrolul Ploiești"){    name = n.petrolul;  }
  else if(name == "Rapid București"){    name = n.rapidbucuresti;  }
  else if(name == "FCSB"){    name = n.steauabucuresti;  }
  else if(name == "Universitatea Cluj"){    name = n.unicluj;  }
  else if(name == "Voluntari"){    name = n.voluntari;  }
  //RUSSIA
  else if(name == "CSKA Moscow"){    name = n.cska;  }
  else if(name == "Dynamo Moscow"){    name = n.dinamoMoscou;  }
  else if(name == "Fakel Voronezh"){    name = n.fakel;  }
  else if(name == "Khimki"){    name = n.khimki;  }
  else if(name == "Krylia Sovetov Samara"){    name = n.krylyaSovetov;  }
  else if(name == "Lokomotiv Moscow"){    name = n.lokomotivMoscou;  }
  else if(name == "Pari Nizhny Novgorod"){    name = n.nizhnyNovgorod;  }
  else if(name == "Spartak Moscow"){    name = n.spartakmoscou;  }
  else if(name == "Torpedo Moscow"){    name = n.torpedo;  }
  else if(name == "Ural Yekaterinburg"){    name = n.ural;  }
  else if(name == "Zenit Saint Petersburg"){    name = n.zenit;  }
  //SAN MARINO
  else if(name == "Folgore"){    name = n.folgore;  }
  //SERVIA
  else if(name == "TSC"){    name = n.backatopola;  }
  else if(name == "TSC Bačka Topola"){    name = n.backatopola;  }
  else if(name == "Red Star Belgrade"){    name = n.estrelavermelha;  }
  else if(name == "Javor-Matis"){    name = n.javor;  }
  else if(name == "Kolubara"){    name = n.kolubara;  }
  else if(name == "Mladost GAT"){    name = n.mladostnovisad;  }
  else if(name == "Mladost Lučani"){    name = n.mladostlucani;  }
  else if(name == "Napredak Kruševac"){    name = n.napredakkrusevac;  }
  else if(name == "Novi Pazar"){    name = n.novipazar;  }
  else if(name == "Radnički 1923"){    name = n.radnicki1923;  }
  else if(name == "Radnički Niš"){    name = n.radnickinis;  }
  //SUECIA
  else if(name == "IF Brommapojkarna"){    name = n.brommapojkarna;  }
  else if(name == "Degerfors IF"){    name = n.degerfors;  }
  else if(name == "Djurgårdens IF"){    name = n.djurgardens;  }
  else if(name == "IF Elfsborg"){    name = n.elfsborg;  }
  else if(name == "BK Häcken"){    name = n.hacken;  }
  else if(name == "Halmstads BK"){    name = n.halmstads;  }
  else if(name == "Hammarby IF"){    name = n.hammarby;  }
  else if(name == "Kalmar FF"){    name = n.kalmar;  }
  else if(name == "Malmö FF"){    name = n.malmo;  }
  else if(name == "Mjällby AIF"){    name = n.mjallby;  }
  else if(name == "IFK Norrköping"){    name = n.norrkoping;  }
  else if(name == "IK Sirius"){    name = n.sirius;  }
  else if(name == "Varbergs BoIS"){    name = n.varbergs;  }
  else if(name == "IFK Värnamo"){    name = n.varnamo;  }
  //SUICA
  else if(name == "Grasshopper"){    name = n.grasshoppers;  }
  else if(name == "Zürich"){    name = n.zurich;  }
  //UCRANIA
  else if(name == "Dynamo Kyiv"){    name = n.dinamokiev;  }

  //BRASIL
  else if(name == "América Mineiro"){    name = n.americamg;  }
  else if(name == "América de Natal"){    name = n.americaRN;  }
  else if(name == "Atlético Mineiro"){    name = n.atleticomg;  }
  else if(name == "Athletico Paranaense"){    name = n.atleticopr;  }
  else if(name == "Atlético Goianiense"){    name = n.atleticogo;  }
  else if(name == "Red Bull Bragantino"){    name = n.bragantino;  }
  else if(name == "Náutico"){    name = n.nautico;  }
  else if(name == "Novorizontino"){    name = n.novorizontino;  }
  else if(name == "Operário Ferroviário"){    name = n.operarioPR;  }
  else if(name == "Portuguesa" && leagueName == l.brasil1){    name = n.portuguesa;  }
  else if(name == "São José" && leagueName == l.brasil3){    name = n.saojoseRS;  }
  else if(name == "Ypiranga"){    name = n.ypirangaRS;  }
  //ARGENTINA
  else if(name == "Estudiantes (LP)"){    name = n.estudiantes;  }
  else if(name == "Central Córdoba (SdE)"){    name = n.centralCordoba;  }
  else if(name == "Gimnasia y Esgrima (LP)"){    name = n.gimnasia;  }
  else if(name == "Instituto"){    name = n.instituto;  }
  else if(name == "Racing"  && leagueName == l.argentina){    name = n.racing;  }
  else if(name == "River Plate"  && leagueName == l.argentina){    name = n.riverplate;  }
  else if(name == "Unión"){    name = n.unionsantafe;  }
  else if(name == "Arsenal" && leagueName == l.argentina){    name = n.arsenalsarandi;  }
  //URUGUAI
  else if(name == "Cerro"){    name = n.cerrouru;  }
  else if(name == "Defensor Sporting"){    name = n.defensor;  }
  else if(name == "Fénix"){    name = n.fenix;  }
  else if(name == "La Luz"){    name = n.laluz;  }
  else if(name == "Libertad" && leagueName == l.uruguai){    name = n.libertad;  }
  else if(name == "Nacional" && leagueName == l.uruguai){    name = n.nacional;  }
  else if(name == "Liverpool" && leagueName == l.uruguai){    name = n.liverpoolURU;  }
  else if(name == "Montevideo City Torque"){    name = n.montevideocity;  }
  else if(name == "Racing" && leagueName == l.uruguai){    name = n.racinguru;  }
  else if(name == "River Plate" && leagueName == l.uruguai){    name = n.riverURU;  }
  //BOLIVIA
  else if(name == "Palmaflor del Trópico"){    name = n.palmaflor;  }
  //PERU
  else if(name == "ADT"){    name = n.tarma;  }
  else if(name == "Carlos A. Mannucci"){    name = n.carlosmanucci;  }
  else if(name == "Alianza Atlético"){    name = n.alianzasullana;  }
  else if(name == "Universidad César Vallejo"){    name = n.cesarvallejo;  }
  else if(name == "Unión Comercio"){    name = n.ucomercio;  }
  else if(name == "Deportivo Municipal"){    name = n.depmunicipal;  }
  else if(name == "UTC"){    name = n.cajamarca;  }
  //CHILE
  else if(name == "Deportes Copiapó"){    name = n.copiapo;  }
  else if(name == "Universidad de Chile"){    name = n.lau;  }
  else if(name == "Unión La Calera"){    name = n.lacalera;  }
  else if(name == "Everton" && leagueName == l.chile){    name = n.evertonchi;  }
  //PARAGUAI
  else if(name == "Guaraní"){    name = n.guaraniPAR;  }
  else if(name == "Nacional" && leagueName == l.paraguai){    name = n.nacionalPAR;  }
  else if(name == "Sportivo Ameliano"){    name = n.ameliano;  }
  else if(name == "Sportivo Trinidense"){    name = n.trinidense;  }
  else if(name == "General Caballero (JLM)"){    name = n.generalcaballero;  }
  //COLOMBIA
  else if(name == "Águilas Doradas"){    name = n.rionegroaguilas;  }
  else if(name == "Atlético Bucaramanga"){    name = n.bucaramanga;  }
  else if(name == "Independiente Medellín"){    name = n.imedellin;  }
  else if(name == "Jaguares"){    name = n.jaguaresCOL;  }
  else if(name == "Deportes Tolima"){    name = n.tolima;  }
  else if(name == "Santa Fe"){    name = n.santafe;  }
  //EQUADOR
  else if(name == "Independiente del Valle"){    name = n.idelvalle;  }
  else if(name == "Libertad" && leagueName == l.equador){    name = n.libertadEQU;  }
  else if(name == "LDU Quito"){    name = n.ldu;  }
  else if(name == "Técnico Universitario"){    name = n.tecnicoUniv;  }
  //VENEZUELA
  else if(name == "Hermanos Colmenarez"){    name = n.hermanoscolmenarez;  }
  else if(name == "Academia Puerto Cabello"){    name = n.puertoCabello;  }
  else if(name == "Deportivo La Guaira"){    name = n.laguaira;  }
  else if(name == "Mineros de Guayana"){    name = n.mineros;  }
  else if(name == "Portuguesa" && leagueName == l.venezuela){    name = n.portuguesaven;  }
  else if(name == "Universidad Central"){    name = n.ucv;  }
  else if(name == "Deportivo Rayo Zuliano"){    name = n.zulia;  }

  //MÉXICO
  else if(name == "Atlético San Luis"){    name = n.sanluis;  }
  else if(name == "León"){    name = n.leon;  }
  else if(name == "América"){    name = n.americamex;  }
  else if(name == "Guadalajara"){    name = n.chivas;  }
  else if(name == "UANL"){    name = n.tigres;  }
  else if(name == "UNAM"){    name = n.pumas;  }
  //EUA
  else if(name == "Atlanta United FC"){    name = n.atlanta;  }
  else if(name == "Chicago Fire FC"){    name = n.chicago;  }
  else if(name == "FC Cincinnati"){    name = n.cincinnati;  }
  else if(name == "D.C. United"){    name = n.dcunited;  }
  else if(name == "Houston Dynamo FC"){    name = n.houston;  }
  else if(name == "Inter Miami CF"){    name = n.intermiami;  }
  else if(name == "CF Montréal"){    name = n.montreal;  }
  else if(name == "Minnesota United FC"){    name = n.minnesota;  }
  else if(name == "New England Revolution"){    name = n.nerevolution;  }
  else if(name == "New York City FC"){    name = n.nycity;  }
  else if(name == "New York Red Bulls"){    name = n.nyredbulls;  }
  else if(name == "Orlando City SC"){    name = n.orlando;  }
  else if(name == "Seattle Sounders FC"){    name = n.seattle;  }
  else if(name == "St. Louis City SC"){    name = n.stlouiscity;  }
  else if(name == "Vancouver Whitecaps FC"){    name = n.vancouver;  }

  //CHINA
  else if(name == "Chengdu Roncheng"){    name = n.chengdu;  }
  else if(name == "Dalian Pro"){    name = n.dalian;  }
  else if(name == "Henan Songshan Longmen"){    name = n.henan;  }
  else if(name == "Henan"){    name = n.henan;  }
  else if(name == "Shanghai Port"){    name = n.shanghaisipg;  }
  else if(name == "Tianjin Jinmen Tiger"){    name = n.tianjin;  }
  //COREIA DO SUL
  else if(name == "Daejeon Hana Citizen"){    name = n.daejeon;  }
  else if(name == "Gwangju FC"){    name = n.gwangju;  }
  else if(name == "Incheon United"){    name = n.incheon;  }
  else if(name == "Jeonbuk Hyundai Motors"){    name = n.jeonbuk;  }
  else if(name == "Suwon Samsung Bluewings"){    name = n.suwonsamsung;  }
  //INDIA
  else if(name == "ATK Mohun Bagan"){    name = n.mohunbagan;  }
  else if(name == "Bengaluru"){    name = n.bengaluru;  }
  else if(name == "East Bengal"){    name = n.eastbengal;  }
  else if(name == "Goa"){    name = n.goa;  }
  else if(name == "NorthEast United"){    name = n.northeast;  }
  else if(name == "Odisha"){    name = n.odisha;  }
  //INDONESIA
  else if(name == "Arema"){    name = n.arema;  }
  else if(name == "Borneo Samarinda"){    name = n.borneo;  }
  else if(name == "Madura United"){    name = n.madura;  }
  else if(name == "Persib"){    name = n.persib;  }
  else if(name == "Persebaya"){    name = n.persebaya;  }
  else if(name == "Persikabo 1973"){    name = n.persikabo;  }
  else if(name == "PSM"){    name = n.psmMakassar;  }
  else if(name == "PSS"){    name = n.pss;  }
  else if(name == "PSIS"){    name = n.psis;  }
  //MALASIA
  else if(name == "Kuala Lumpur City"){    name = n.kualaLumpur;  }
  //NEPAL
  else if(name == "Jawalakhel YC"){    name = n.jawalakhel;  }
  else if(name == "FC Khumaltar"){    name = n.khumaltar;  }
  else if(name == "Machhindra FC"){    name = n.machhindra;  }
  else if(name == "Manang Marshyangdi F.C."){    name = n.manangMarshyangdi;  }
  else if(name == "Nepal APF F.C."){    name = n.nepalapf;  }
  else if(name == "Nepal Police Club"){    name = n.nepalPolice;  }
  else if(name == "New Road Team F.C."){    name = n.newroad;  }
  else if(name == "Sankata BSC"){    name = n.sankata;  }
  else if(name == "Satdobato Youth Club"){    name = n.satdobatoyouth;  }
  else if(name == "Tribhuvan Army F.C."){    name = n.tribhuvanarmy;  }
  //TAILANDIA
  else if(name == "Lamphun Warriors"){    name = n.lamphun;  }
  else if(name == "BG Pathum United"){    name = n.pathum;  }
  else if(name == "Port"){    name = n.portFC;  }
  else if(name == "PT Prachuap"){    name = n.prachuap;  }
  else if(name == "Ratchaburi"){    name = n.ratchaburi;  }
  else if(name == "Sukhotai"){    name = n.sukhothai;  }
  //VIETNA
  else if(name == "Haiphong FC"){    name = n.haiphong;  }
  else if(name == "Hanoi FC"){    name = n.hanoi;  }
  else if(name == "Hanoi Police"){    name = n.hanoipolice;  }
  else if(name == "Khanh Hoa FC"){    name = n.khanhhoa;  }
  else if(name == "Hoang Anh Gia Lai"){    name = n.gialai;  }
  else if(name == "Ho Chi Minh City FC"){    name = n.hochiminh;  }
  else if(name == "Thep Xanh Nam Dinh"){    name = n.namdinh;  }
  else if(name == "Topenland Binh Dinh"){    name = n.topenland;  }
  else if(name == "Dong A Thanh Hoa"){    name = n.thanhoa;  }
  //UZBEQUISTAO
  else if(name == "AGMK"){    name = n.agmk;  }
  else if(name == "Metallurg"){    name = n.metallurg;  }
  else if(name == "Navbahor"){    name = n.navbahor;  }
  else if(name == "Nasaf"){    name = n.nasafQarshi;  }
  else if(name == "Neftchi"){    name = n.neftchifargona;  }
  else if(name == "Olympic" && leagueName==l.uzbekistao){    name = n.olympictashkent;  }
  else if(name == "Sogdiana"){    name = n.sogdiyona;  }
  else if(name == "Surkhon"){    name = n.surkhon;  }
  
  //ARABIA SAUDITA
  else if(name == "Al-Adalah"){    name = n.aladalah;  }
  else if(name == "Al-Batin"){    name = n.albatin;  }
  else if(name == "Al-Ettifaq"){    name = n.alettifaq;  }
  else if(name == "Al-Fateh"){    name = n.alfateh;  }
  else if(name == "Al-Fayha"){    name = n.alfayha;  }
  else if(name == "Al-Hilal"){    name = n.alhilal;  }
  else if(name == "Al-Ittihad" && leagueName==l.arabia){    name = n.alIttihad;  }
  else if(name == "Al-Khaleej"){    name = n.alkhaleej;  }
  else if(name == "Al-Nassr"){    name = n.alnassr;  }
  else if(name == "Al-Raed"){    name = n.alraed;  }
  else if(name == "Al-Shabab" && leagueName==l.arabia){    name = n.alshabab;  }
  else if(name == "Al-Tai"){    name = n.altai;  }
  else if(name == "Al-Taawoun"){    name = n.altaawoun;  }
  else if(name == "Al-Wehda"){    name = n.alwehda;  }
  //BAHREIN
  else if(name == "Al-Ahli" && leagueName==l.bahrein){    name = n.alahliBAH;  }
  else if(name == "Al-Shabab" && leagueName==l.bahrein){    name = n.alshababBAH;  }
  else if(name == "Bahrain SC"){    name = n.bahrain;  }
  //EAU
  else if(name == "Al Ain"){    name = n.alain;  }
  else if(name == "Al Bataeh"){    name = n.albataeh;  }
  else if(name == "Al Nasr" && leagueName==l.eau){    name = n.alnasrEAU;  }
  else if(name == "Sharjah"){    name = n.alsharjah;  }
  else if(name == "Dibba Al Fujairah"){    name = n.dibbafuj;  }
  else if(name == "Shabab Al Ahli"){    name = n.shababalahli;  }
  //IRÃ
  else if(name == "Mes Kerman"){    name = n.meskerman;  }
  else if(name == "Naft Masjed Soleyman"){    name = n.naftmasjedsoleyman;  }
  else if(name == "Sanat Naft"){    name = n.sanatnaft;  }
  //KUWAIT
  else if(name == "Al-Arabi" && leagueName==l.kuwait){    name = n.alarabiKUW;  }
  //LEBANON
  else if(name == "Ansar"){    name = n.alansar;  }
  else if(name == "Ahed"){    name = n.alahed;  }
  else if(name == "Safa"){    name = n.alsafa;  }
  else if(name == "Tadamoun Sour"){    name = n.tadamonsour;  }
  else if(name == "Tripoli"){    name = n.tripoliLEB;  }
  //QATAR
  else if(name == "Al-Ahli" && leagueName==l.qatar){    name = n.alahlidoha;  }
  else if(name == "Al-Arabi"){    name = n.alarabi;  }
  else if(name == "Al-Duhail"){    name = n.alduhail;  }
  else if(name == "Al-Gharafa"){    name = n.algharafa;  }
  else if(name == "Al-Markhiya"){    name = n.almarkhiya;  }
  else if(name == "Al-Rayyan"){    name = n.alrayyan;  }
  else if(name == "Al-Sadd"){    name = n.alsadd;  }
  else if(name == "Al-Sailiya"){    name = n.alsailiya;  }
  else if(name == "Al-Shamal"){    name = n.alshamal;  }
  else if(name == "Al-Wakrah"){    name = n.alwakrah;  }
  else if(name == "Qatar SC"){    name = n.qatar;  }
  //SYRIA
  else if(name == "Al-Ittihad" && leagueName==l.siria){    name = n.alittihadSYR;  }
  else if(name == "Al-Jazeera" && leagueName==l.siria){    name = n.aljazeeraSYR;  }
  else if(name == "Al-Wahda" && leagueName==l.siria){    name = n.alwahdaSYR;  }
  else if(name == "Al-Taliya"){    name = n.altaliya;  }

  //AUSTRALIA
  else if(name == "Western Sydney Wanderers"){    name = n.sydneywanderers;  }

  //ARGELIA
  else if(name == "HB Chelghoum Laïd"){    name = n.chelghoumlaid;  }
  //EGITO
  else if(name == "Al Ittihad" && leagueName==l.egito){    name = n.alittihadalexandriaclub;  }
  //MARROCOS
  else if(name == "RS Berkane"){    name = n.berkane;  }
  else if(name == "Difaâ El Jadidi"){    name = n.difaa;  }
  else if(name == "AS FAR"){    name = n.farRabat;  }
  else if(name == "Fath Union Sport"){    name = n.fusRabat;  }
  else if(name == "Ittihad Tanger"){    name = n.irTanger;  }
  else if(name == "SCC Mohammédia"){    name = n.chababmoh;  }
  else if(name == "Raja CA"){    name = n.rajacasablanca;  }
  else if(name == "MC Oujda"){    name = n.moulodiaOujda;  }
  else if(name == "Olympic Club de Safi"){    name = n.safi;  }
  else if(name == "Jeunesse Sportive Soualem"){    name = n.soualem;  }
  else if(name == "Moghreb Tétouan"){    name = n.moghrebTetouan;  }
  else if(name == "Wydad AC"){    name = n.wydad;  }
  //TUNISIA
  else if(name == "Olympique Béja"){    name = n.olympiquebeja;  }
  else if(name == "US Ben Guerdane"){    name = n.benguerdane;  }
  else if(name == "CS Sfaxien"){    name = n.sfaxien;  }
  else if(name == "US Tataouine"){    name = n.tataouine;  }

  //AFRICA DO SUL
  else if(name == "AmaZulu"){    name = n.amazulu;  }
  else if(name == "Lamontville Golden Arrows"){    name = n.goldenarrows;  }
  else if(name == "SuperSport United"){    name = n.supersport;  }
  //ANGOLA
  else if(name == "Primeiro de Agosto"){    name = n.agosto;  }
  else if(name == "Cuando Cubango FC"){    name = n.cuandocubango;  }
  else if(name == "Desportivo da Lunda Sul"){    name = n.lundasul;  }
  else if(name == "Desportivo da Huíla"){    name = n.huilaANG;  }
  else if(name == "Recreativo do Libolo"){    name = n.libolo;  }
  else if(name == "Bravos do Maquis"){    name = n.maquis;  }
  else if(name == "Sporting de Cabinda"){    name = n.sptCabinda;  }
  else if(name == "Wiliete SC"){    name = n.wiliete;  }


  return name;
}
