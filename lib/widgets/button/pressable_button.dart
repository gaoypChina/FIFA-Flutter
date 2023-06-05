import 'package:flutter/material.dart';


class PressableButton extends StatelessWidget {
  final Function()? function;
  final Widget child;
  const PressableButton({Key? key, required this.function, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: function,
        child: child,
      ),
    );
  }
}