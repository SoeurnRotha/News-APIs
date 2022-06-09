import 'package:flutter/cupertino.dart';
import 'package:news_apis/Loadding/Loadding.dart';
import 'package:news_apis/Model/NewsModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
class NewsLogic extends ChangeNotifier{
  NewsModel _newsModel = NewsModel();
  NewsModel get newsModel=>_newsModel;
  Loadding _loadding = Loadding.none;
  Loadding get loadding => _loadding;

  void setLoadding(){
    _loadding = Loadding.loadding;
    notifyListeners();
  }
  void read() async{
    try{
      const String url = "https://newsapi.org/v2/everything?q=tesla&from=2022-05-09&sortBy=publishedAt&apiKey=223b6088dd53459ca8c9b788deaea289";
      http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode ==200){
        _newsModel = await compute(newsModelFromMap,response.body);
        _loadding = Loadding.done;
      }
    }catch(e){
      _loadding = Loadding.error;
    }finally{
      notifyListeners();
    }
  }
}