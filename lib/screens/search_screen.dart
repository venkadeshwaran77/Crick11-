import 'package:flutter/material.dart';

class Crick11SearchScreen extends StatefulWidget {
  const Crick11SearchScreen({super.key});

  @override
  State<Crick11SearchScreen> createState() => _Crick11SearchScreenState();
}

class _Crick11SearchScreenState extends State<Crick11SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd8f2f7),
        title: Text(""),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black87,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Ask anything",
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.qr_code_scanner),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  ),
                filled: true,
                fillColor: Colors.white,
              
              ),
            ),
          ),
        ),
      ),
      body:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Padding(
          padding:EdgeInsets.all(16),
          child:Text(
            "Go To",
            style:TextStyle(fontSize:18,fontWeight:FontWeight.bold),
          ),
          ),
           Expanded(
          child:ListView(
            children: [
              ListTile(
                leading:Icon(Icons.stacked_bar_chart),
              )
            ],
          ),
          ),
        ],
      ),
    );
  }
}
