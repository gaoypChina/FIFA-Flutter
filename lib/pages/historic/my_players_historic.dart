import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/decoration/black_decoration.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class MyPlayersHistoric extends StatefulWidget {
  const MyPlayersHistoric({Key? key}) : super(key: key);

  @override
  State<MyPlayersHistoric> createState() => _MyPlayersHistoricState();
}

class _MyPlayersHistoricState extends State<MyPlayersHistoric> {

  late Club club;
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
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
      children: [
        yearSelection(),
        Image.asset(Images().getEscudo(club.name),width: 50,height: 50),
        Image.asset(Images().getUniform(club.name),width: 50,height: 50),
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(4),
          decoration: blackDecoration(),
          child: Row(
            children: [
              Column(
                children: [
                  Image.asset(FIFAImages().campeonatoLogo(club.leagueID),width: 50,height: 50),
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

Widget yearSelection(){
    return InkWell(
      onTap: (){

      },
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(4),
        decoration: blackDecoration(),
        child: const Text('2021',style: EstiloTextoBranco.text22),
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
  Widget bestPlayerBox(String atribute, Jogador player){
    return Container(
      width: 100,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(4),
      decoration: blackDecoration(),
      child: Column(
        children: [
          Text(atribute,style: EstiloTextoBranco.negrito18),
          Image.network(player.imageUrl,height: 50,width: 50),
          Text(player.name,style: EstiloTextoBranco.text14),
        ],
      ),
    );
  }
  Widget field(){
    return Column(
      children: [

        const Text('Lista de Jogadores',style: EstiloTextoBranco.text14),
      ],
    );
  }
Widget soldPlayers(){
    return Column(
      children: [

        const Text('Vendidos',style: EstiloTextoBranco.text14),
      ],
    );
}
  Widget boughtPlayers(){
    return Column(
      children: [
        const Text('Comprados',style: EstiloTextoBranco.text14),

      ],
    );
  }

}
