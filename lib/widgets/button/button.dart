import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

buttonText({required String title, required Function()? function}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: function,
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: EstiloTextoBranco.text16,
            ),
          ],
        ),
      ),
    ),
  );
}

buttonIcon({required Widget widget, required Function()? function}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: function,
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget
          ],
        ),
      ),
    ),
  );
}