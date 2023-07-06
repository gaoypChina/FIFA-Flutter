
import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/my.dart';

String getMyEmoji(My myClass){

  List classificationList = Classification(leagueIndex: myClass.leagueID).classificationClubsIndexes;
  int myPosition = classificationList.indexOf(myClass.clubID)+1;
  int expectation = myClass.getLastYearExpectativa();
  int emojiNumber = transformPositionEmoji(expectation, myPosition);

  return getEmoji(emojiNumber);
}

int transformPositionEmoji(int expectation, int position){

  if(position < expectation-3 || position == 1){
    return 2;
  }
  if(position < expectation){
    return 1;
  }
  if(position == expectation){
    return 0;
  }
  if(position > expectation+3){
    return -2;
  }
  if(position > expectation){
    return -1;
  }
  return 0;
}

String getEmoji(int emotion){
  if (emotion == -2){
    return '😠';
  }
  else if (emotion == -1){
    return '😔';
  }
  else if (emotion == 0){
    return '😐';
  }
  else if (emotion == 1){
    return '😊';
  }
  else if (emotion == 2){
    return '😃';
  }
  return "";
}