import 'package:fifa/classes/club.dart';
import 'package:fifa/pages/club_profile/all_infos_club_not_playable.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:flutter/material.dart';

clickClub({required BuildContext context, required String clubName}){
  //if(clubsAllNameList.contains(clubName)){
  //  int clubID = clubsAllNameList.indexOf(clubName);
  //  Navigator.push(context, MaterialPageRoute(builder: (context) => ClubProfile(clubID: clubID)));
  //}else{
  Navigator.push(context, MaterialPageRoute(builder: (context) => ClubProfileNotPlayable(clubName: clubName)));
  //}
}

clickClubProfilePage(BuildContext context, Club clubClass){
  Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: clubClass.index)));
}

navigatorPush(BuildContext context, Widget widget){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}

navigatorReplace(BuildContext context, Widget widget){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => widget));
}