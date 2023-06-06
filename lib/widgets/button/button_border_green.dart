import 'package:fifa/theme/colors.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:flutter/material.dart';

class ButtonBorderGreen extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  const ButtonBorderGreen({Key? key, required this.onTap, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: decorationGreen(),
      child: PressableButton(
          onTap: onTap,
          child: child
      )
    );
  }
}

BoxDecoration decorationGreen(){
  return BoxDecoration(
    color: AppColors().greyTransparent,
    border: Border.all(color: AppColors().green, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(4)),
  );
}
