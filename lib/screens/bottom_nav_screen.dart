import 'package:crick11/screens/community_screen.dart';
import 'package:crick11/screens/home_screen.dart';
import 'package:crick11/screens/mycricket_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  List<Widget> pages =[
  HomeScreen(),
  MycricketScreen(),
  CommunityScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(index:currentIndex,children:pages,),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image(image:AssetImage("assets/home.png"),height:50,width:50),
            label: "Home",
          ),
          BottomNavigationBarItem(
          icon: Image(image:AssetImage("assets/cricketbat.png"),height:50,width:50,),
          label:"My Cricket",
          ),
          BottomNavigationBarItem(
          icon: Image(image:AssetImage("assets/diversity.png"),height:50,width:50),
          label:"Community",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex:currentIndex,
        onTap:(index) {
          setState(() {
          currentIndex = index;  
          });
        },
      ),
    );
  }
}
