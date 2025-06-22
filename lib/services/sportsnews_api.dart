// ignore_for_file: unused_local_variable



import 'package:crick11/model/cricket_news_model.dart';

import 'package:http/http.dart' as http;

String apikey = "pub_c0a304a98dc04194aa3924980e1e3ab0";

class SportsnewsApi {
  // final String _baseurl = "https://newsdata.io/api/1";
  
  // Future<CricketNews> fetchSportsnews() async {
  //   final url = Uri.parse("https://newsdata.io/api/1/latest?apikey=pub_c0a304a98dc04194aa3924980e1e3ab0&q=cricket");

  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //      final decoded = cnv.jsonEncode(response.body);
  //       // print("MY API (formatted): ${cnv.jsonDecode(decoded)}");
  //     return CricketNews.fromJson(cnv.jsonDecode(response.body));
      
  //   } else {
  //     throw Exception("Failed to load News");
  //   }
  // } 
  

  Future<CricketNews> fetchCricketNews() async {
  final response = await http.get(Uri.parse('https://newsdata.io/api/1/latest?apikey=pub_c0a304a98dc04194aa3924980e1e3ab0&q=cricket'));

  if (response.statusCode == 200) {
    // print("API RESPONSE: ${response.body}");
    return cricketNewsFromJson(response.body);
  } else {
    throw Exception('Failed to load news');
  }
}


}
