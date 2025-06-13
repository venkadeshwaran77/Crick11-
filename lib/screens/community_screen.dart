import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      backgroundColor: Color(0xffd8f2f7),
      toolbarHeight:90,
      leading: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:100),
            child: Row(
              children: [
                Image.asset("assets/logo.png", height: 50, width: 180),
              ],
            ),
          ),
        ],
      ),
      body:Center(
        child:Text("Community Info news"),
      ),
    );
  }
}
