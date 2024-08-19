import 'package:flutter/material.dart';
import 'package:uisampleaug16/veiw/home_screen/home_screen.dart';

class getStartedScreen extends StatelessWidget {
  const getStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(200, 197, 197, 1),
      body: SafeArea(
          child: Container(
        height: double.infinity,
        width: 500,
        child: Stack(
          children: [
            Text(
              "Define Yourself in your unique way!.",
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  height: 1,
                  shadows: [
                    Shadow(
                      blurRadius: 3,
                      color: Colors.grey,
                      offset: Offset(3, 3),
                    )
                  ]),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                top: 120,
                child: Image.asset(
                  'assets/image/getbg-removebg-preview.png',
                  fit: BoxFit.cover,
                ))
          ],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(200, 197, 197, 1),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
                (route) => false);
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
