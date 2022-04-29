import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Translation{
  late BuildContext context;
  late AppLocalizations text;
  Translation(this.context){
    text = AppLocalizations.of(context)!;
  }
}
