import 'package:fifa/classes/historic.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_trophy_image.dart';
import 'package:fifa/widgets/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'leagues_historic.dart';

class Historic extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Historic({Key? key}) : super(key: key);
  @override
  _HistoricState createState() => _HistoricState();
}

class _HistoricState extends State<Historic> {

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    //_height = MediaQuery.of(context).size.height;
    // bottomSize = MediaQuery.of(context).viewInsets.bottom; //=0 SEM O TECLADO
    return Scaffold(

        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

              Column(
                children: [

                  const SizedBox(height: 40),

                  for(int i=0;i<ano-anoInicial;i++)
                    myHistoricRow(i),


                  const SizedBox(height: 10),
                  //for(int i=0;i<ano-anoInicial;i++)
                    //tournamentsHistoricColumn(i),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      trophyWidget(0),
                      trophyWidget(1),
                      trophyWidget(2),
                    ],
                  ),

                  const Spacer(),
                  //VOLTAR
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child:  customButtonContinue(
                        title: 'PRÓXIMO',
                        function: (){
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HistoricLeague()));
                        }
                    ),
                  ),
                  //VOLTAR
                  Padding(
                      padding: const EdgeInsets.all(6),
                      child:  customButtonContinue(
                          title: 'VOLTAR',
                          function: (){
                            Navigator.pop(context);
                          }
                      ),
                    ),


                ],
              ),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget myHistoricRow(int index){
    int ano = index + anoInicial;
    int position = 5;
    String teamName = 'Guarani';
  return Row(
    children: [
      Text(ano.toString()+': '+position.toString()+'º c/'+teamName,style: EstiloTextoBranco.text14),
      Image.asset('assets/clubs/${FIFAImages().imageLogo(teamName)}.png',height: 15,width: 15),
    ],
  );
}


///////////////////////////
Widget tournamentsHistoricColumn(int ano){
    return Column(
      children: [
        for(int i=0;i<16;i++)
          tournamentsHistoricRow(i, ano+anoInicial),
      ],
    );
}
Widget tournamentsHistoricRow(int index, int ano){
  return Row(
    children: [
      Text(ano.toString(),style: EstiloTextoBranco.text14),
    ],
  );
}

///////////////////////////
Widget trophyWidget(int i){
    late String name;
    late String image;
    late int qntd;

    if(i==0){
      name = 'Campeonatos Nacionais';
      image = getTrophyImage(My().campeonatoName);
      qntd = HistoricFunctions().myLeagueTitles();
    }
    if(i==1){
      name = 'Campeonatos Internacionais';
      image = getTrophyImage(My().internationalLeagueName);
      qntd = 0;
    }
    if(i==2){
      name = 'Campeonatos 2ªDivisão';
      image = 'trophy2division';
      qntd = 0;
    }
    return Column(
      children: [
        SizedBox(
          width: 100,
            child: Text(name,textAlign:TextAlign.center,style: EstiloTextoBranco.text14)
        ),
        Image.asset('assets/trophy/$image.png',height: 100,width: 100),
        Text(qntd.toString(),style: EstiloTextoBranco.text20),
      ],
    );
}

}