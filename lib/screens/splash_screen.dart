import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:Column(
        children: [
          Expanded(
            flex:5,
            child: Stack(
              children: [
                Container(
                width:double.infinity,
                height:650,
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.vertical(
                  bottom: Radius.circular(100),
                  ),
                  color:Colors.blue.shade100,
                ),
                child:Column(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset(
                      "assets/c11.png",
                      fit:BoxFit.cover,
                      width:450,
                      height:580,
                      ),
                    ),
                  
                  
                ],
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 30);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 30);
    path.quadraticBezierTo(size.width / 2, -30, 0, 30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
