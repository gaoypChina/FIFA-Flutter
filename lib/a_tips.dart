/*
PARA ADICIONAR NOVOS TIMES:

->values->club_names : String do time
->values->clubsAllNameList : ID do time
->values->images : Imagem do Time
->values->League_clubs : Liga que o clube joga

PARA ADICIONAR NOVAS LIGAS:

->values->League_names : Nome e ID da liga
->Pages->Simulation-> : Setar o dinheiro que o clube ganha jogando naquela liga
->values->getTrophyImage : Troféu do torneio
->values->League_clubs : Clubes dentro da liga
->values->images : Logo da liga
->class League-> Definir se é um campeonato que tem campeonato internacional
->func rebaixamento
 */

/*

//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }
  doThisOnLaunch() {
    getMyInfoFromSharedPreference();
    setState(() {
    });
  }
//##########################################################################
//CODE INFOS
//##########################################################################
for(int i=0; i<x; i++){}

//SHORTCUT
Ctrl+Shift+O = Automatically remove unused imports

//POPUP WHEN ENTER PAGE
schedulerBinding.instance!.addPostFrameCallback((_) {
      popupCall();
});

//REVERSE MAP
var name = map.keys.firstWhere((k) => map[k] == index, orElse: () => null);

//IMAGE FULL SIZE
FittedBox(child: Image.asset('assets/image.png'),
            fit: BoxFit.fill,height: double.infinity,width: double.infinity,alignment: Alignment.center,),
FittedBox(child: Image.asset('assets/wallpaper.png',height: double.infinity,width: double.infinity),fit: BoxFit.fill),

//CHANGE Page
Navigator.push(context,MaterialPageRoute(builder: (context) => const Show_All_Chats()));
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ResetPassword()));
Navigator.of(context).popUntil((route) => route.isFirst);
Navigator.of(context).pushAndRemoveUntil(
                   MaterialPageRoute(builder: (c) => DesiredPage()),
                   (route) => false)

CircleAvatar(backgroundImage: NetworkImage(myProfilePic),radius: 50.0)

child: Container(
decoration: BoxDecoration(
color: AppTheme.colors.primaryColor2,
border: Border.all(
width: 2.0,
color: AppTheme.colors.primaryColor3,
),
borderRadius: BorderRadius.all(Radius.circular(25.0)),
),

//Sort Map
//Ordem descrecente
eventsDateOrder.sort((b, a) => a.compareTo(b));
//OU...
https://stackoverflow.com/questions/18244545/dart-how-to-sort-maps-keys
SplayTreeMap

//Circular Border in Image
ClipRRect()

//Android or iOS
if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

//resizeToAvoidBottomInset: false, // impede bottom overflow irritante

//ROUND DECIMALS
variable.toStringAsFixed(2);

//LOADING WIDGET
CircularProgressIndicator()

//LISTVIEW INSIDE COLUMN ERROR SIZE
shrinkWrap: true,

//HEIGHT
_height = MediaQuery.of(context).size.height;

//TECLADO
bottomSize = MediaQuery.of(context).viewInsets.bottom; //=0 SEM O TECLADO +-160 com o teclado

//TEXT ROW OVERFLOW -> WRAP
//https://www.youtube.com/watch?v=3VvxU4EL51M
//Opção com 43 pontos Row-> Expanded->Column
//https://stackoverflow.com/questions/54634093/flutter-wrap-text-instead-of-overflow

//BORDER CIRCULAR
borderRadius: BorderRadius.all(Radius.circular(40.0)),

//LIST INSIDE A COLUMN add:
shrinkWrap: true,

/////////////////////////////////
 */
import 'package:fifa/values/club_names.dart';
import 'package:fifa/values/league_names.dart';


ClubName _name = ClubName();
ClubName n = ClubName();
LeagueOfficialNames leagueName = LeagueOfficialNames();
Map<String,dynamic> zzzzzzzzz = {

  leagueName.cazaquistao : {
    2022.0: [],
    2021.0: [],
    2020.0: [],
    2019.0: [],
    2018.0: [],
    2017.0: [],
    2016.0: [],
    2015.0: [],
    2014.0: [],
    2013.0: [],
    2012.0: [],
    2011.0: [],
    2010.0: [],
    2009.0: [],
    2008.0: [],
    2007.0: [],
    2006.0: [],
    2005.0: [],
    2004.0: [],
    2003.0: [],
    2002.0: [],
    2001.0: [],
    2000.0: [],
    1999.0: [],
    1998.0: [],
    1997.0: [],
    1996.0: [],
    1995.0: [],
    1994.0: [],
    1993.0: [],
    1992.0: [],
    1991.0: [],
    1990.0: [],
    1989.0: [],
    1988.0: [],
    1987.0: [],
    1986.0: [],
    1985.0: [],
    1984.0: [],
    1983.0: [],
    1982.0: [],
    1981.0: [],
    1980.0: [],
    1979.0: [],
    1978.0: [],
    1977.0: [],
    1976.0: [],
    1975.0: [],
    1974.0: [],
    1973.0: [],
    1972.0: [],
    1971.0: [],
    1970.0: [],
    1969.0: [],
    1968.0: [],
    1967.0: [],
    1966.0: [],
    1965.0: [],
    1964.0: [],
    1963.0: [],
    1962.0: [],
    1961.0: [],
    1960.0: [],
    1959.0: [],
    1958.0: [],
    1957.0: [],
    1956.0: [],
    1955.0: [],
    1954.0: [],
    1953.0: [],
    1952.0: [],
    1951.0: [],
    1950.0: [],
    1949.0: [],
    1948.0: [],
    1947.0: [],
    1946.0: [],

    1939.0: [],
    1938.0: [],
    1937.0: [],
    1936.0: [],
    1935.0: [],
    1934.0: [],
    1933.0: [],
    1932.0: [],
    1931.0: [],
    1930.0: [],
    1929.0: [],
    1928.0: [],
    1927.0: [_name.palermo,],
  },
  //RSSSF.ORG
  leagueName.amapa : {
    2022.0: [n.trem,n.independenteAP,n.santosAP,n.santanaAP,],
    2021.0: [n.trem,n.santosAP,n.saopauloAP,n.independenteAP,],
    2020.0: [n.ypirangaAP,n.santanaAP,n.santosAP,n.saopauloAP,],
    2019.0: [n.santosAP,n.ypirangaAP,n.trem,n.saopauloAP,],
    2018.0: [n.ypirangaAP,n.santosAP,n.trem,n.macapa,],
    2017.0: [n.santosAP,n.macapa,n.independenteAP,n.ypirangaAP,],
    2016.0: [n.santosAP,n.trem,n.saopauloAP,n.macapa,],
    2015.0: [n.santosAP,n.trem,n.ypirangaAP,n.independenteAP,],
    2014.0: [n.santosAP,n.saopauloAP,n.macapa,n.santanaAP,],
    2013.0: [n.santosAP,n.macapa,n.trem,n.ypirangaAP,],
    2012.0: [n.oratorio,n.ypirangaAP,n.santosAP,n.santanaAP,],
    2011.0: [n.trem,n.santosAP,n.oratorio,n.mazagao,],
    2010.0: [n.trem,n.santanaAP,n.saopauloAP,n.santosAP,],
    2009.0: [n.saojoseAP,n.santanaAP,n.mazagao,n.saopauloAP,],
    2008.0: [n.cristalAP,n.saojoseAP,n.trem,n.mazagao,],
    2007.0: [n.trem,n.cristalAP,n.saojoseAP,n.amapa,],
    2006.0: [n.saojoseAP,n.amapa,n.trem,n.cristalAP,],
    2005.0: [n.saojoseAP,n.amapa,n.ypirangaAP,n.trem,],
    2004.0: [n.ypirangaAP,n.saojoseAP,n.trem,n.amapa,],
    2003.0: [n.ypirangaAP,n.independenteAP,n.saopauloAP,n.cristalAP,],
    2002.0: [n.ypirangaAP,n.independenteAP,n.mazagao,n.saojoseAP,],
    2001.0: [n.independenteAP,n.saojoseAP,n.ypirangaAP,n.mazagao],
    2000.0: [n.santosAP,n.mazagao,],
    1999.0: [n.ypirangaAP,n.aliancaAP,n.santosAP,n.independenteAP,],
    1998.0: [n.aliancaAP,n.amapa,n.ypirangaAP,n.independenteAP,],
    1997.0: [n.ypirangaAP,n.saojoseAP,n.cristalAP,n.oratorio,],
    1996.0: [],
    1995.0: [n.independenteAP,n.cristalAP,n.macapa,n.oratorio,],
    1994.0: [n.ypirangaAP,n.macapa,n.saojoseAP,n.trem,],
    1993.0: [n.saojoseAP,n.amapa,n.independenteAP,n.ypirangaAP,],
    1992.0: [n.ypirangaAP,n.trem,n.independenteAP,n.amapa,],
    1991.0: [n.macapa,n.amapa,n.ypirangaAP,n.independenteAP,],
    //ERA AMADORA
    1990.0: [n.amapa,],
    1989.0: [n.independenteAP,n.amapa,],
    1988.0: [n.amapa,n.independenteAP,],
    1987.0: [n.amapa,n.trem,],
    1986.0: [n.macapa,n.trem,],
    1985.0: [n.santanaAP,n.trem,],
    1984.0: [n.trem,],
    1983.0: [n.independenteAP,],
    1982.0: [n.independenteAP,n.amapa,],
    1981.0: [n.macapa,n.independenteAP,],
    1980.0: [n.macapa,],
    1979.0: [n.amapa,n.trem,],
    1978.0: [n.macapa,],
    1977.0: [n.guaranyAP,],
    1976.0: [n.ypirangaAP,n.santanaAP,],
    1975.0: [n.amapa,n.macapa,],
    1974.0: [n.macapa,n.guaranyAP,],
    1973.0: [n.amapa,n.macapa,],
    1972.0: [n.santanaAP,n.saojoseAP,],
    1971.0: [n.saojoseAP,n.macapa,],
    1970.0: [n.saojoseAP,],
    1969.0: [n.macapa,n.ypirangaAP,],
    1968.0: [n.santanaAP,],
    1967.0: [n.juventusAP,],
    1966.0: [n.juventusAP,],
    1965.0: [n.santanaAP,],
    1964.0: [n.juventusAP,],
    1963.0: [n.cea,n.amapa,],
    1962.0: [n.santanaAP,],
    1961.0: [n.santanaAP,],
    1960.0: [n.santanaAP,],
    1959.0: [n.macapa,],
    1958.0: [n.macapa,],
    1957.0: [n.macapa,],
    1956.0: [n.macapa,],
    1955.0: [n.macapa,],
    1954.0: [n.macapa,],
    1953.0: [n.amapa,],
    1952.0: [n.trem,],
    1951.0: [n.amapa,],
    1950.0: [n.amapa,],
  },


leagueName.cazaquistao : {
  2022.0: [],
  2021.0: [],
  2020.0: [],
  2019.0: [],
  2018.0: [],
  2017.0: [],
  2016.0: [],
  2015.0: [],
  2014.0: [],
  2013.0: [],
  2012.0: [],
  2011.0: [],
  2010.0: [],
  2009.0: [],
  2008.0: [],
  2007.0: [],
  2006.0: [],
  2005.0: [],
  2004.0: [],
  2003.0: [],
  2002.0: [],
  2001.0: [],
  2000.0: [],
},

};