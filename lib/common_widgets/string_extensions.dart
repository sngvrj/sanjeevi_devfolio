import 'package:flutter/material.dart';
import 'package:sanjeevi_devfolio/locale/app_localization.dart';

extension StringExtension on String{
   String t(BuildContext context){
     return AppLocalizations.of(context)?.translate(this)??'';
   }
}