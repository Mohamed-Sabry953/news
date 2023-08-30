import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/Models/Sources_model/Sources_Model.dart';


class API_manager{

  static Future<SourcesModel> getSources()async{
    Uri url=Uri.https("newsapi.org","/v2/top-headlines/sources",
    {
      "apiKey":"2ecd01eb2015451e92219ab5bf9d12a8"
    });
    var response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    SourcesModel sourcesModel =SourcesModel.fromJson(jsonData);
    return sourcesModel;
  }
}