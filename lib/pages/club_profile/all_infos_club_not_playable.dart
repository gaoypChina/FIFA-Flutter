import 'package:fifa/classes/image_class.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class ClubProfileNotPlayable extends StatefulWidget {
  final String clubName;
  const ClubProfileNotPlayable({Key? key,required this.clubName}) : super(key: key);

  @override
  State<ClubProfileNotPlayable> createState() => _ClubProfileNotPlayableState();
}

class _ClubProfileNotPlayableState extends State<ClubProfileNotPlayable> {

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
              backButtonText(context, widget.clubName),

              Images().getEscudoWidget(widget.clubName),
              Images().getUniformWidget(widget.clubName,150,150),
              Images().getStadiumWidget(widget.clubName,150,150),
              Text(ClubDetails().getStadium(widget.clubName),style: EstiloTextoBranco.text16),
              Text(ClubDetails().getStadiumCapacityPointFormat(widget.clubName),style: EstiloTextoBranco.text16),
              const Text('Rivais:',style: EstiloTextoBranco.text16),
              Text(ClubDetails().getRivals(widget.clubName).toString(),style: EstiloTextoBranco.text16),
              Text(ClubDetails().getFoundationYear(widget.clubName).toString(),style: EstiloTextoBranco.text16),
              Text(ClubDetails().getCountry(widget.clubName),style: EstiloTextoBranco.text16),
              funcFlagsList(ClubDetails().getCountry(widget.clubName), 30, 50),

            ],
          ),
        ],
      ),
    );
  }
}
