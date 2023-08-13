import 'package:flutter/material.dart';


class PressableButton extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  final double? borderRadiusValue;
  const PressableButton({Key? key, required this.onTap, required this.child, this.borderRadiusValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        child: child,
      ),
    );
  }
}