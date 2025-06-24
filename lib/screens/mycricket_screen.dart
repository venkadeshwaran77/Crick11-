// ignore_for_file: unused_local_variable

import 'package:crick11/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class MycricketScreen extends StatefulWidget {
  const MycricketScreen({super.key});

  @override
  State<MycricketScreen> createState() => _MycricketScreenState();
}

class _MycricketScreenState extends State<MycricketScreen> {
  int selectedIndex = 0;
  final List<String> tabs = ["My", "Played", "Network", "All"];
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double buttonWidth = screenWidth * 0;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffd8f2f7),
        toolbarHeight: 90,
        // leading: Padding(
        //     padding: const EdgeInsets.only(bottom: 80),
        //     child: IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.menu),
        //       color: Colors.black,
        //     ),
        //   ),
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
        elevation: 0,
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                color: Color(0xFF1C2B36),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Want to start a match?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "START A MATCH",
                      style: TextStyle(color: Color(0xFF00C292)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(tabs.length, (index) {
                bool isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child:Container(
                    padding:EdgeInsets.symmetric(horizontal:20,vertical:10),
                    decoration:BoxDecoration(
                      color: isSelected ? Color.fromARGB(255, 12, 36, 86) : Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:Text(
                      tabs[index],
                      style:TextStyle(
                        color:isSelected? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height:60),
            Center(
              child:Padding(
              padding: EdgeInsets.all(13),
              child:Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                  onPressed:(){}, 
                  style:ElevatedButton.styleFrom(
                    backgroundColor:Color(0xffd8f2f7),
                    foregroundColor:Colors.blueGrey,
                    padding:EdgeInsets.symmetric(horizontal:18,vertical:8),
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(6),
                    ),
                  ),
                  child:Text(
                  "START A MATCH",
                  style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  ),
                  SizedBox(width:4),
                  OutlinedButton(
                  onPressed:(){},
                  style: OutlinedButton.styleFrom(
                  side:  BorderSide(color: Color(0xffd8f2f7), width: 3),
                  foregroundColor:Colors.blueGrey ,
                  padding: EdgeInsets.symmetric(horizontal:18, vertical:8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                   child:Text(
                  "VIEW ALL MATCHES",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ),
                ],
              ),
              ),
            ),
          ],
          
        ),
        
      ),
      
    );
  }
}
