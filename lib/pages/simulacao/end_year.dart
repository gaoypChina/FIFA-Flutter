import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/functions/end_year_updates/update_data_year.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/loader.dart';
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
  bool loading = false;
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(
            children: [

              Images().getWallpaper(),

              !loading ? Column(
                children: [

                  const SizedBox(height: 40),
                  Text('${Translation(context).text.endOfYear}: ' + ano.toString(),style: EstiloTextoBranco.text30),
                  const SizedBox(height: 10),

                  //Escudo
                  Images().getMyEscudo(size: 90),
                  const Spacer(),
                  //VOLTAR
                  customButtonContinue(
                      title: Translation(context).text.next,
                      function: () async {

                        customToast(Translation(context).text.loadingNewSeason);
                        loading = true;
                        setState(() {});
                        //AWAIT Só pra dar o set state antes e mostrar a pagina carregando
                        await Future.delayed(const Duration(milliseconds: 10), () {});
                        funcUpdateDataAfterSeason();

                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Menu()));
                      }
                  ),

                ],
              ) : loader(),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

}
