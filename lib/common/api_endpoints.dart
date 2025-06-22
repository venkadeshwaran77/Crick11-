
class ApiEndpoints {
  static const String baseUrl = "https://api.cricapi.com/v1";
  static const String apiKey = "c490252d-bb09-4f99-8846-fbca973fd288";

  static String currentMatches = "$baseUrl/currentMatches?apikey=$apiKey&offset=0";

  static String matchScore(String matchId) =>
      "$baseUrl/match_score?apikey=$apiKey&id=$matchId";
}
