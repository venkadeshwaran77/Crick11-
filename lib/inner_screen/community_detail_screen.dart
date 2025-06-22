// ignore_for_file: unused_local_variable

import 'package:crick11/model/cricket_news_model.dart';
import 'package:flutter/material.dart';

class CommunityDetailScreen extends StatefulWidget {
  final Result sportss;
  const CommunityDetailScreen({super.key, required this.sportss});

  @override
  State<CommunityDetailScreen> createState() => _CommunityDetailScreenState();
}

class _CommunityDetailScreenState extends State<CommunityDetailScreen> {
  // late Future<CricketNews> sports;
  // final SportsnewsApi apiService = SportsnewsApi();

  // @override
  // void initState() {
  //   super.initState();
  //   sports = apiService.fetchCricketNews();
  //   // print("sportt${sports}");
  // }

  @override
  Widget build(BuildContext context) {
     final sportss = widget.sportss;
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
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 100),
            child: Row(
              children: [
                Image.asset("assets/logo.png", height: 50, width: 180),
              ],
            ),
          ),
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
             decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  // News Image
                  if (sportss.imageUrl != null && sportss.imageUrl!.isNotEmpty)
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(sportss.imageUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  // News Title
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      sportss.title ,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // News Description / Content
                   Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      textAlign: TextAlign.start,
                      "Description",
                      style: TextStyle(
                      fontSize:25,
                      fontWeight:FontWeight.bold,
                      color:Color.fromARGB(255, 6, 47, 56)
                      ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      sportss.description ,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    height:90,
                    width:360,
                    decoration:BoxDecoration(
                      color:Colors.grey[300],
                      borderRadius:BorderRadius.circular(15)
                    ),
                    child:Text(
                      sportss.sourceIcon),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
