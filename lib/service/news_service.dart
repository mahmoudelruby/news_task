import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/artical.dart';


class NewsService {
  static const String _baseUrl = 'https://newsapi.org/v2';
  static const String _apiKey = 'Add your API key here'; 
  
  Future<List<Article>> getTopHeadlines({String category = ''}) async {
    try {
      final url = Uri.parse(
        '$_baseUrl/top-headlines?country=us${category.isNotEmpty ? '&category=$category' : ''}&apiKey=$_apiKey'
      );
      
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = (data['articles'] as List)
            .map((article) => Article.fromJson(article))
            .toList();
        return articles;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  } 

  Future<List<Article>> searchArticles(String query) async {
    try {
      final url = Uri.parse(
        '$_baseUrl/everything?q=$query&apiKey=$_apiKey'
      );
      
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = (data['articles'] as List)
            .map((article) => Article.fromJson(article))
            .toList();
        return articles;
      } else {
        throw Exception('Failed to search articles');
      }
    } catch (e) {
      throw Exception('Error searching articles: $e');
    }
  }
}