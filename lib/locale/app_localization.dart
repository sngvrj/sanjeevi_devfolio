import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanjeevi_devfolio/constants/languages.dart';

class AppLocalizations{
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(context) => Localizations.of<AppLocalizations>(context,AppLocalizations);

  late Map<String,String> _localizedStrings;

  Future<bool> load() async{
    final jsonString = await rootBundle.loadString('assets/language/${locale.languageCode}.json');
    final Map<String,dynamic > jsonMap =json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) => MapEntry(key,value.toString()));

    return true;
  }


  String? translate(String key) {
    return _localizedStrings[key];
  }


static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations>{

  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    //To Check the language that we loaded is supported by app or not
    return Languages.languages.map((e) => e.code).toList().contains(locale.languageCode);
    }
  
    @override
    Future<AppLocalizations> load(Locale locale) async {
      AppLocalizations localizations;
      localizations = AppLocalizations(locale);
      await localizations.load();
      return localizations;
    }
  
    @override
    bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}