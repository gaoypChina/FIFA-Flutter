import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/functions/end_year_updates/update_data_year.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';
import '../menu/c_menu.dart';

class EndYear extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const EndYear({Key? key}) : super(key: key);
  @override
  _EndYearState createState() => _EndYearState();
}

class _EndYearState extends State<EndYear> {

  My myTeamClass = My();
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    My myClass = My();

    return Scaffold(
        body: Stack(
            children: [

              Image.asset(
                  'assets/icons/wallpaper.png', height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill),

              Column(
                children: [

                  const SizedBox(height: 40),
                  Text('Fim do ano: ' + ano.toString(),style: EstiloTextoBranco.text30),
                  const SizedBox(height: 10),

                  //Escudo
                  Image.asset('assets/clubs/${FIFAImages().imageLogo(myClass.clubName)}.png',height: 90,width: 90),
                  const Spacer(),
                  //VOLTAR
                  customButtonContinue(
                      title: 'CONTINUAR',
                      function: () {

                        customToast('Carregando nova temporada');
                        funcUpdateDataAfterSeason();

                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Menu()));
                      }
                  ),

                ],
              )

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

}
