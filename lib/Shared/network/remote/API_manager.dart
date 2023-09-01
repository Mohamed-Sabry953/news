import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/Models/News_model/News_Model.dart';
import 'package:news/Models/Sources_model/Sources_Model.dart';
import 'package:news/Shared/constant/Constant.dart';


class API_manager{

  static Future<SourcesModel> getSources(String categoryId)async{
    Uri url=Uri.https("newsapi.org","/v2/top-headlines/sources",
    {
      "apiKey":Constant.API_KEY,"category":categoryId
    });
    var response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    SourcesModel sourcesModel =SourcesModel.fromJson(jsonData);
    return sourcesModel;
  }
  static Future<NewsModel> getNewsData(String sourceId)async{
    Uri url=Uri.https("newsapi.org","/v2/everything",
    {
      "apiKey":Constant.API_KEY,"sources":sourceId
    });
    var response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    NewsModel newsModel =NewsModel.fromJson(jsonData);
    return newsModel;
  }
}