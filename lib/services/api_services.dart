// ignore_for_file: avoid_print, unused_local_variable
import 'dart:convert' as cnv;
import 'package:crick11/model/current_match_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // Future<Currentmatches> currentmatchData() async {
  //   final response = await http.get(Uri.parse(ApiEndpoints.currentMatches));
  //   // print(" API BODY: ${response.body}");
    
  //   if (response.statusCode == 200) {
  //     // final jsonMap = cnv.jsonDecode(response.body);
  //     final jsonData = cnv.json.decode(response.body);
  //     if (jsonData['status'] == "success") {
  //       return Currentmatches.fromJson(jsonData);
  //     } else {
  //       throw Exception("API error: ${jsonData["status"]}");
  //     }
  //   } else {
  //     throw Exception(' HTTP Error: ${response.statusCode}');
  //   }
  // }
  // Future<Currentmatches> currentmatchData() async {
  //   String apiUrl =
  //       "https://api.cricapi.com/v1/currentMatches?apikey=c490252d-bb09-4f99-8846-fbca973fd288&offset=0";

  //   final apiResponse = await http.get(Uri.parse(apiUrl));

  //   if (apiResponse.statusCode == 200) {
  //     return Currentmatches.fromJson(cnv.jsonDecode(apiResponse.body));
  //   } else {
  //     throw Exception('Failed to load');
  //   }
  // }

  Future<CurrentMatches> currentmatchData() async {
  const String apiUrl =
      "https://api.cricapi.com/v1/currentMatches?apikey=c490252d-bb09-4f99-8846-fbca973fd288&offset=0";

  final response = await http.get(Uri.parse(apiUrl));
  print("Status Code: ${response.statusCode}");
  print("Body: ${response.body}");

  if (response.statusCode == 200) {
    return CurrentMatches.fromJson(cnv.jsonDecode(response.body));  
  } else {
    throw Exception('Failed to load current matches');
  }
}

}
