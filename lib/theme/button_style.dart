import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

customButtonContinue({required String title, required Function()? function}) {
  return InkWell(
    onTap: function,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(
            Radius.circular(25.0) //                 <--- border radius here
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: EstiloTextoBranco.text22,
          ),
        ],
      ),
    ),
  );
}