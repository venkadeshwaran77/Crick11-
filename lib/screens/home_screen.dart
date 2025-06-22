// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_types_as_parameter_names
import 'package:crick11/inner_screen/match_deatil_screen.dart';
import 'package:crick11/model/current_match_model.dart';
import 'package:crick11/services/api_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices fetchmatches = ApiServices();
  late Future<CurrentMatches> currentmatchData;
  // final List <TeamInfo> teams;
  // bool isLoading = true;
  @override
  void initState() {
    super.initState();
    currentmatchData = fetchmatches.currentmatchData();
    // print("my data ${currentmatchData}");
    // isLoading = false;
  }
  Future<void> _handleRefresh() async {
  setState(() {
    currentmatchData = fetchmatches.currentmatchData();
  });
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
          Flexible(
            child: Padding(
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
          ),
        ],
      ),
      body: Column(
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
                      border: Border.all(color: Color(0xffd8f2f8), width: 3),
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
          Expanded(
            child: RefreshIndicator(
              onRefresh:_handleRefresh,
              child: FutureBuilder<CurrentMatches>(
                future: currentmatchData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator(color:const Color.fromARGB(255, 12, 37, 81),));
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error Loading data ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
                    return Center(child: Text("No Data Found"));
                  } else {
                    final currematch = snapshot.data!.data;
                    
                    return Expanded(
                      child: ListView.builder(
                        itemCount: currematch.length,
                        itemBuilder: (context, index) {
                          final match = currematch[index];
                          
                          return GestureDetector(
                            onTap:(){
                               Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contex) => MatchDetailScreen(cricmatch:match),
                            ),
                          );
                            },
                            child: Container(
                              width:200,
                              margin: EdgeInsets.symmetric(vertical:8,horizontal:25),
                                                padding: EdgeInsets.all(20),
                                                decoration: BoxDecoration(
                            color: Color(0xffd8f2f7),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Color(0xffffffff)),
                            boxShadow:[
                              BoxShadow(
                              color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 4),
                              ),
                            ]
                              ),
                              child:Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                              match.name,
                              style:TextStyle(
                                fontSize:12,
                              color:Colors.black87,
                              ),
                             ),
                             SizedBox(height:10),
                             Text(
                              match.status,
                              style:TextStyle(
                                fontSize:16,
                                fontWeight:FontWeight.w600,
                              ),
                             ),
                             SizedBox(height:10),
                             if (match.teamInfo.length>=2)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius:25,
                                        child: Image.network(
                                          match.teamInfo[0].img,
                                          height:40,
                                          width:40,
                                          errorBuilder:(context,error,StackTrace)=> 
                                          Icon(Icons.image_not_supported),
                                        ),
                                      ),
                                      SizedBox(height:5),
                                      Text(match.teamInfo[0].shortname),
                                    ],
                                  ),
                                  Text("VS",style:TextStyle(fontWeight:FontWeight.bold)),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius:25,
                                        child: Image.network(
                                          match.teamInfo[1].img,
                                          height:40,
                                          width:40,
                                          errorBuilder:(context,error,stackTrace) =>
                                           Icon(Icons.image_not_supported),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                     Text(match.teamInfo[1].shortname),
                                    ],
                                  ),
                                ],
                                ),
                                SizedBox(height:20),
                                Text(
                              "Starts at: ${DateTime.parse(match.dateTimeGMT).toLocal()}",
                                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                                 ),
                                 SizedBox(height:6),
                                 Text(match.date,style:TextStyle(fontSize:16)),
                                 SizedBox(height:6),
                                Text(match.matchType.toUpperCase(),style:TextStyle(fontSize:16)),
                                SizedBox(height:15),
                                Text(match.venue,style:TextStyle(fontSize:14,
                                color:Colors.black87)),
                             ],
                                                 ),
                                                ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
