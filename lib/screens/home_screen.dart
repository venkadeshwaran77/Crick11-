// ignore_for_file: unused_local_variable

import 'package:crick11/model/current_match_model.dart';
import 'package:crick11/services/api_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices apiServices = ApiServices();
  late Future<Currentmatches?> currentmatchData;

  @override
  void initState() {
    currentmatchData = apiServices.fetchCurrentMatches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd8f2f7),
        toolbarHeight: 130,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: Colors.black,
          ),
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 40),
                child: Image.asset("assets/logo.png", height: 50, width: 180),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/search.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                SizedBox(width: 15),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/comment.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                SizedBox(width: 15),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/notification.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: currentmatchData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            List<dynamic> currentmatchData = snapshot.data as List<dynamic>;
             
            return ListView.builder(
              itemCount: currentmatchData.length,
              itemBuilder: (context, index) {
                var currentmatch = currentmatchData[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Positioned(
                          left: 20,
                          top: 191,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.all(15),
                              height: 31,
                              width: 126,
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color(0xffd8f2f8),
                                  width: 3,
                                ),
                              ),
                              child: Center(child: Text("Current matches")),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffd8f2f7),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xffd8f2f7)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "India vs Australia, 1st match",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Not yet started",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/ind.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'India',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'V / S',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/aus.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Australia',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text('07/06/25', style: TextStyle(fontSize: 16)),
                          Text('T20', style: TextStyle(fontSize: 16)),
                          SizedBox(height: 15),
                          Text(
                            'Narendra Modi stadium, Ahmedabad',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(child: Text("probelem to fetch data"));
          }
        },
      ),
    );
  }
}
