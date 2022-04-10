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