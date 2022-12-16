import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_c7_fri/models/NewsResponse.dart';
import 'package:news_c7_fri/models/SourcesResponse.dart';
import 'package:news_c7_fri/shared/components/constants.dart';

class ApiManager{



  static Future<SourcesResponse> getSources(String categoryId)async{
    Uri URL=Uri.https(BASE,'/v2/top-headlines/sources',
    {"apiKey":APIKEY,"category":categoryId});
    Response sources= await http.get(URL);
    try{
      var json=jsonDecode(sources.body);
      print('er');
      SourcesResponse sourcesResponse=SourcesResponse.fromJson(json);
      print('err');
      return sourcesResponse;
    }catch(e){
      print("Error Here $e");
      throw e;
    }

  }

  static Future<NewsResponse> getNews(String sourceId)async{
    //https://newsapi.org/v2/everything?sources=abc-news-au&apiKey=dc3d106e730c4256b8c275d9da58d090

    Uri URL=Uri.https(BASE, '/v2/everything',{
      "apiKey":APIKEY,
      "sources":sourceId
    });
    Response newsData=await http.get(URL);

    var json=jsonDecode(newsData.body);

    NewsResponse newsResponse=NewsResponse.fromJson(json);
    return newsResponse;

  }

}