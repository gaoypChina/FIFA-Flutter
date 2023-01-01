import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class DailyMatch extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const DailyMatch({Key? key}) : super(key: key);
  @override
  _DailyMatchState createState() => _DailyMatchState();
}

class _DailyMatchState extends State<DailyMatch> {

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
  }

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(
            children: [

              Image.asset(
                  'assets/icons/wallpaper blue.png', height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill),

              SizedBox(
                height: Sized(context).height,
                width: Sized(context).width,
                child: Column(
                    children: const [
                      SizedBox(height: 30),
                      Text('oi', style: EstiloTextoBranco.text20),

                    ]
                ),
              )
            ])
    );
  }


}