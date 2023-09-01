import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/Models/categories_model.dart';
import 'package:news/Shared/network/remote/API_manager.dart';
import 'package:news/provider/settingprovider.dart';
import 'package:news/screens/CategoryScreen/homeLayout.dart';
import 'package:news/screens/NewsScreen/Surces_artcles.dart';
import 'package:news/screens/SettingScreen.dart';
import 'package:provider/provider.dart';

class newsScreen extends StatelessWidget {
  static const String routeName = 'home';
  int currentindex = 0;
  bool vis = false;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<settingprovider>(context);
  var args=ModalRoute.of(context)?.settings.arguments as CategoryModel;
    return Scaffold(
      drawer: Drawer(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.png',
                ),
                fit: BoxFit.fitHeight)),
        child: Column(
          children: [
            Container(
              color: Color(0xff39A552),
              height: 200,
              child: Text(
                "News App!",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(context, Categories.routeName, (route) => false);
                },
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                        },
                        icon: Icon(Icons.menu_outlined, size: 35)),
                    Text('categories',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 25))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SettingTap.routeName);
                      },
                      icon: Icon(Icons.settings_outlined, size: 35)),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SettingTap.routeName);
                    },
                    child: Text('Setting',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 25)),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
      appBar: AppBar(
        backgroundColor: Color(0xff39A552),
        title: Text(args.Name),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              provider.changevis();
            },
            icon:
                provider.visble == true ? Icon(Icons.cancel_outlined) : Icon(Icons.search),
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
        ],


        flexibleSpace: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            margin: const EdgeInsets.only(
                top: 35.0, bottom: 15, left: 50, right: 20),
            child: Visibility(
              visible: provider.visble,
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ),
        ),


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
                image: AssetImage(
                  'assets/images/background.png',
                ),
                fit: BoxFit.fitHeight)),
        child: FutureBuilder(
          future: API_manager.getSources(args.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }
            var soruces = snapshot.data?.sources ?? [];
            return SourcesItemClick(soruces);
          },
        ),
      ),
    );
  }
}
