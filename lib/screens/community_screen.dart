// ignore_for_file: unused_local_variable

import 'package:crick11/inner_screen/community_detail_screen.dart';
import 'package:crick11/model/cricket_news_model.dart';
import 'package:crick11/services/sportsnews_api.dart';
import 'package:crick11/widgets/webview_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';



class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  late Future<CricketNews> sports;
  final SportsnewsApi apiService = SportsnewsApi();
  
  @override
  void initState() {
    super.initState();
    sports = apiService.fetchCricketNews();
    // print("sportt${sports}");
  }
  Future<void> _handleRefresh() async {
  setState(() {
    sports = apiService.fetchCricketNews();
  });
}


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //  dynamic cricketnewsProvider = Provider.of<CricketNews>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd8f2f7),
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.only(bottom:80),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
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
        elevation:0,
      ),
      body: RefreshIndicator(
        onRefresh:_handleRefresh,
        child: FutureBuilder<CricketNews>(
          future: sports,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color:Color.fromARGB(255, 1, 22, 46)));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading data: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final sport = snapshot.data!.results;
              if (sport.isEmpty) {
                return const Center(child: Text("No news available"));
              }
        
              return ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: sport.length,
                itemBuilder: (context, index) {
                  final sportsData = sport[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CommunityDetailScreen(sportss:sportsData),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color.fromARGB(255, 202, 206, 206)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          if (sportsData.imageUrl != null &&
                              sportsData.imageUrl!.isNotEmpty)
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.network(
                                sportsData.imageUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/emty.jpg',
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            )
                          else
                            Placeholder(fallbackHeight: 200),
                          SizedBox(height: 10),
                          Text(
                            sportsData.title,
                            textAlign:TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListTile(
                            leading: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: WebviewWidget(
                                      url: sportsData.link,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.link),
                              color: Colors.blueAccent,
                              iconSize: 30,
                            ),
                            subtitle: Text(
                              '⏳ ${sportsData.pubDate}',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text("Problem fetching data"));
            }
          },
        ),
      ),
    );
  }
}
