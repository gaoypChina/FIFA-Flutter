import 'package:fifa/values/club_details.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController{

  late final List<BitmapDescriptor> _markersIcons = [];
  final List<Coordinates> coordinates = [];
  List<Marker> _markersAllClubsList = <Marker>[];
  List<Marker> _markersShow = <Marker>[];
  late GoogleMapController controller;


}
