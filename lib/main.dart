import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/provider/settingprovider.dart';
import 'package:news/screens/CategoryScreen/homeLayout.dart';
import 'package:news/screens/NewsScreen/NewsScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/screens/SettingScreen.dart';
import 'package:news/screens/articleScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(create: (context)=>settingprovider(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<settingprovider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(provider.language),
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: provider.mode,
      debugShowCheckedModeBanner: false,
      initialRoute: Categories.routeName,
      routes: {
        newsScreen.routeName:(context)=>newsScreen(),
        SettingTap.routeName:(context)=>SettingTap(),
        ArtcileScreen.routeName:(context)=>ArtcileScreen(),
        Categories.routeName:(context)=>Categories(),
      },
    );
}}
