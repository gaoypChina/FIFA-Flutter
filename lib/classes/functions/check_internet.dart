import 'dart:io';

Future<bool> funcCheckInternet() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      //Conectado
    }
  } on SocketException catch (_) {
    //SEM INTERNET
    return false;
  }
  return true;
}