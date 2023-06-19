import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/dict_keys/player_stats_keys.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/leagues_historic.dart';
import 'package:fifa/widgets/league_selection_row.dart';
import 'package:fifa/pages/table/widgets/matchs.dart';
import 'package:fifa/pages/table/widgets/player_statistics.dart';
import 'package:fifa/pages/table/widgets/table_widget.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/button_border_green.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TableNacional extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final int chosenLeagueIndex;
  const TableNacional({Key? key, required this.chosenLeagueIndex}) : super(key: key);
  @override
  _TableNacionalState createState() => _TableNacionalState();
}

class _TableNacionalState extends State<TableNacional>  with TickerProviderStateMixin  {

  late String chosenLeagueName;
  League myLeague = League(index: My().leagueID);
  late int rodadaMatch = myLeague.nClubs-1;
  Map leaguesMap = {};

  late TabController _tabController;
  int chosenIcon = 2;


  late GoogleMapController googleMapController;
  final List<Coordinates> coordinates = [];
  List<Marker> _markers = <Marker>[];
  List<Marker> _markersShow = <Marker>[];

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }
  doThisOnLaunch() {
    _tabController = TabController(vsync: this, length: 2);
    //INDEX INICIAL
    chosenLeagueName = League(index: widget.chosenLeagueIndex).name;
    //rodada inicial mostrada
    if(rodada < myLeague.nClubs-1){
      rodadaMatch = rodada;
    }

    //GET LEAGUES CLASSES
    for(int i=0;i<leaguesListRealIndex.length;i++){
      int leagueID = leaguesListRealIndex[i];
      League league = League(index: leagueID);
      leaguesMap[league.name] = league;
    }

    setState(() {});
  }

  getClubsMarkers(GoogleMapController googleMapControllerLocal, League league) async{
    ClubDetails clubDetails = ClubDetails();
    googleMapController = googleMapControllerLocal;
    _markers = [];
    List<BitmapDescriptor> customIcon = [];
    for (String clubName in league.allClubsName) {
      if(clubDetails.getCoordinate(clubName).latitude != 0){
        coordinates.add(clubDetails.getCoordinate(clubName));

        //ADD MARKER
        await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(100, 100)),
            'assets/clubs/'+FIFAImages().imageLogo(clubName)+'.png')
            .then((d) {
          customIcon.add(d);
        });
             _markers.add(
              Marker(
                markerId: MarkerId(clubName),
                position: LatLng(coordinates.last.latitude,coordinates.last.longitude),
                onTap: () async{},
                icon: customIcon.last,
                //infoWindow: InfoWindow(title: clubName),
                //icon: clubsAllNameList.indexOf(clubName) < 40 ? _markersIcons[clubsAllNameList.indexOf(clubName)] : BitmapDescriptor.defaultMarker,
              ),
            );

        CameraPosition newPosition = CameraPosition(
          target: LatLng(coordinates.last.latitude, coordinates.last.longitude), // New York coordinates
          zoom: 3.0,
        );
        googleMapController.animateCamera(CameraUpdate.newCameraPosition(newPosition));

      }
    }

    _markersShow = [];
    _markersShow = List.from(_markers);
    setState(() {});
  }

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return  DefaultTabController(
        length: 2,
        child: Scaffold(
        body:  Stack(
            children: [

              Images().getWallpaper(),

              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [

                    const SizedBox(height: 32),
                    Container(
                      color: appBarMyClubColor(),
                      child: Row(
                        children: [
                          backButton(context),
                          Image.asset(FIFAImages().campeonatoLogo(chosenLeagueName),height: 32,width: 32),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(chosenLeagueName,textAlign:TextAlign.center,style: EstiloTextoBranco.negrito16),
                              Text('${Translation(context).text.matchWeek} ' + rodada.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
                            ],
                          ),
                          const Spacer(),
                          ButtonBorderGreen(
                            onTap: (){
                              navigatorPush(context, HistoricLeague(chosenLeagueName: chosenLeagueName));
                            }, child: Text(ano.toString(), style: EstiloTextoBranco.text14)
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 30,
                      color: appBarMyClubColor(),
                      child: TabBar(
                        indicatorColor: AppColors().green,
                        controller: _tabController,
                        tabs: const [
                          Tab(text: "Tabela"),
                          Tab(text: "Estatísticas"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          fullTable(chosenLeagueName),
                          rowStatistics(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ////////////////////////////////////
              //SELECT LEAGUE
              Container(
                padding: EdgeInsets.only(top:Sized(context).height- 50),
                child: LeagueSelectionRow(
                    chosenLeagueName: chosenLeagueName,
                    leaguesListRealIndex: leaguesListRealIndex,
                    onTap: (String leagueName){
                      chosenLeagueName = leagueName;
                      // getClubsMarkers(googleMapController, leaguesMap[chosenLeagueName]);
                      setState(() {});
                    }
                ),
              ),

            ]
        )
    )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

  Widget fullTable(String leagueName){
    return SingleChildScrollView(
      child: Column(
        children: [
          tabelaClassificacaoWidget(context,leaguesMap[chosenLeagueName]),
          //mapLeagueClubs(leaguesMap[chosenLeagueName]),
        ],
      ),
    );
  }

  Widget mapLeagueClubs(League league){
    return  SizedBox(
      height: 200,
      width: 300,
      child: GoogleMap(
        mapType: MapType.satellite,
        tiltGesturesEnabled: false,
        indoorViewEnabled: false,
        rotateGesturesEnabled: false,
        compassEnabled: false,

        initialCameraPosition: CameraPosition(
        target: LatLng(
            ClubDetails().getCoordinate(league.allClubsName[0]).latitude,
            ClubDetails().getCoordinate(league.allClubsName[0]).latitude,
        ),
        zoom: 4.0,
        ),
        onMapCreated: (GoogleMapController googleMapControllerLocal){
          getClubsMarkers(googleMapControllerLocal,leaguesMap[chosenLeagueName]);
        },
        markers: Set<Marker>.of(_markersShow),
      ),
    );
  }

  Widget rowStatistics(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        matchsWidget(),

        Expanded(
          child: Container(
            color: AppColors().greyTransparent,
            child: chosenIcon==2 ? wYellowRedCardWidget(context, leaguesMap[chosenLeagueName], 0)
                : chosenIcon==3 ? wYellowRedCardWidget(context, leaguesMap[chosenLeagueName], 1)
                : chosenIcon==4 ? wYellowRedCardWidget(context, leaguesMap[chosenLeagueName], 2)
                : chosenIcon==5 ? wYellowRedCardWidget(context, leaguesMap[chosenLeagueName], 3)
                : chosenIcon==6 ? wYellowRedCardWidget(context, leaguesMap[chosenLeagueName], 4)
                : chosenIcon==7 ? wYellowRedCardWidget(context, leaguesMap[chosenLeagueName], 5)
                : Container(),
          ),
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              componentButton(2, FilterPlayersTitle().artilheiros),
              componentButton(5, FilterPlayersTitle().assists),
              componentButton(6, FilterPlayersTitle().bestPlayer),
              componentButton(7, FilterPlayersTitle().cleanSheets),
              componentButton(3, FilterPlayersTitle().yellowCards),
              componentButton(4, FilterPlayersTitle().redCards),
            ],
          ),
        ),
        const SizedBox(height: 8),

      ],
    );
  }


////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////

  Widget componentButton(int optionNumber, String title){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          chosenIcon = optionNumber;
          setState((){});
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors().greyTransparent,
            border: Border.all(
              color: chosenIcon == optionNumber ? Colors.white : AppColors().greyTransparent,
              width: 1.0,
            ),
          ),
          child: Text(title, style: EstiloTextoBranco.text16),
        ),
      ),
    );
  }
  Widget componentTable(int optionNumber){
    return Container(
      color: chosenIcon==optionNumber ? Colors.teal : Colors.transparent,
      padding: const  EdgeInsets.all(2),
      child: GestureDetector(
        onTap:(){
          chosenIcon = optionNumber;
          setState(() {});
        },
        child: const Icon(Icons.table_chart, color: Colors.white, size:50),
      ),
    );
  }
Widget matchsWidget(){

  League chosenLeagueClass = leaguesMap[chosenLeagueName];
  if(rodadaMatch >= chosenLeagueClass.nClubs-1){
    rodadaMatch = chosenLeagueClass.nClubs-1;
  }
  return Container(
    color: AppColors().greyTransparent,
    child: Column(
      children: [
        Row(
          children: [

            GestureDetector(
                onTap:(){
                  if(rodadaMatch>1) {
                    rodadaMatch --;
                  }
                  setState(() {});
                },
                child: const Icon(Icons.arrow_left,color:Colors.white,size:50)
            ),

            Expanded(child: Text('${Translation(context).text.matchWeek} '+rodadaMatch.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.negrito16)),

            GestureDetector(
                onTap:(){
                  if(rodadaMatch<chosenLeagueClass.getNTeams()-1) {
                    rodadaMatch ++;
                  }
                  setState(() {});
                },
                child: const Icon(Icons.arrow_right,color:Colors.white,size:50)
            ),


          ],
        ),

        wMatchsTable(rodadaMatch, leaguesMap[chosenLeagueName]),

      ],
    ),
  );
}


}