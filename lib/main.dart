import 'package:flutter/material.dart';
import 'package:flutter_food_2_2021/pages/food/food_list_page.dart';
import 'package:flutter_food_2_2021/pages/login/login_page.dart';
import 'package:flutter_food_2_2021/pages/login/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 22.0,
            //fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      home: const FoodListPage(),
    );
  }
}
