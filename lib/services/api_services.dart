// ignore_for_file: avoid_print

import 'package:crick11/common/utils.dart';
import 'package:crick11/model/current_match_model.dart';
import 'package:http/http.dart' as http;

var key = "?api_key=$apiKey";

class ApiServices {
  Future<Currentmatches?> fetchCurrentMatches() async {
    try {
      const endPoint = "currentMatches?";
      final apiUrl = "$baseurl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return currentmatchesFromJson(response.body);
      } else {
        throw Exception("failed to load Matches");
      }
    } catch (e) {
      print("Error fetching Matches :$e");
      return null;
    }
  }
}
//
