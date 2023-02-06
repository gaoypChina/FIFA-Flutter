import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/club_profile/all_infos_club_not_playable.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/historic_champions/historic_champions.dart';
import 'package:flutter/material.dart';

Widget wInternationalHistoricColumn(BuildContext context, String leagueInternational, int year) {
  Map map = mapChampions(leagueInternational);
  List list = map[year.toDouble()];
  return Expanded(
    child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (c, i) {
        String nationality = ClubDetails().getCountry(list[i]);
        int position = i + 1;
        return GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfileNotPlayable(clubName: list[i])));
          },
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            margin: (position == 2 || position == 4 || position == 8 ||
                position == 16)
                ? const EdgeInsets.only(bottom: 16) : EdgeInsets.zero,
            child: Row(
              children: [
                SizedBox(width: 30,
                    child: Text('${(i + 1).toString()}º ',
                        style: EstiloTextoBranco.text16)),
                const SizedBox(width: 4),
                funcFlagsList(nationality, 15, 25),
                const SizedBox(width: 8),
                Images().getEscudoWidget(list[i], 30, 30),
                const SizedBox(width: 8),
                Text(list[i], style: EstiloTextoBranco.text16),
              ],
            ),
          ),
        );
      },
    ),
  );
}