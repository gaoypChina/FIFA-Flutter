import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';

import 'package:fifa/global/global_variables.dart';
import 'package:fifa/global/globalfunctions.dart';
import 'package:fifa/theme/button_style.dart';
import 'package:fifa/theme/textstyle.dart';

import 'package:flutter/material.dart';
import '../c_menu.dart';
import '../global/images.dart';
import 'club_profile.dart';

class Calendar extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Calendar({Key? key}) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  int nClubs = (League(index: globalMyLeagueID).nClubs)-1;
  My myTeamClass = My();
  
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    //_height = MediaQuery.of(context).size.height;
    String rodadaStr = '';
    if(GlobalFunctions().isJogoCampeonatoNacional()){
      rodadaStr = rodada.toString();
    }
    return WillPopScope(//IF GO BACK TO PREVIOUS PAGE
      onWillPop: () async{
        return true;
      },
      child: Scaffold(

          resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
          body:  Stack(
              children: [

                Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

                Column(
                  children: [

                    const SizedBox(height: 40),
                    Text('Calendário - Rodada ' + rodadaStr,style: EstiloTextoBranco.text30),
                    const SizedBox(height: 10),

                    Container(
                      margin: const EdgeInsets.all(8),
                      height: 640,
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 5,runSpacing: 5,
                          children: [
                            for(int i=1; i<=nClubs; i++)
                              adversario(i)
                          ],
                        ),
                      ),
                    ),

                    //VOLTAR
                    customButtonContinue(
                        title: 'VOLTAR',
                        function: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Menu()));
                        }
                    ),

                  ],
                )

              ]
          )
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget adversario(int rodadaLocal){

    /*
    Ex:
    Brasileirão [Palmeiras, Santos, SP, Fla] e Palmeiras(eu) x SP
    Chave1=1; Chave2=3; Chave3=2; Chave4=4
    Se eu sou chave1, entao adversario = chave2.
    Se eu sou chave2, entao adversario = chave1.
     */
    List list = GlobalFunctions().chaveIndexAdvCampeonato(rodadaLocal,myTeamClass.campeonatoID, myTeamClass.posicaoChave);//index 0-16
    int indexAdv = list[0];
    bool visitante = list[1];
    String clubName = League(index: myTeamClass.campeonatoID).getClubName(indexAdv);
    int clubID = GlobalFunctions().getClubIndexFromName(clubName);
    int result = -1;
    //RODADAS FUTURAS
    if(rodadaLocal>=rodada){
      result = -1;
    }else{
      //rodadaLocal começa em 1 por isso subtrai 1
      result = globalMyLeagueLastResults.isNotEmpty ? globalMyLeagueLastResults[rodadaLocal-1] : -1;
    }

    return GestureDetector(
      onTap:(){
        Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: clubID )));
      },
      child: Container(
        width: 120,
        height: 117,
        color: result==0 ? Colors.red : result == 1 ? Colors.amber.withOpacity(0.7) : result == 3  ? Colors.green : Colors.black12,
        child: Column(
          children: [
            Text('Rodada '+(rodadaLocal).toString(),style: EstiloTextoBranco.text16),
            Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName)}.png',height: 45,width: 45),
            visitante ? const Text('FORA',style: EstiloTextoBranco.text10,textAlign: TextAlign.center) : const Text('CASA',style: EstiloTextoBranco.text10,textAlign: TextAlign.center),
            Text(clubName,overflow: TextOverflow.fade,style: EstiloTextoBranco.text16,textAlign: TextAlign.center),
            const Spacer(),
            ]),
      ),
    );
}

}