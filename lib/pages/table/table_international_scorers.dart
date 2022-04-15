import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/functions/order_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/table/widget_bottom.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

import '../../classes/my.dart';

class TableInternationalScorers extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final String leagueInternational;
  const TableInternationalScorers({Key? key, required this.leagueInternational}) : super(key: key);
  @override
  _TableInternationalScorersState createState() => _TableInternationalScorersState();
}

class _TableInternationalScorersState extends State<TableInternationalScorers> {

  String leagueInternational = '';
  int rodadaShow = semanasGruposInternacionais.contains(semana)
      ? semanasGruposInternacionais.indexOf(semana)+1
      : semana > semanasGruposInternacionais.last
      ? 6 : 1;
  List<int> topScorersID = [];
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    leagueInternational = widget.leagueInternational;
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:  Stack(
          children: [

            backgroundInternationalLeague(leagueInternational),

            Column(
                children: [
                  const SizedBox(height: 30),

                  //TABELA
                  Expanded(
                    child: Container(
                        color: AppColors().greyTransparent,
                        height: Sized(context).height*0.9,
                        width: Sized(context).width*0.92,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(width:260,alignment:Alignment.center,
                                    child: const Text('Artilheiros',style: EstiloTextoBranco.text16)),
                                const Text('J   G    A',style: EstiloTextoBranco.text16),

                              ],
                            ),
                            Expanded(
                                child: SingleChildScrollView(
                                    child: tableWidget()
                                )
                            ),
                          ],
                        )
                    ),
                  ),

                  customWidgetBottomBar(
                      context,
                      WidgetBottomInternational().artilheiros,
                      leagueInternational,
                          (value){
                        setState(() {});
                        leagueInternational=value;
                      }
                  ),

                ]),

          ]),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget backgroundInternationalLeague(String leagueInternational){
    return leagueInternational == LeagueOfficialNames().championsLeague
        ? Image.asset('assets/icons/fundochampions.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill)
        : Image.asset('assets/icons/fundolibertadores.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill);
  }

  Widget tableWidget() {
    listOfTopScorers();
    return Column(
      children: [
        for(int i=0;i<topScorersID.length;i++)
          scorerRowWidget(i)
      ],
    );
  }
  Widget scorerRowWidget(int i) {
    int playerID = topScorersID[i];
    Jogador player = Jogador(index: playerID);
    return Row(
      children: [
          i+1<10
              ? Text('  ${(i+1).toString()}- ',style: EstiloTextoBranco.text16)
              : Text('${(i+1).toString()}- ',style: EstiloTextoBranco.text16),
          Image.asset('assets/clubs/${FIFAImages().imageLogo(player.clubName)}.png',height: 25,width:25),
          const SizedBox(width: 6),
          Container(
              width:200,
              color: player.clubID == My().clubID ? Colors.teal : Colors.transparent,
              child: Text(player.name,style: EstiloTextoBranco.text16)),
          SizedBox(width:20,child: Text(player.matchsInternational.toString(),style: EstiloTextoBranco.text16)),
          const SizedBox(width: 6),
          SizedBox(width:20,child: Text(player.goalsInternational.toString(),style: EstiloTextoBranco.text16)),
          const SizedBox(width: 6),
          SizedBox(width:20,child: Text(player.assistsInternational.toString(),style: EstiloTextoBranco.text16)),
      ],
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
  listOfTopScorers(){
    topScorersID = [];
    List<int> topScorersGoals = [];
    for(int index=0; index<globalJogadoresIndex.length; index++){
      if (globalJogadoresInternationalGoals[index]>0) {
        int clubID = Jogador(index: index).clubID;
        if(Club(index: clubID).internationalLeagueName == leagueInternational){
          topScorersID.add(index);
          topScorersGoals.add(globalJogadoresInternationalGoals[index]);
        }
      }
    }
    //ARTILHEIROS/lista EM ORDEM
    topScorersID = Order().listDecrescente(listA: topScorersGoals, listB: topScorersID, length: topScorersID.length)[1];
  }

}