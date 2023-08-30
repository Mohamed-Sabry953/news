import 'package:flutter/material.dart';
import 'package:news/provider/settingprovider.dart';
import 'package:news/themes/ThemeData.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingTap extends StatefulWidget {
  static const routeName = 'setting';

  @override
  State<SettingTap> createState() => _SettingTapState();
}

class _SettingTapState extends State<SettingTap> {
  String _dropDownValuelang = 'English';
  String _dropDownValueTheming = 'Light';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<settingprovider>(context);
    _dropDownValuelang = provider.language == 'en' ? 'English' : 'عربى';
    _dropDownValueTheming = provider.mode == ThemeMode.light ? 'Light' : 'Dark';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff39A552),
        title: Text('Setting'),
        centerTitle: true,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
        toolbarHeight: 80,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),fit: BoxFit.fitHeight)),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: TextStyle(
                      color: provider.mode == ThemeMode.light
                          ? MyThemeData.dark
                          : Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsetsDirectional.only(top: 40, start: 15, end: 15),
                    padding: EdgeInsetsDirectional.only(start: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: MyThemeData.light)),
                    child: DropdownButton(
                      underline: Container(
                        decoration:
                            UnderlineTabIndicator(borderSide: BorderSide.none),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      itemHeight: 60,
                      dropdownColor: Colors.grey,
                      hint: _dropDownValuelang == null
                          ? Text(
                              'Dropdown',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            )
                          : Text(
                              _dropDownValuelang,
                              style: TextStyle(color: MyThemeData.light),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      iconDisabledColor: Colors.black,
                      style: Theme.of(context).textTheme.bodyMedium,
                      items:
                          ['English', AppLocalizations.of(context)!.arabic].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          _dropDownValuelang = val!;
                          if (_dropDownValuelang == 'English') {
                            provider.changelanguage('en');
                          } else {
                            provider.changelanguage('ar');
                          }
                          ;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.mode,
                    style: TextStyle(
                      color: provider.mode == ThemeMode.light
                          ? MyThemeData.dark
                          : Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsetsDirectional.only(top: 40, start: 15, end: 15),
                    padding: EdgeInsetsDirectional.only(start: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: MyThemeData.light)),
                    child: DropdownButton(
                      underline: Container(
                        decoration:
                            UnderlineTabIndicator(borderSide: BorderSide.none),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      itemHeight: 60,
                      dropdownColor: Colors.white,
                      hint: _dropDownValueTheming == null
                          ? Text(
                              'Dropdown',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            )
                          : Text(
                              _dropDownValueTheming,
                              style: TextStyle(color: MyThemeData.light),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      iconDisabledColor: Colors.black,
                      style: Theme.of(context).textTheme.bodyMedium,
                      items: ['Light', 'Dark'].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            _dropDownValueTheming = val!;
                            if (_dropDownValueTheming == 'Light') {
                              provider.changetheme(ThemeMode.light);
                            } else {
                              provider.changetheme(ThemeMode.dark);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
