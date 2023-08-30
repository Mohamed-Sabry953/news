import 'package:flutter/material.dart';
import 'package:news/Shared/network/remote/API_manager.dart';
import 'package:news/screens/SettingScreen.dart';

class newsScreen extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu_outlined, size: 35)),
                  InkWell(
                    onTap: () {},
                    child: Text('categories',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 25)),
                  )
                ],
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
        title: Text('News'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          SizedBox(
            width: 20,
          ),
        ],
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
          future: API_manager.getSources(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }
            var soruces = snapshot.data?.sources ?? [];
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Text(soruces[index].name ?? '');
              },
            );
          },
        ),
      ),
    );
  }
}
