class CurrentMatches {
  final String status;
  final List<MatchData> data;

  CurrentMatches({required this.status, required this.data});

  factory CurrentMatches.fromJson(Map<String, dynamic> json) {
    return CurrentMatches(
      status: json['status'],
      data: (json['data'] as List)
          .map((e) => MatchData.fromJson(e))
          .toList(),
    );
  }
}

class MatchData {
  final String id;
  final String name;
  final String matchType;
  final String date;
  final String dateTimeGMT;
  final String venue;
  final List<TeamInfo> teamInfo;
  final List<Score> score;
  final String status;

  MatchData({
    required this.id,
    required this.name,
    required this.matchType,
    required this.date,
     required this.dateTimeGMT,
    required this.venue,
    required this.teamInfo,
    required this.score,
    required this.status,
  });

  factory MatchData.fromJson(Map<String, dynamic> json) {
    return MatchData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      matchType: json['matchType'] ?? '',
      date: json['date'] ?? '',
      dateTimeGMT: json['dateTimeGMT'] ?? '',
      venue: json['venue'] ?? '',
      status: json['status'] ?? '',
      teamInfo: (json['teamInfo'] as List)
          .map((e) => TeamInfo.fromJson(e))
          .toList(),
      score: (json['score'] as List)
          .map((e) => Score.fromJson(e))
          .toList(),
    );
  }
}

class TeamInfo {
  final String name;
  final String shortname;
  final String img;

  TeamInfo({required this.name, required this.shortname, required this.img});

  factory TeamInfo.fromJson(Map<String, dynamic> json) {
    return TeamInfo(
      name: json['name'] ?? '',
      shortname: json['shortname'] ?? '',
      img: json['img'] ?? '',
    );
  }
}

class Score {
  final int r;
  final int w;
  final double o;
  final String inning;

  Score({required this.r, required this.w, required this.o, required this.inning});

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      r: json['r'] ?? 0,
      w: json['w'] ?? 0,
      o: (json['o'] ?? 0).toDouble(),
      inning: json['inning'] ?? '',
    );
  }
}
