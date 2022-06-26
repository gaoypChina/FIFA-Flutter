import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class LeaguesConfiguration extends StatefulWidget {
  const LeaguesConfiguration({Key? key}) : super(key: key);

  @override
  State<LeaguesConfiguration> createState() => _LeaguesConfigurationState();
}

class _LeaguesConfigurationState extends State<LeaguesConfiguration> {

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Images().getWallpaperContainerDecoration(),
        child: Stack(
          children: [
            backButtonText(context,'Trocar'),

            Container(
              height: Sized(context).height,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(top:60),
              child: Column(
                children: [
                  const Text('Aqui',style: EstiloTextoBranco.negrito16),
                  title(),
                  leagues(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget title(){
    return Row(
      children: [
        const SizedBox(width: 100),
        const Text('nºTimes',style: EstiloTextoBranco.negrito16),
        const SizedBox(width: 6),
        const Text('Rebaixados',style: EstiloTextoBranco.negrito16),
        const SizedBox(width: 6),
        Image.asset(FIFAImages().campeonatoInternacionalLogo('Libertadores'),width: 40,height: 40),
        const SizedBox(width: 6),
        Image.asset(FIFAImages().campeonatoInternacionalLogo('Champions League'),width: 40,height: 40),
      ],
    );
  }
  Widget leagues(){
    return
        SizedBox(
          height: 400,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (c,i)=>leagueRow(),
    ),
        );
  }
Widget leagueRow(){
  return Row(
    children: [
      Image.asset(FIFAImages().campeonatoLogo(1),width: 50,height: 50),
      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_left,color: Colors.white),),
      const Text('0',style: EstiloTextoBranco.negrito16),
      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_right,color: Colors.white),),
      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_left,color: Colors.white),),
      const Text('0',style: EstiloTextoBranco.negrito16),
      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_right,color: Colors.white),),
      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_left,color: Colors.white),),
      const Text('0',style: EstiloTextoBranco.negrito16),
      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_right,color: Colors.white),),
    ],
  );
}
}
