import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String Name;
  String image;
  Color color;

  CategoryModel(this.id, this.Name, this.image, this.color);
  static List<CategoryModel> categories = [
    CategoryModel(
      "sports",
      "sports",
      "assets/images/sports.png",
      Color(0xffC91C22),
    ),
    CategoryModel(
      "general",
      "Politics",
      "assets/images/Politics.png",
      Color(0xff003E90),
    ),
    CategoryModel(
      "health",
      "health",
      "assets/images/health.png",
      Color(0xffED1E79),
    ),    CategoryModel(
      "business",
      "business",
      "assets/images/bussines.png",
      Color(0xffCF7E48),
    ), CategoryModel(
      "entertainment",
      "environment",
      "assets/images/environment.png",
      Color(0xff4882CF),
    ), CategoryModel(
      "science",
      "science",
      "assets/images/science.png",
      Color(0xffF2D352),
    ),
  ];

}