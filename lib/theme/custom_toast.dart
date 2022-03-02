import 'package:fluttertoast/fluttertoast.dart';

customToast(String message){
  Fluttertoast.showToast(msg: message,toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIosWeb: 1);
}