import 'package:fifa/theme/custom_toast.dart';
import 'package:url_launcher/url_launcher.dart';

Future funcOpenLink(Uri url) async {
  //ABRE A PÁGINA NA INTERNET
  try{
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }catch(e){
    customToast('erro');
  }

}