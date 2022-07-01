import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
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
  List<String> possibleYears = [];
  String selectedYear = anoInicial.toString();
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
      selectedYear = (anoInicial-1).toString();
    }
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    possibleYears = [];
    for(int year=anoInicial;year<ano;year++){
      possibleYears.add(year.toString());
    }
    club = Club(index: My().clubID);
    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),
          Column(
            children: [
              backButtonText(context,'Histórico dos meus times'),

              header(),

              bestPlayers(),
              field(),

              Row(
                children: [
                  soldPlayers(),
                  boughtPlayers(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        dropDownButton(),
        Row(
          children: [
            Image.asset(Images().getEscudo(club.name),width: 50,height: 50),
            Image.asset(Images().getUniform(club.name),width: 50,height: 50),
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
                  const Text('6º',style: EstiloTextoBranco.text16),
                ],
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  Image.asset(FIFAImages().campeonatoInternacionalLogo(club.internationalLeagueName),width: 50,height: 50),
                  const Text('Oitavas',style: EstiloTextoBranco.text16),
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
          value: selectedYear,
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
            selectedYear = value.toString();
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
          bestPlayerBox('Craque',Jogador(index: 151)),
          bestPlayerBox('Artilheiro',Jogador(index: 171)),
          bestPlayerBox('Assistente',Jogador(index: 191)),
          bestPlayerBox('MVP',Jogador(index: 131)),
        ],
      ),
    );
  }

  Widget field(){
    return Column(
      children: const [

        Text('Lista de Jogadores',style: EstiloTextoBranco.text14),
      ],
    );
  }
Widget soldPlayers(){
    return Column(
      children: const [

        Text('Vendidos',style: EstiloTextoBranco.text14),
      ],
    );
}
  Widget boughtPlayers(){
    return Column(
      children: const [
        Text('Comprados',style: EstiloTextoBranco.text14),

      ],
    );
  }

}
