import 'package:crick11/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   title:'CRICK11',
      debugShowCheckedModeBanner:false,
      theme:ThemeData(
        colorScheme:ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3:false,
      ),
      home:HomeScreen(),
    );
  }
}
