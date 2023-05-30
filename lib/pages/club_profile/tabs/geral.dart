import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClubGeralInfosPage extends StatefulWidget {
  final Club club;
  const ClubGeralInfosPage({Key? key,required this.club}) : super(key: key);

  @override
  State<ClubGeralInfosPage> createState() => _ClubGeralInfosPageState();
}

class _ClubGeralInfosPageState extends State<ClubGeralInfosPage> {

  ///////////////////////////////////////////////////////////////////////////
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Text('Fundado: '+widget.club.foundationYear.toString(),style: EstiloTextoBranco.negrito18),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Images().getStadiumWidget(widget.club.name,130,240),
                          Padding(
                            padding: const EdgeInsets.only(top:100),
                            child: Container(
                              width: 240,
                              color: AppColors().greyTransparent,
                              padding: const EdgeInsets.all(4),
                              child: Text(widget.club.stadiumName+': '+widget.club.stadiumSize.toString(),style: EstiloTextoBranco.text16),
                            ),
                          )
                        ],
                      ),
                      Images().getUniformWidget(widget.club.name,130,130),
                    ],
                  ),
                  const SizedBox(height: 8),

                  mapWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

  Widget mapWidget(){
    return SizedBox(
      height: 300,
      child: GoogleMap(
        mapType: MapType.satellite,
        tiltGesturesEnabled: false,
        indoorViewEnabled: false,
        rotateGesturesEnabled: false,
        compassEnabled: false,

        initialCameraPosition: CameraPosition(
          target: LatLng(
                ClubDetails().getCoordinate(widget.club.name).latitude,
                ClubDetails().getCoordinate(widget.club.name).longitude
          ),
          zoom: 16.4,
        ),
        //onMapCreated: getClubsLocation,
      ),
    );
  }
}
