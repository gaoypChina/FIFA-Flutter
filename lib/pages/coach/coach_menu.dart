import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class CoachMenu extends StatefulWidget {
  const CoachMenu({Key? key}) : super(key: key);

  @override
  State<CoachMenu> createState() => _CoachMenuState();
}

class _CoachMenuState extends State<CoachMenu> {

  My my = My();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Images().getWallpaper(),

          Column(
            children: [
              const SizedBox(height: 40),
              const Text('Menu do Técnico',style: EstiloTextoBranco.text30),
              Text('Pontos: ${my.scoreGame} ',style: EstiloTextoBranco.text30),
              const Text('Mudar de Clube',style: EstiloTextoBranco.text30),
              const Text('Expectativa',style: EstiloTextoBranco.text30),
              const Text('Troféus',style: EstiloTextoBranco.text30),
              const Text('Gráficos Histórico do clube',style: EstiloTextoBranco.text30),

            ],
          ),
        ],
      ),
    );
  }
}
