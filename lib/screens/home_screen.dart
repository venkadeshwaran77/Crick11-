// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd8f2f7),
        toolbarHeight: 160,
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
                padding: const EdgeInsets.only(top: 115),
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
    body:Column(
      children: [
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
             Positioned(
              left:20,
              top:191,
               child: GestureDetector(
                onTap:(){},
                 child: Container(
                 margin:EdgeInsets.all(15),
                  height:31,
                  width:126,
                  decoration:BoxDecoration(
                     color:Color(0xffffffff),
                    borderRadius:BorderRadius.circular(15),
                    border: Border.all(
                      color:Color(0xffd8f2f8),
                      width:3
                    ),
                    ),
                  child:Center(child: Text("Current matches")),
                  ),
               ),
               ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                    onTap:(){},
                    child: Text("See All",
                    style:TextStyle(color:Colors.black,
                    fontWeight:FontWeight.bold),
                    ),
                    ),
                  ],
                ),
              ),
          ],
          
        ),
       
      ],
    ),
    
    );
  }
}
