import 'package:fifa/global_variables.dart';

class Negotiation{
  String done = "Done";
  String negotiating = "Negotiating";
  String cancelled = "Cancelled";

  String keyWeek = "Semana";
  String keyPrice = "Price";
  String keySalary = "Salary";
  String keyDuration = "Duration";
  String keyStatus = "Status";

  List getPlayers(){
    print(globalNegotiation);
    return globalNegotiation.keys.toList();
  }

  getStatus(int playerID){
    return globalNegotiation[playerID][keyStatus];
  }


}