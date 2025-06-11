import 'package:flutter/material.dart';

class MycricketScreen extends StatefulWidget {
  const MycricketScreen({super.key});

  @override
  State<MycricketScreen> createState() => _MycricketScreenState();
}

class _MycricketScreenState extends State<MycricketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Text("My Cricket"),
      ),
    );
  }
}
