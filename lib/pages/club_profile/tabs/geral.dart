import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/size.dart';
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

                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Sized(context).width*0.6,
                        child: Stack(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: widget.club.colors.primaryColor, width: 2),
                                ),
                                child: Images().getStadiumWidget(widget.club.name,150, Sized(context).width*0.6)),
                            Padding(
                                padding: const EdgeInsets.only(top:105),
                                child: Container(
                                  width: Sized(context).width*0.6,
                                  color: AppColors().greyTransparent,
                                  padding: const EdgeInsets.all(4),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.club.stadiumName,style: EstiloTextoBranco.text14),
                                      Text(widget.club.stadiumSize.toString(),style: EstiloTextoBranco.negrito18),
                                    ],
                                  ),
                                ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: widget.club.colors.secondColor, width: 2),
                            color: AppColors().greyTransparent,
                          ),
                          child: Column(
                            children: [
                              Images().getUniformWidget(widget.club.name,130, Sized(context).width*0.3),
                              Text('Fundado: '+widget.club.foundationYear.toString(),style: EstiloTextoBranco.negrito16),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: widget.club.colors.primaryColor, width: 2),
                    ),
                      child: mapWidget()),
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
        mapType: MapType.hybrid,
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
