import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uisampleaug16/controller/home_screen_controller.dart';
import 'package:uisampleaug16/controller/shop_screen_controller.dart';
import 'package:uisampleaug16/veiw/getstarted_screen/getstarted_screen.dart';


void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>HomeScreenController(),),
        ChangeNotifierProvider(create: (context) => ShopScreenController(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: getStartedScreen(),
      ),
    );
  }
}
