import 'package:flutter/material.dart';
import 'package:news/Models/article_Model.dart';

class ArtcileScreen extends StatelessWidget {
  static const routeName='artcileScreen';

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as ArticleModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff39A552),
        title: Text(args.title.substring(0,8)),
        centerTitle: true,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsetsDirectional.only(top: 20),
          child: Column(children:[
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(image: NetworkImage(args.image),fit:BoxFit.cover,)),
            SizedBox(
              height: 20,
            ),
            Text(args.title,style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),),
            SizedBox(
              height: 20,
            ),
            Text(args.des,maxLines: 7,style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),),
            SizedBox(
              height: 22,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 12,left: 12,bottom: 70),
              child: Row(
                children: [
                  Spacer(),
                  Text(args.Time.substring(0,10),style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
                ],
              ),
            ),

          ]),
        ),
      ),
    );
  }
}
