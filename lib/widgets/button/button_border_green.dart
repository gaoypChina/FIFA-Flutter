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
      margin: const EdgeInsets.all(8),
      decoration: decorationGreen(),
      child: PressableButton(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: child,
          )
      )
    );
  }
}

class ButtonBorderGreen4 extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  const ButtonBorderGreen4({Key? key, required this.onTap, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(4),
        decoration: decorationGreen(),
        child: PressableButton(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(4),
              child: child,
            )
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

BoxDecoration decorationGreenOff(){
  return BoxDecoration(
    color: AppColors().greyTransparent,
    borderRadius: const BorderRadius.all(Radius.circular(4)),
  );
}