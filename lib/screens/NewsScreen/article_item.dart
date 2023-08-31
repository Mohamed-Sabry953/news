import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news/Models/News_model/News_Model.dart';
import 'package:news/screens/articleScreen.dart';

import '../../Models/article_Model.dart';

class articleItem extends StatelessWidget {
  Articles articles;

  articleItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ArtcileScreen.routeName,
            arguments: ArticleModel(
                articles.title ?? '',
                articles.description ?? '',
                (articles.urlToImage ?? ''),
                articles.author ?? '',
                articles.publishedAt ?? ''));
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 10, right: 10, left: 10, top: 10),
        elevation: 12,
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25)),
        child: Container(
          margin: EdgeInsetsDirectional.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image(
                      image: NetworkImage(
                    articles.urlToImage ?? '',
                  ))),
              SizedBox(
                height: 10,
              ),
              Text(articles.title ?? '',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2),
              SizedBox(
                height: 10,
              ),
              Text(articles.description ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 4),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(articles.author?.substring(0, 4) ?? ''),
                  Spacer(),
                  Text(articles.publishedAt?.substring(0, 10) ?? ''),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
