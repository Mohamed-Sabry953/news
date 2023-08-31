import 'package:flutter/material.dart';
import 'package:news/provider/settingprovider.dart';
import 'package:news/themes/ThemeData.dart';
import 'package:provider/provider.dart';

class sourceItem extends StatelessWidget {
  String SourceName;
  bool isSelected;


  sourceItem(this.SourceName, this.isSelected);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<settingprovider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 15),
        width: 150,
        decoration: BoxDecoration(
        color: isSelected?MyThemeData.light:Colors.white,
          border: Border.all(
            color: MyThemeData.light,
            width: 2,

          ),
              borderRadius: BorderRadius.circular(15)
        ),
        child: Text(SourceName,style: TextStyle(
          color:isSelected?Colors.white:MyThemeData.light,
          fontSize: 14,
          fontWeight: FontWeight.w600
        ),),
        alignment: Alignment.center,
      ),
    );
  }
}
