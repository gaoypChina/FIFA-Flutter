import 'package:fifa/classes/jogador.dart';
import 'package:fifa/functions/order_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/popup/popup_player_info.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/background/background_overall.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/button_return.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../classes/my.dart';
import '../values/images.dart';

class TransferParameters{

  int ascOrDescAge = 0;
  int ascOrDescOVR = 0;
  int ascOrDescMoney = 0;
  String filteredPosition = '';
  int page = 0;

}

class Transfers extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Transfers({Key? key}) : super(key: key);
  @override
  _TransfersState createState() => _TransfersState();
}

class _TransfersState extends State<Transfers> {

  TransferParameters transferParameters = TransferParameters();

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
    return Scaffold(
        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

              Column(
                children: [

                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        const Text('Transferências',style: EstiloTextoBranco.text20),
                        const Spacer(),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(text: 'Saldo: ',style: EstiloTextoBranco.text16),
                          TextSpan(text: '\$ ${My().money.toStringAsFixed(2)} mi', style: EstiloTextoVerde.text20),
                        ],
                      ),
                    ),
                    ],
                  ),
                  ),



                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: searchNameBar(),
                  ),

                  playersRowTitle(),//titulo da tabela
                  Container(
                    height: bottomSize>0 ? 280 : 400,
                    color: AppColors().greyTransparent,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: SingleChildScrollView(
                      child: Table(
                        columnWidths: const {
                          0: FractionColumnWidth(.09),
                          1: FractionColumnWidth(.07),
                          2: FractionColumnWidth(.5),
                          5: FractionColumnWidth(.18),
                        },
                        children: [

                          for(int i=transferParameters.page*50; i<copyJogadoresID.length && showRows<50; i++)
                            playersRow(copyJogadoresID[i])

                        ],
                      ),
                    ),
                  ),
                  //FILTRAR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      localButton(
                          title: 'IDADE',
                          function: (){
                            setAge();
                          }),
                      localButton(
                          title: 'OVERALL',
                          function: (){
                            setOverall();
                          }),
                      localButton(
                          title: 'PREÇO',
                          function: (){
                            setPrice();
                          }),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      //BOTAO ESQUERDA
                      GestureDetector(
                        onTap: (){
                          transferParameters.page--;
                          if(transferParameters.page<=0){
                            transferParameters.page = 0;
                          }else{
                            customToast('Carregando');
                          }
                          setState(() {});

                        },child: const Icon(Icons.arrow_left,color:Colors.white,size: 50),
                      ),

                      //BOTAO ESQUERDA
                      GestureDetector(
                        onTap: (){
                          if((transferParameters.page+1)*50<copyJogadoresID.length){
                            transferParameters.page++;
                            customToast('Carregando');
                          }
                          setState(() {});

                        },child: const Icon(Icons.arrow_right,color:Colors.white,size: 50),
                      ),
                      //ESCOLHA DE POSIÇÃO
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                            context: context,
                            builder: (context) {
                                return Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Filtrar por qual posição?',style: EstiloTextoPreto.text16),
                                    ),
                                    SizedBox(
                                      height:150,
                                      child: Wrap(
                                        children: [
                                          bottomSheetButton(position: 'GOL'),
                                          bottomSheetButton(position: 'LE'),
                                          bottomSheetButton(position: 'LD'),
                                          bottomSheetButton(position: 'ZAG'),
                                          bottomSheetButton(position: 'VOL',),
                                          bottomSheetButton(position: 'MC'),
                                          bottomSheetButton(position: 'ME'),
                                          bottomSheetButton(position: 'MD'),
                                          bottomSheetButton(position: 'MEI'),
                                          bottomSheetButton(position: 'PE'),
                                          bottomSheetButton(position: 'PD'),
                                          bottomSheetButton(position: 'ATA'),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                            });
                        },
                          child: Column(
                          children: [
                            Image.asset('assets/icons/assists.png',height: 40,width: 40),
                            const Text('POSIÇÃO',style: EstiloTextoBranco.text14),
                          ],
                        ),
                        ),
                      )
                    ],
                  ),

                ],
              ),

              //BOTAO DE VOLTAR
              returnButton(context),

            ]
        )
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
            onTap:() {
                    setAge();
            },
              child: Row(
                children: [
                  const Text('IDA',style: EstiloTextoBranco.text16),
                  transferParameters.ascOrDescAge>0 ? transferParameters.ascOrDescAge==2
                      ? const Icon(Icons.arrow_drop_up,color:Colors.white,size:15)
                              : const Icon(Icons.arrow_drop_down,color:Colors.white,size:15)
                      : Container(),
                ],
              )
          ),
          const SizedBox(width: 5),
          GestureDetector(
              onTap:(){
                setOverall();
              },
              child: Row(
                children: [
                  const Text('OVR',style: EstiloTextoBranco.text16),
                  transferParameters.ascOrDescOVR>0 ?  transferParameters.ascOrDescOVR==2
                      ? const Icon(Icons.arrow_drop_up,color:Colors.white,size:15)
                      : const Icon(Icons.arrow_drop_down,color:Colors.white,size:15)
                      : Container(),
                ],
              )
          ),
          const SizedBox(width: 20),
          GestureDetector(
              onTap:(){
                  setPrice();
              },
              child: Row(
                children: [
                  const Text(' \$ ',style: EstiloTextoBranco.text16),
                  transferParameters.ascOrDescMoney>0 ?  transferParameters.ascOrDescMoney==2
                      ? const Icon(Icons.arrow_drop_up,color:Colors.white,size:15)
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
  if(player.injury>0){
    nameColor = Colors.red;
  }
  if(player.redCard>0 || player.yellowCard==3){
    nameColor = Colors.orange;
  }
  //Get Background color of overall
  Color backgroundOverallColor = colorOverallBackground(player.overall);

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
        //Text(player.index.toString(), style: EstiloTextoBranco.text16),
        GestureDetector(
          onTap:(){
            //comprar  jogador
            popUpOkShowPlayerInfos(
                context: context,
                playerID: player.index,
                funcSetState: (){setState(() {});}
            );
            setState(() {});
          },
          child: Text(player.name, style: TextStyle(
            color: nameColor,
            fontFamily: 'Roboto',
            fontSize: 16,
          )),
        ),
        Text(player.age.toString(), style: EstiloTextoBranco.text16),
        Container(
            color: backgroundOverallColor,
            padding: const EdgeInsets.all(4),
            child: Center(
              child: Text(player.overall.toStringAsFixed(0),
                  style: EstiloTextoPreto.text16),
            )
        ),
        Text(' ${player.price.toStringAsFixed(2)} mi',
            style:player.price>My().money ? EstiloTextoVermelho.text14 : EstiloTextoBranco.text14),
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
              copyJogadoresID = List.from(globalJogadoresIndex);
              copyJogadoresID.removeWhere((playerID)=>
                !Jogador(index: playerID).name.toString().toLowerCase().contains(searchString)
              );
              setState(() {});
            },
              child: const Icon(Icons.search,color:Colors.white)
          ),
        ],
      ),
    );

}

  localButton({required String title, required Function()? function}) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.only(top:5, bottom:5),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: EstiloTextoBranco.text22,
            ),
          ],
        ),
      ),
    );
  }

  bottomSheetButton({required String position}){
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,16,8,8),
      child: GestureDetector(
        onTap:(){
          Navigator.pop(context);
          if(transferParameters.filteredPosition == position){
            transferParameters.filteredPosition = "";
          }else{
            transferParameters.filteredPosition = position;
          }
          filterByPosition();
          customToast('Carregando');
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            color: transferParameters.filteredPosition == position ? Colors.green : Colors.black,
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(position,style: EstiloTextoBranco.text16),
          ),
        ),
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////////
// FUNCTIONS
////////////////////////////////////////////////////////////////////////////////
  setOverall(){
    transferParameters.ascOrDescAge = 0;
    transferParameters.ascOrDescMoney = 0;
    transferParameters.ascOrDescOVR ++;
    if(transferParameters.ascOrDescOVR==3){transferParameters.ascOrDescOVR=1;}
    filterByPosition();
    customToast('Carregando');
    setState(() {});
  }
  setAge(){
    transferParameters.ascOrDescOVR = 0;
    transferParameters.ascOrDescMoney = 0;
    transferParameters.ascOrDescAge ++;
    if(transferParameters.ascOrDescAge==3){transferParameters.ascOrDescAge=1;}
    filterByPosition();
    customToast('Carregando');
    setState(() {});
  }
  setPrice(){
    transferParameters.ascOrDescAge = 0;
    transferParameters.ascOrDescOVR = 0;
    transferParameters.ascOrDescMoney ++;
    if(transferParameters.ascOrDescMoney==3){transferParameters.ascOrDescMoney=1;}
    filterByPosition();
    customToast('Carregando');
    setState(() {});
  }
  resetCopyLists(){
    copyJogadoresID = List.from(globalJogadoresIndex);
    copyJogadoresAge = List.from(globalJogadoresAge);
    copyJogadoresOVR = List.from(globalJogadoresOverall);
    transferParameters.page = 0;
  }
filterByAge() {
  copyJogadoresAge = [];
  for (var playerID in copyJogadoresID) {
    Jogador player = Jogador(index: playerID);
    copyJogadoresAge.add(player.age);
  }
  if (transferParameters.ascOrDescAge==1){
    if(searchString.isNotEmpty){
      transferParameters.page = 0;
    }else {
      resetCopyLists();
    }
    List list = Order().listCrescente(listA: copyJogadoresAge, listB: copyJogadoresID, length: copyJogadoresAge.length);
    copyJogadoresAge = List.from(list[0]);
    copyJogadoresID = List.from(list[1]);
  }if (transferParameters.ascOrDescAge==2){
    if(searchString.isNotEmpty){
      transferParameters.page = 0;
    }else {
      resetCopyLists();
    }
    List list = Order().listDecrescente(listA: copyJogadoresAge, listB: copyJogadoresID, length: copyJogadoresAge.length);
    copyJogadoresAge = List.from(list[0]);
    copyJogadoresID = List.from(list[1]);
  }
}
  filterByOVR() {
    copyJogadoresOVR = [];
    for (var playerID in copyJogadoresID) {
      Jogador player = Jogador(index: playerID);
      copyJogadoresOVR.add(player.overall);
    }
    if (transferParameters.ascOrDescOVR==1){
      if(searchString.isNotEmpty){
        transferParameters.page = 0;
      }else {
        resetCopyLists();
      }
      List list = Order().listDecrescente(listA: copyJogadoresOVR, listB: copyJogadoresID, length: copyJogadoresOVR.length);
      copyJogadoresOVR = List.from(list[0]);
      copyJogadoresID = List.from(list[1]);
    }if (transferParameters.ascOrDescOVR==2){
      if(searchString.isNotEmpty){
        transferParameters.page = 0;
      }else {
        resetCopyLists();
      }
      List list = Order().listCrescente(listA: copyJogadoresOVR, listB: copyJogadoresID, length: copyJogadoresOVR.length);
      copyJogadoresOVR = List.from(list[0]);
      copyJogadoresID = List.from(list[1]);
    }
  }

  filterByPrice() {
    List copyJogadoresPrice = [];
    for (var playerID in copyJogadoresID) {
      Jogador player = Jogador(index: playerID);
      copyJogadoresPrice.add(player.price);
    }
    if (transferParameters.ascOrDescMoney==1){
      if(searchString.isNotEmpty){
        transferParameters.page = 0;
      }else {
        resetCopyLists();
      }
      List list = Order().listDecrescente(listA: copyJogadoresPrice, listB: copyJogadoresID, length: copyJogadoresPrice.length);
      copyJogadoresPrice = List.from(list[0]);
      copyJogadoresID = List.from(list[1]);
    }if (transferParameters.ascOrDescMoney==2){
      if(searchString.isNotEmpty){
        transferParameters.page = 0;
      }else {
        resetCopyLists();
      }
      List list = Order().listCrescente(listA: copyJogadoresPrice, listB: copyJogadoresID, length: copyJogadoresPrice.length);
      copyJogadoresPrice = List.from(list[0]);
      copyJogadoresID = List.from(list[1]);
    }
  }
  filterByPosition() {
    if(searchString.isNotEmpty){
      transferParameters.page = 0;
    }else {
      resetCopyLists();
    }
    filterByAge();
    filterByOVR();
    filterByPrice();
    if(transferParameters.filteredPosition.isNotEmpty){
      copyJogadoresID.removeWhere((playerID) => Jogador(index: playerID).position != transferParameters.filteredPosition);
    }
  }
}