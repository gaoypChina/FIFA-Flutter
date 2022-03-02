import 'package:fifa/classes/jogador.dart';
import 'package:fifa/functions/globalfunctions.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Artilheiros extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final int choosenLeagueIndex;
  const Artilheiros({Key? key, required this.choosenLeagueIndex}) : super(key: key);
  @override
  _ArtilheirosState createState() => _ArtilheirosState();
}

class _ArtilheirosState extends State<Artilheiros> {

  List leaguePlayers = [];
////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    getArtilheirosOrdenado();
    super.initState();
  }
  getArtilheirosOrdenado() {
    leaguePlayers = GlobalFunctions().organizarVariavelLeague(widget.choosenLeagueIndex, 0);
    setState(() {});
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:  Stack(
            children: [

              Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

              Column(
                children: [

                  const SizedBox(height: 40),
                  const Text('Artilharia',style: EstiloTextoBranco.text20),

                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      alignment: Alignment.topLeft,
                      color: AppColors().greyTransparent,
                      child: SingleChildScrollView(
                        child: Table(
                          columnWidths: const{
                            0: FractionColumnWidth(.08),
                            1: FractionColumnWidth(.05),
                            2: FractionColumnWidth(.4),
                            3: FractionColumnWidth(.08),
                            4: FractionColumnWidth(.08),
                          },
                          children: [
                        const TableRow(children: [
                                SizedBox(width: 1),
                                SizedBox(width: 1),
                                SizedBox(width: 1),
                                Text('J',textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
                                Text('GM',textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
                              ]),

                            for(int i=0; i<leaguePlayers.length;i++)
                              rowArtilharia(i,leaguePlayers[i]),
                          ],
                        ),
                      ),
                    ),
                  ),

            ]),

      ]),

    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  TableRow rowArtilharia(int position, int playerIndex) {

    Jogador jogadorClass = Jogador(index: playerIndex);


    //print('POSITION: '+position.toString()+' ID: '+playerIndex.toString());
    return TableRow(
      children: [
        Text((position+1).toString()+"-",textAlign:TextAlign.end,style: EstiloTextoBranco.text14),
        Image.asset('assets/clubs/${FIFAImages().imageLogo(jogadorClass.clubName)}.png',height: 20,width: 20),
        SizedBox(
            width: 200,
            child: Text(jogadorClass.name,style: EstiloTextoBranco.text14)
        ),
        Text(jogadorClass.matchs.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
        Text(jogadorClass.goals.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
      ],
    );

  }
}