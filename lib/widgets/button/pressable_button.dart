import 'package:flutter/material.dart';


class PressableButton extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  const PressableButton({Key? key, required this.onTap, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}