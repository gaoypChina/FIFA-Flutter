import 'package:fifa/classes/image_class.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

class ClubProfileNonPlayable extends StatefulWidget {
  final String clubName;
  const ClubProfileNonPlayable({Key? key, required this.clubName}) : super(key: key);

  @override
  State<ClubProfileNonPlayable> createState() => _ClubProfileNonPlayableState();
}

class _ClubProfileNonPlayableState extends State<ClubProfileNonPlayable> {

  ///////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Column(
            children: [
              funcFlagsList(getCountryFromLeague(widget.clubName), 20, 30),
              Images().getEscudoWidget(widget.clubName),
              Text(widget.clubName,style: EstiloTextoBranco.text16),
            ],
          ),
        ],
      )
    );
  }

}
