import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global/global_variables.dart';
import 'package:fifa/global/globalfunctions.dart';
import 'package:fifa/popup/popup_ok_cancel.dart';
import 'package:fifa/theme/button_style.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/return_button.dart';
import 'package:fifa/theme/textstyle.dart';

import 'package:flutter/material.dart';
import '../classes/my.dart';
import '../global/images.dart';

class Transfers extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Transfers({Key? key}) : super(key: key);
  @override
  _TransfersState createState() => _TransfersState();
}

class _TransfersState extends State<Transfers> {

  int ascOrDescAge = 0;
  int ascOrDescOVR = 0;
  int ascOrDescMoney = 0;

  List copyJogadoresID = List.from(globalJogadoresIndex);
  List copyJogadoresAge = List.from(globalJogadoresAge);
  List copyJogadoresOVR = List.from(globalJogadoresOverall);

  String searchString='';
  int showRows = 0;

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    double bottomSize = MediaQuery.of(context).viewInsets.bottom; //=0 SEM O TECLADO +-160 com o teclado

    showRows =0;
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
                    const Text('Transferências',style: EstiloTextoBranco.text20),

                    Text('Saldo: \$'+My().money.toStringAsFixed(2)+'mi',style: EstiloTextoBranco.text20),

                    playersRowTitle(),

                    Container(
                      height: bottomSize>0 ? 280 : 400,
                      color: AppColors().greyTransparent,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: SingleChildScrollView(
                        child: Table(
                          columnWidths: const {
                            0: FractionColumnWidth(.09),
                            1: FractionColumnWidth(.07),
                            3: FractionColumnWidth(.45),
                            6: FractionColumnWidth(.18),
                          },
                          children: [
                            for(int i=0; i<5000 && showRows<100; i++)
                              playersRow(copyJogadoresID[i])
                          ],
                        ),
                      ),
                    ),
                    //FILTRAR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customButtonContinue(
                            title: 'IDADE',
                            function: (){

                            }),
                        customButtonContinue(
                            title: 'OVERALL',
                            function: (){

                            }),
                        customButtonContinue(
                            title: 'PREÇO',
                            function: (){

                            }),
                      ],
                    ),

                    searchNameBar(),

                  ],
                ),

                //BOTAO DE VOLTAR
                returnButton(context),

              ]
          )
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget playersRowTitle(){
    return Container(
      color:AppColors().greyTransparent,
      child: Row(
        children: [
          const Text('POS',style: EstiloTextoBranco.text16),
          const SizedBox(width: 16),
          const SizedBox(width:200,child: Text('NAME',style: EstiloTextoBranco.text16)),
          GestureDetector(
            onTap:() async {
              ascOrDescOVR = 0;
              ascOrDescMoney = 0;
              ascOrDescAge ++;
              if(ascOrDescAge==3){ascOrDescAge=1;}
              await filterByAge();
              setState(() {});
            },
              child: Row(
                children: [
                  const Text('IDA',style: EstiloTextoBranco.text16),
                  ascOrDescAge>0 ? ascOrDescAge==2 ? const Icon(Icons.arrow_drop_up,color:Colors.white,size:15)
                              : const Icon(Icons.arrow_drop_down,color:Colors.white,size:15)
                      : Container(),
                ],
              )
          ),
          const SizedBox(width: 5),
          GestureDetector(
              onTap:(){
                ascOrDescAge = 0;
                ascOrDescMoney = 0;
                ascOrDescOVR ++;
                if(ascOrDescOVR==3){ascOrDescOVR=1;}
                filterByOVR();
                setState(() {});
              },
              child: Row(
                children: [
                  const Text('OVR',style: EstiloTextoBranco.text16),
                  ascOrDescOVR>0 ? ascOrDescOVR==2 ? const Icon(Icons.arrow_drop_up,color:Colors.white,size:15)
                      : const Icon(Icons.arrow_drop_down,color:Colors.white,size:15)
                      : Container(),
                ],
              )
          ),
          const SizedBox(width: 20),
          GestureDetector(
              onTap:(){
                ascOrDescAge = 0;
                ascOrDescOVR = 0;
                ascOrDescMoney ++;
                if(ascOrDescMoney==3){ascOrDescMoney=1;}
                setState(() {});
              },
              child: Row(
                children: [
                  const Text(' \$ ',style: EstiloTextoBranco.text16),
                  ascOrDescMoney>0 ? ascOrDescMoney==2 ? const Icon(Icons.arrow_drop_up,color:Colors.white,size:15)
                      : const Icon(Icons.arrow_drop_down,color:Colors.white,size:15)
                      : Container(),
                ],
              )
          ),
        ],
      ),
    );
  }


TableRow playersRow(int playerIndex){
  Jogador player = Jogador(index: playerIndex);
  Color nameColor = Colors.white;
  if(player.injury>0 || player.redCard>0 || player.yellowCard==3){
    nameColor = Colors.red;
  }
  Color backgroundOverallColor = Colors.transparent;
  if(player.overall <= 70){backgroundOverallColor = Colors.white70;}
  if(player.overall >= 70){backgroundOverallColor = Colors.lightBlueAccent.withOpacity(0.5);}
  if(player.overall >= 75){backgroundOverallColor = Colors.blue;}
  if(player.overall >= 80){backgroundOverallColor = Colors.yellowAccent.withOpacity(0.7);}
  if(player.overall >= 85){backgroundOverallColor = Colors.yellow;}

  if(searchString.isEmpty || (searchString.isNotEmpty && player.name.toLowerCase().contains(searchString.toLowerCase()))) {

    showRows ++;
    return TableRow(
      children: [
        Row(
          children: [
            Text(player.position, style: EstiloTextoBranco.text16),
          ],
        ),
        Image.asset(
            'assets/clubs/${FIFAImages().imageLogo(player.clubName)}.png',
            height: 20, width: 20),
        Text(player.index.toString(), style: EstiloTextoBranco.text16),
        GestureDetector(
          onTap:(){
            comprarJogador(player);
          },
          child: SizedBox(
              width: 170,
              child: Text(player.name, style: TextStyle(
                color: nameColor,
                fontFamily: 'Roboto',
                fontSize: 16,
              ))
          ),
        ),
        Text(player.age.toString(), style: EstiloTextoBranco.text16),
        Container(
            color: backgroundOverallColor,
            padding: const EdgeInsets.all(4),
            child: Text(player.overall.toStringAsFixed(0),
                style: EstiloTextoPreto.text16)
        ),
        Text(player.price.toStringAsFixed(2) + 'mi',
            style: EstiloTextoBranco.text14),
      ],
    );
  }else{
    return TableRow(children: [Container(),Container(),Container(),Container(),Container(),Container(),Container(),]);
  }
}

Widget searchNameBar(){

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colors.white,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(14.0) ),
      ),
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value){
                searchString = value;
              },
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
              hintText: 'Nome do Jogador',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          GestureDetector(
            onTap:(){
              setState(() {});
            },
              child: const Icon(Icons.search,color:Colors.white)
          ),
        ],
      ),
    );

}
////////////////////////////////////////////////////////////////////////////////
// FUNCTIONS
////////////////////////////////////////////////////////////////////////////////
  resetCopyLists(){

    copyJogadoresID = List.from(globalJogadoresIndex);
    copyJogadoresAge = List.from(globalJogadoresAge);
    copyJogadoresOVR = List.from(globalJogadoresOverall);


  }
filterByAge() async{
  resetCopyLists();
  for (int i=0;i<copyJogadoresAge.length-1;i++) {
    for (int k=i+1;k<copyJogadoresAge.length;k++) {
      if (ascOrDescAge==1 && copyJogadoresAge[i] < copyJogadoresAge[k]) {
        int number = copyJogadoresAge[k];copyJogadoresAge[k] = copyJogadoresAge[i];copyJogadoresAge[i] = number;
        int number2 = copyJogadoresID[k];copyJogadoresID[k] = copyJogadoresID[i];copyJogadoresID[i] = number2;
      }
      if (ascOrDescAge==2 && copyJogadoresAge[i] > copyJogadoresAge[k]) {
        int number = copyJogadoresAge[k];copyJogadoresAge[k] = copyJogadoresAge[i];copyJogadoresAge[i] = number;
        int number2 = copyJogadoresID[k];copyJogadoresID[k] = copyJogadoresID[i];copyJogadoresID[i] = number2;
      }
    }
  }
}
  filterByOVR() {
    resetCopyLists();

    List list = GlobalFunctions().organizarOrdemDecrescente(listA: copyJogadoresOVR, listB: copyJogadoresID, length: copyJogadoresOVR.length);
    copyJogadoresOVR = List.from(list[0]);
    copyJogadoresID = List.from(list[1]);
    // for (int i=0;i<copyJogadoresOVR.length-1;i++) {
    //   for (int k=i+1;k<copyJogadoresOVR.length;k++) {
    //     if (ascOrDescOVR==1 && copyJogadoresOVR[i] < copyJogadoresOVR[k]) {
    //       int number = copyJogadoresOVR[k];copyJogadoresOVR[k] = copyJogadoresOVR[i];copyJogadoresOVR[i] = number;
    //       number = copyJogadoresID[k];copyJogadoresID[k] = copyJogadoresID[i];copyJogadoresID[i] = number;
    //     }
    //     if (ascOrDescOVR==2 && copyJogadoresOVR[i] > copyJogadoresOVR[k]) {
    //       int number = copyJogadoresOVR[k];copyJogadoresOVR[k] = copyJogadoresOVR[i];copyJogadoresOVR[i] = number;
    //       number = copyJogadoresID[k];copyJogadoresID[k] = copyJogadoresID[i];copyJogadoresID[i] = number;
    //     }
    //   }
    // }
  }

  comprarJogador(Jogador player){
    if(player.price>My().money){
      customToast('Sem dinheiro disponível');
    }
    else{
      popUpOkCancelar(
          context: context,
          title: 'Deseja Comprar ${player.name}?',
          content: 'Seu Saldo: \$'+My().money.toStringAsFixed(2)
              + '\nCusto:        \$'+player.price.toStringAsFixed(2)
              + '\nIdade: '+player.age.toString()
              + '\nJogos: '+player.goals.toString()
              + '\nGols: '+player.goals.toString()
              + '\nAssistências: '+player.assists.toString()
              + '\nLesão: '+player.injury.toString()
              + '\nCartões Amarelos: '+player.yellowCard.toString()
              + '\nCartões Vermelhos: '+player.redCard.toString(),
          function: (){
            globalMyMoney -= player.price;
            customToast('Jogador comprado');
            globalJogadoresClubIndex[player.index] = My().clubID;
            globalMyJogadores.add(player.index);
            setState(() {});
          }
      );
    }
  }
}