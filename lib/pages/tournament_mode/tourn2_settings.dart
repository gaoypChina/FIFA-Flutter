import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/countries/countries_continents.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/tournament_mode/tourn3_team_selection.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:flutter/material.dart';

import '../../values/clubs_all_names_list.dart';

class TournamentSettings extends StatefulWidget {
  const TournamentSettings({Key? key}) : super(key: key);

  @override
  State<TournamentSettings> createState() => _TournamentSettingsState();
}

class _TournamentSettingsState extends State<TournamentSettings> {

  String selectedLeague = LeagueOfficialNames().balkansCup;
  String selectedContinent = Continents().notExist;
  bool _isSwitched = false; // State variable to track the switch state
  int nteams = 16;
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
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
              backButtonText(context,'Tournament Settings'),

              fillClubs(),

              const SizedBox(height: 32),
              
              Container(
                color: AppColors().greyTransparent,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    nteamsWidget(),
                    idaVolta(),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: customButtonContinue(
                  title: "Next",
                  function: (){

                    List<String> shuffledList = List.from(clubsAllNameList)..shuffle();

                    print(shuffledList);

                    List<String> possibleClubs = [];
                    if(selectedLeague == LeagueOfficialNames().balkansCup
                        && selectedContinent == Continents().notExist){
                      possibleClubs = List.from(shuffledList);
                    }else {
                      for (int i = 0; i < shuffledList.length; i++) {
                        if (possibleClubs.length < nteams) {
                          Club club = Club(index: i);
                          if (selectedLeague != LeagueOfficialNames().balkansCup) {
                            if (club.leagueName == selectedLeague) {
                              possibleClubs.add(club.name);
                            }
                          }
                          if(selectedContinent != Continents().notExist){
                            if (club.continent == selectedContinent) {
                              possibleClubs.add(club.name);
                            }
                          }
                        }
                      }
                    }

                    if(possibleClubs.length < nteams){
                      int clubsToComplete = nteams - possibleClubs.length;
                      possibleClubs.addAll(shuffledList.take(clubsToComplete).toList());
                    }
                    Navigator.push(context,MaterialPageRoute(builder: (context) => TeamSelection(clubs: possibleClubs)));
                  }
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
Widget fillClubs(){
  return Container(
    color: AppColors().greyTransparent,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Fill Clubs", style: EstiloTextoBranco.negrito16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const Text("League", style: EstiloTextoBranco.text20),
                const SizedBox(height: 8),
                InkWell(
                    onTap: () async{
                      selectedLeague = (await _showLeagueSelectionBottomSheet(context))!;
                      selectedContinent = Continents().notExist;
                      setState((){});
                    },
                    onDoubleTap: (){
                      selectedLeague = LeagueOfficialNames().balkansCup;
                      setState((){});
                    },
                    child: Images().getLeagueLogo(selectedLeague)),
              ],
            ),
            Column(
              children: [
                const Text("Continent", style: EstiloTextoBranco.text20),
                const SizedBox(height: 8),
                InkWell(
                    onTap: () async{
                      selectedContinent = (await _showContinentSelectionBottomSheet(context))!;
                      selectedLeague = LeagueOfficialNames().balkansCup;
                      setState((){});
                    },
                    onDoubleTap: (){
                      selectedContinent = Continents().notExist;
                      setState((){});
                    },
                    child: Images().getContinentLogo(selectedContinent)),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget nteamsWidget(){
    return Column(
      children: [
        const SizedBox(height: 8),
        const Text("Teams", style: EstiloTextoBranco.text20),
        const SizedBox(height: 16),
        Text(nteams.toStringAsFixed(0), style: EstiloTextoBranco.negrito20),
        Row(
          children: [
            InkWell(onTap:(){
              setState(() {
                nteams -= 1; // Update the state variable on switch change
                if(nteams == 1){
                  nteams = 2;
                }
              });
            },child: const Icon(Icons.arrow_left, color: Colors.white, size: 40)),
            InkWell(onTap:(){
              setState(() {
                nteams += 1; // Update the state variable on switch change
                if(nteams == 33){
                  nteams = 32;
                }
              });
            },child: const Icon(Icons.arrow_right, color: Colors.white, size: 40)),
          ],
        ),
      ],
    );
}
  Widget idaVolta(){
    return Column(
      children: [
        const SizedBox(height: 8),
        const Text("Ida e Volta", style: EstiloTextoBranco.text20),
        const SizedBox(height: 8),
        Switch(
            value: _isSwitched,
            activeColor: Colors.green,
            inactiveTrackColor: Colors.grey.withOpacity(0.5),
            onChanged: (bool newValue){
              setState(() {
                _isSwitched = newValue; // Update the state variable on switch change
              });
            }
        )
      ],
    );
  }

  Future<String?> _showLeagueSelectionBottomSheet(BuildContext context) {

    return showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 600, // Set the desired height of the bottom sheet
          child: ListView.builder(
            itemCount: leagueNames.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: selectedLeague == leagueNames[index] ? Colors.black12 : Colors.white,
                child: ListTile(
                  title: Row(
                    children: [
                      Images().getLeagueLogo(leagueNames[index]),
                      const SizedBox(width: 16),
                      Text(leagueNames[index]),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context, leagueNames[index]);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<String?> _showContinentSelectionBottomSheet(BuildContext context) {

    List continents = Continents().listContinents();

    return showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 600, // Set the desired height of the bottom sheet
          child: ListView.builder(
            itemCount: continents.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: selectedContinent == continents[index] ? Colors.black12 : Colors.white,
                child: ListTile(
                  title: Row(
                    children: [
                      Images().getContinentLogo(continents[index]),
                      const SizedBox(width: 16),
                      Text(continents[index]),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context, continents[index]);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

}
