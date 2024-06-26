import 'dart:convert';

import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news=[];
  
  
  Future<void> getNews()async{
String url="https://newsapi.org/v2/everything?q=tesla&from=2024-05-25&sortBy=publishedAt&apiKey=310bcc8708b4458b8ac8d72bca238e02";
 var response= await http.get(Uri.parse(url));

var jsonData= jsonDecode(response.body);

if(jsonData['status']=='ok'){
  jsonData["articles"].forEach((element){
    if(element["urlToImage"]!=null && element['description']!=null){
      ArticleModel articleModel= ArticleModel(
        title: element["title"],
        description: element["description"],
        url: element["url"],
        urlToImage: element["urlToImage"],
        content: element["content"],
        author: element["author"],
      );
      news.add(articleModel);
    }
  });
}
 
  }
}