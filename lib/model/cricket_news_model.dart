// cricket_news_model.dart

import 'dart:convert';

CricketNews cricketNewsFromJson(String str) =>
    CricketNews.fromJson(json.decode(str));

class CricketNews {
  String status;
  int totalResults;
  List<Result> results;

  CricketNews({
    required this.status,
    required this.totalResults,
    required this.results,
  });

  factory CricketNews.fromJson(Map<String, dynamic> json) => CricketNews(
        status: json["status"],
        totalResults: json["totalResults"],
        results: List<Result>.from(
            json["results"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  String title;
  String link;
  String description;
  String pubDate;
  String? imageUrl;
  String sourceUrl;
  String sourceIcon;

  Result({
    required this.title,
    required this.link,
    required this.description,
    required this.pubDate,
    this.imageUrl,
    required this.sourceUrl,
    required this.sourceIcon,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"] ?? "",
        link: json["link"] ?? "",
        description: json["description"] ?? "",
        pubDate: json["pubDate"] ?? "",
        imageUrl: json["image_url"], // might be null
        sourceUrl: json["source_url"],
        sourceIcon: json["source_icon"],
      );
}
