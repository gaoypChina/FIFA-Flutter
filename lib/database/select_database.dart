import 'package:fifa/database/csv/read_csv.dart';
import 'package:fifa/database/local_database/shared_preferences.dart';
import 'package:fifa/database/sql.dart';
import 'package:fifa/global_variables.dart';

import '../theme/custom_toast.dart';

class SelectDatabase{

  Future load() async{
    globalSaveNumber = (await SharedPreferenceHelper().getsharedSaveNumber())!;
    if(globalSaveNumber == 0){
      await ReadCSV().openCSV();
    }else{
      await SaveSQL().getAllPlayerFromDatabase();
      customToast('done');
    }
  }

}