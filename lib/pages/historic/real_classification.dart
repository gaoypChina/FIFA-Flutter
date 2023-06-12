import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/leagues_historic.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/club_names.dart';
import 'package:fifa/values/historic_champions/historic_champions.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/bottom_sheet/bottom_sheet_league_classification.dart';
import 'package:fifa/widgets/league_selection_row.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class RealClassificationPage extends StatefulWidget {
  final String choosenCountryName;
  const RealClassificationPage({Key? key, required this.choosenCountryName}) : super(key: key);

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
  n.irlanda: ["https://en.wikipedia.org/wiki/2023_League_of_Ireland_Premier_Division", 3],
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
          clubName = clubName.replaceFirst(" (O)","").replaceFirst(" (P)","").replaceFirst(" (X)","");
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
              Container(
                color: appBarMyClubColor(),
                child: Row(
                  children: [
                    backButtonText(context,'Tabela de Classificação'),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap:(){
                          List classificationNames = mapChampions(choosenLeagueName)[ano-1];
                          bottomSheetShowLeagueClassification(context, classificationNames);
                        },
                        child: const Icon(Icons.table_chart,color:Colors.white,size: 32),
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
                    LeagueSelectionRow(
                        choosenLeagueName: choosenLeagueName,
                        leaguesListRealIndex: leaguesListRealIndex,
                        onTap: (String leagueName){
                          choosenLeagueName = leagueName;
                          getLeagueTable(urls[choosenLeagueName]);
                          setState(() {});
                        }
                    ),

                    for(String leagueName in LeagueOfficialNames().getAllLeagueNames())
                      countryFlagsSelectionBottomWidget2(
                          leagueName: leagueName,
                          choosenLeagueName: choosenLeagueName,
                          onTap: (){
                            choosenLeagueName = leagueName;
                            getLeagueTable(urls[choosenLeagueName]);
                            setState(() {});
                          })
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
  if(name == "Al-Ittihad" && leagueName==l.arabia) return n.alIttihad;
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

  map["Annecy"] = n.annecy;
  map["Brest"] = n.brest;
  map["Laval"] = n.lavallois;
  map["Lorient"] = n.lorient;
  map["Nîmes"] = n.nimes;
  map["Niort"] = n.chamois;
  map["Paris Saint-Germain"] = n.psg;
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
  map["Vitória de Guimarães"] = n.vitoriaguimaraes;
  //HOLANDA
  map["AZ"] = n.az;
  map["Emmen"] = n.emmen;
  map["NEC"] = n.necnijmegen;
  map["PSV Eindhoven"] = n.psv;
  map["RKC Waalwijk"] = n.waalwijk;
  map["SC Heerenveen"] = n.heerenveen;
  //TURQUIA
  map["İstanbul Başakşehir"] = n.istanbulbasaksehir;
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
  //AZERBAIJAO
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
  map["Antwerp"] = n.royalAntwerp;
  map["Seraing"] = n.seraing;
  map["Union SG"] = n.saintgilloise;
  map["Standard Liège"] = n.standardliege;
  map["Sint-Truiden"] = n.sttruidense;
  //BELARUS
  map["BATE Borisov"] = n.bate;
  map["Dynamo Brest"] = n.dinamobrest;
  //BOSNIA
  map["Leotar"] = n.leotar;
  map["Posušje"] = n.posusje;
  map["Sloboda Tuzla"] = n.slobodatuzla;
  map["Zrinjski Mostar"] = n.zrinjski;
  map["Tuzla City"] = n.tuzla;
  //BULGARIA
  map["Beroe"] = n.beroe;
  map["Hebar"] = n.hebarpazardzhik;
  map["Ludogorets Razgrad"] = n.ludogorets;
  map["Cherno More"] = n.chernomorevarna;
  //CAZAQUISTAO
  map["Ordabasy"] = n.ordabasy;
  map["Tobol"] = n.tobol;
  //CROACIA
  map["Lokomotiva"] = n.lokzagreb;
  //CHIPRE
  map["Omonia"] = n.omonianicosia;
  map["Karmiotissa"] = n.karmiotissa;
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
  map["St Mirren"] = n.stmirren;
  map["St Johnstone"] = n.stjohnstone;
  //ESLOVAQUIA
  map["Žilina"] = n.zilina;
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
  map["Tromsø"] = n.tromso;
  map["Vålerenga"] = n.valerenga;
  //PAIS DE GALES
  map["Newtown"] = n.newtown;
  map["Cardiff Metropolitan University"] = n.cardiffuni;
  //POLONIA
  map["Jagiellonia Białystok"] = n.jagiellonia;
  map["Legia Warsaw"] = n.legiawarszawa;
  map["Lech Poznań"] = n.lechpoznan;
  map["Widzew Łódź"] = n.widzewlodz;
  map["Wisła Płock"] = n.wislaplock;
  map["Zagłębie Lubin"] = n.zaglebielubin;
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
  map["Central Córdoba (SdE)"] = n.centralCordoba;
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
  map["Port"] = n.portFC;
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
  map["Al-Adalah"] = n.aladalah;
  map["Al-Batin"] = n.albatin;
  map["Al-Ettifaq"] = n.alettifaq;
  map["Al-Fateh"] = n.alfateh;
  map["Al-Fayha"] = n.alfayha;
  map["Al-Hilal"] = n.alhilal;
  map["Al-Khaleej"] = n.alkhaleej;
  map["Al-Nassr"] = n.alnassr;
  map["Al-Raed"] = n.alraed;
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
  map["MC Oujda"] = n.moulodiaoujda;
  map["Olympic Club de Safi"] = n.safi;
  map["Jeunesse Sportive Soualem"] = n.soualem;
  map["Moghreb Tétouan"] = n.moghrebtetouan;
  map["Wydad AC"] = n.wydad;
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
