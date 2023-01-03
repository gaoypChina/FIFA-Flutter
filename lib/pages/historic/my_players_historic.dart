import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/historic.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/popup/popup_player_info.dart';
import 'package:fifa/theme/decoration/black_decoration.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:fifa/widgets/best_player_box/best_player_box.dart';
import 'package:flutter/material.dart';

class MyPlayersHistoric extends StatefulWidget {
  const MyPlayersHistoric({Key? key}) : super(key: key);

  @override
  State<MyPlayersHistoric> createState() => _MyPlayersHistoricState();
}

class _MyPlayersHistoricState extends State<MyPlayersHistoric> {

  late Club club;
  bool isActualYear = false;
  List<String> possibleYears = [];
  String selectedYearStr = anoInicial.toString();
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    initialSelectedYear();
    super.initState();
  }
  initialSelectedYear(){
    if(ano<=anoInicial){
      selectedYearStr = (anoInicial).toString();
    }
    club = Club(index: My().clubID);
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    possibleYears = [];
    for(int year=anoInicial;year<=ano;year++){
      possibleYears.add(year.toString());
    }
    if(int.parse(selectedYearStr)==ano){
      isActualYear = true;
    }
    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),
          Column(
            children: [
              backButtonText(context,'Histórico dos meus times'),

              header(),

              bestPlayers(),

              listPlayersWidget(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sellORbuyPlayers('Comprados','Buy',int.parse(selectedYearStr)),
                  sellORbuyPlayers('Vendidos','Sell',int.parse(selectedYearStr)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget header(){
    late HistoricClubYear myClubData;
    if(!isActualYear){
      myClubData = HistoricClubYear(int.parse(selectedYearStr));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        dropDownButton(),
        Row(
          children: [
            Images().getEscudoWidget(club.name,50,50),
            Images().getUniformWidget(club.name,50,50),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(4),
          decoration: blackDecoration(),
          child: Row(
            children: [
              Column(
                children: [
                  Image.asset(FIFAImages().campeonatoLogo(club.leagueName),width: 50,height: 50),
                  isActualYear
                      ? Text(Classification(leagueIndex: My().campeonatoID).getClubPosition(My().clubID).toString()+'º',style: EstiloTextoBranco.text16)
                      : Text(myClubData.leaguePosition.toString()+"º",style: EstiloTextoBranco.text16),
               ],
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  Image.asset(FIFAImages().campeonatoLogo(club.internationalLeagueName),width: 50,height: 50),
                  isActualYear
                      ? const Text('Oitavas',style: EstiloTextoBranco.text16)
                      : Text(myClubData.internationalLeaguePosition,style: EstiloTextoBranco.text16),
                ],
              ),
            ],
          ),
        ),
      ],
    );
}

  Widget dropDownButton(){
    return                   Container(
      decoration: BoxDecoration(
        color:Colors.white, //background color of dropdown button
        border: Border.all(color: Colors.black38, width:2), //border of dropdown button
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 4),
        child: DropdownButton<String>(
          value: selectedYearStr,
          style: const TextStyle(fontSize: 18, color: Colors.white),
          iconEnabledColor: Colors.black, //Icon color
          underline: Container(), //empty line
          dropdownColor: Colors.white,
          items: possibleYears.map((value) {
            return DropdownMenuItem(
              child: Text(value,style: EstiloTextoPreto.text16),
              value: value,
            );
          }).toList(),
          onChanged: (value) {
            setState(() {});
            selectedYearStr = value.toString();
          },
        ),
      ),
    );
  }
  Widget bestPlayers(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          bestPlayerBox('Craque',Jogador(index: 151),''),
          bestPlayerBox('Artilheiro',Jogador(index: 171),''),
          bestPlayerBox('Assistente',Jogador(index: 191),''),
          bestPlayerBox('MVP',Jogador(index: 131),''),
        ],
      ),
    );
  }

  Widget listPlayersWidget(){
    List jogadores = Club(index: My().clubID).jogadores;
    if(!isActualYear){
      jogadores = [];
    }
    return Column(
      children: [
        const Text('Lista de Jogadores',style: EstiloTextoBranco.negrito18),
        SizedBox(
          height: 180,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int playerID in jogadores)
                  oldPlayerRow(Jogador(index: playerID))
              ],
            ),
          ),
        ),

      ],
    );
  }

  Widget oldPlayerRow(Jogador jogador){
    return Row(
      children: [
        Images().getPlayerPictureWidget(jogador,20,20),
        SizedBox(width:150,child: Text(jogador.name,style: EstiloTextoBranco.text16)),
        const SizedBox(width: 4),
        Text(jogador.matchsCarrer.toString(),style: EstiloTextoBranco.text16),
        const SizedBox(width: 4),
        Text(jogador.goalsCarrer.toString(),style: EstiloTextoBranco.text16),
        const SizedBox(width: 4),
        Text(jogador.assistsCarrer.toString(),style: EstiloTextoBranco.text16),
      ],
    );
  }
Widget sellORbuyPlayers(String title, String buyOrSellStr, int selectedYear){
  try{
    if(globalHistoricMyTransfersID[buyOrSellStr]![selectedYear]!.isNotEmpty) {
    }
    return Column(
      children: [
        Text(title,style: EstiloTextoBranco.negrito18),
        for(int i=0;i<globalHistoricMyTransfersID[buyOrSellStr]![selectedYear]!.length;i++)
          GestureDetector(
            onTap: (){
              popUpOkShowPlayerInfos(
                  context: context,
                  playerID: Jogador(index: globalHistoricMyTransfersID[buyOrSellStr]![selectedYear]![i]).index,
                  funcSetState: (){}
              );
            },
            child: Row(
              children: [
                Images().getEscudoWidget(Club(index: globalHistoricMyTransfersClubID[buyOrSellStr]![selectedYear]![i]).name,20,20),
                Text(Jogador(index: globalHistoricMyTransfersID[buyOrSellStr]![selectedYear]![i]).name,
                    style: EstiloTextoBranco.text16),
                Text(' - \$'+globalHistoricMyTransfersValue[buyOrSellStr]![selectedYear]![i].toStringAsFixed(2),
                    style: EstiloTextoBranco.text16),
              ],
            ),
          ),


      ],
    );
  }catch(e){
    return Container();
  }
}

}
