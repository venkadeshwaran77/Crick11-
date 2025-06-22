// ignore_for_file: unused_local_variable, avoid_types_as_parameter_names, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:crick11/model/current_match_model.dart';
import 'package:flutter/material.dart';

class MatchDetailScreen extends StatefulWidget {
  final MatchData cricmatch;
  const MatchDetailScreen({super.key, required this.cricmatch});

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {
  late String team1Score, team1Overs, team1Inning;
  late String team2Score, team2Overs, team2Inning;

  @override
  void initState() {
    super.initState();
    _loadScoreData();
  }

  void _loadScoreData() {
    final score = widget.cricmatch.score;

    team1Score = score.isNotEmpty ? "${score[0].r}/${score[0].w}" : "0/0";
    team1Overs = score.isNotEmpty ? "(over:${score[0].o})" : "(over:0.0)";
    team1Inning = score.isNotEmpty ? score[0].inning : "";

    team2Score = score.length > 1 ? "${score[1].r}/${score[1].w}" : "0/0";
    team2Overs = score.length > 1 ? "(over:${score[1].o})" : "(over:0.0)";
    team2Inning = score.length > 1 ? score[1].inning : "";
  }

  @override
  Widget build(BuildContext context) {
    final cricmatch = widget.cricmatch;
    final team1 = cricmatch.teamInfo[0];
    final team2 = cricmatch.teamInfo[1];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd8f2f7),
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/logo.png", height: 50, width: 180),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _loadScoreData();
              });
            },
            icon: Icon(Icons.refresh),
            color: const Color.fromARGB(255, 110, 184, 221),
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xffd8f2f7),
        borderRadius:BorderRadius.circular(14)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cricmatch.name,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            SizedBox(height: 6),
            Text(
              cricmatch.status,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTeamColumn(
                  team1.img,
                  team1.shortname,
                  team1Score,
                  team2Overs,
                  team2Inning,
                ),
                Text(
                  "V/S",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                _buildTeamColumn(
                  team2.img,
                  team2.shortname,
                  team2Score,
                  team2Overs,
                  team2Inning,
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(cricmatch.date, style: TextStyle(fontSize: 16)),
            SizedBox(height: 7),
            Text(cricmatch.matchType.toUpperCase(), 
            style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text(
              cricmatch.venue,
              style: TextStyle(fontSize: 14, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTeamColumn(
  String imageUrl,
  String shortName,
  String score,
  String overs,
  String inning,
) {
  return Column(
    children: [
      CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        child: Image.network(
          imageUrl,
          height: 40,
          width: 40,
          errorBuilder:
              (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported),
        ),
      ),
      const SizedBox(height: 10),
      Text(
        shortName,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Text(score, style: const TextStyle(fontSize: 18)),
      Text(overs, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      Text(inning, style: const TextStyle(fontSize: 12, color: Colors.grey)),
    ],
  );
}
