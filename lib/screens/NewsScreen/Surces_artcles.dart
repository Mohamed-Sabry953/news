import 'package:flutter/material.dart';
import 'package:news/Models/Sources_model/Sources_Model.dart';
import 'package:news/Shared/network/remote/API_manager.dart';
import 'package:news/screens/NewsScreen/article_item.dart';
import 'package:news/screens/NewsScreen/source_item.dart';
import 'package:news/themes/ThemeData.dart';

class SourcesItemClick extends StatefulWidget {
  List<Sources> sources;

  SourcesItemClick(this.sources);

  @override
  State<SourcesItemClick> createState() => _SourcesItemClickState();
}

class _SourcesItemClickState extends State<SourcesItemClick> {
  @override
  int currentindex = 0;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    currentindex = index;
                    setState(() {});
                  },
                  child: sourceItem(
                      widget.sources[index].name ?? '',
                      widget.sources.elementAt(currentindex) ==
                              widget.sources[index]));
            },
            itemCount: widget.sources.length,
          ),
        ),
        FutureBuilder(
          future: API_manager.getNewsData(widget.sources[currentindex].id??""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }
            var articles =snapshot.data?.articles??[];
            return Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                return articleItem(articles[index]);
              }, itemCount: articles.length,scrollDirection:Axis.vertical),
            );
        },)
      ],
    );
  }

}
