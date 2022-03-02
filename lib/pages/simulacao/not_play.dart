import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/functions/fim_campeonato_local.dart';
import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/simulate_functions.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/simulacao/end_year.dart';
import 'package:fifa/widgets/button_continue.dart';
import 'package:fifa/widgets/table_widget.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class NotPlay extends StatefulWidget {
  const NotPlay({Key? key}) : super(key: key);
  @override
  _NotPlayState createState() => _NotPlayState();
}

class _NotPlayState extends State<NotPlay> {

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    String weekName = Semana().semanaAlternativeStr;

    return Scaffold(
        body:  Stack(
            children: [

              Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

              Column(
                children: [

                  const SizedBox(height: 40),
                  Text('Semana: '+weekName,style: EstiloTextoBranco.text30),
                  const SizedBox(height: 10),

                  //TABELA
                  tabelaClassificacaoWidget(My().campeonatoID),

                  const Spacer(),
                  //VOLTAR
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child:  customButtonContinue(
                        title: 'CONTINUAR',
                        function: (){
                          onContinueButton();
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
onContinueButton(){
  //SIMULA JOGOS DE FASE DE GRUPOS INTERNACIONAIS
  if(semanasGruposInternacionais.contains(semana)){
    Simulate().internationalMatchsGroups();
  }

  semana++;
  //Atualiza a rodada do campeonato
  if(semanasJogosNacionais.contains(semana)) {
    if(semana < League(index: My().campeonatoID).nClubs) {
      rodada = semanasJogosNacionais.indexOf(semana)+1;
    }
  }

  //Times na champions e libertadores
  if(semana == semanasJogosInternacionais[0]){
    FimDoCampeonatoLocal().setAll032InternationalTeams();
  }

  if(semana == ultimasemana){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EndYear()));
  }else{
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));
  }
}

}
