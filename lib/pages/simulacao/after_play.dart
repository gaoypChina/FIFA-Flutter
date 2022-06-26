import 'package:fifa/classes/image_class.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class AfterPlay extends StatefulWidget {
  const AfterPlay({Key? key}) : super(key: key);

  @override
  State<AfterPlay> createState() => _AfterPlayState();
}

class _AfterPlayState extends State<AfterPlay> {

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Column(
            children: const [
              SizedBox(height: 40),
              Text('Escolha',style: EstiloTextoBranco.negrito22),

            ],
          ),

        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
}
