import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:flutter/material.dart';

Widget wListViewChampions(BuildContext context, String leagueInternational, Map mapClassifications) {
  List mapKeys = [];
  mapClassifications.forEach((key, value) {
    mapKeys.add(key);
  });
  return
    Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                //ANO
                for(double key in mapClassifications.keys)
                  Container(
                    height: 30,
                    width: 97,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Center(child: Text(key.toStringAsFixed(0),
                        style: EstiloTextoBranco.negrito18)),
                  ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    for(double key in mapClassifications.keys)
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for(var position in mapClassifications[key])
                              positionListClub(context, mapClassifications[key],
                                  mapClassifications[key].indexOf(position))
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
}

Widget positionListClub(BuildContext context, List list, int position){
  String clubName = list[position];
  String nationality = ClubDetails().getCountry(list[position]);
  return GestureDetector(
    onTap: (){

      clickClub(context: context,clubName: clubName);
    },
    child: Container(
      width: 85,
      margin: (position+1 == 2 || position+1 == 4 || position+1 == 8 || position+1 == 16)
          ? const EdgeInsets.only(bottom:16) : EdgeInsets.zero,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width:30, child: Text('${(position+1).toString()}º ',style: EstiloTextoBranco.text16)),
              const SizedBox(width: 4),
              funcFlagsList(nationality, 12, 15),
              Images().getEscudoWidget(clubName,25,25),
              const SizedBox(width: 8),
              //Text(list[position],style: EstiloTextoBranco.text16),
            ],
          ),
          Text(clubName,style: EstiloTextoBranco.text8),
        ],
      ),
    ),
  );
}
