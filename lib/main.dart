import 'package:flutter/material.dart';
import 'package:uisampleaug16/veiw/getstarted_screen/getstarted_screen.dart';


void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: getStartedScreen(),
    );
  }
}
