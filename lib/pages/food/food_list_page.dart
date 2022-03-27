import 'package:flutter/material.dart';
import 'package:flutter_food_2_2021/models/api_result.dart';
import 'package:flutter_food_2_2021/models/food_item.dart';
import 'package:flutter_food_2_2021/pages/food/food_data.dart';
import 'package:flutter_food_2_2021/pages/food/food_details_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  var _isLoading = false;
  ////List<String> _foodData = [];

  @override
  void initState() {
    super.initState();
    _loadFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('FLUTTER FOOD'),
      // ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: FoodData.list.length,
            itemBuilder: (context, index) => _buildListItem(context, index),
          ),
          if (_isLoading)
            const Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  _loadFoods() async {
    setState(() {
      _isLoading = true;
    });
    final url = Uri.parse('https://cpsu-test-api.herokuapp.com/quizzes');
    var response = await http.get(url, headers: {'id': '07610472'});

    setState(() {
      _isLoading = false;
    });

    var json = jsonDecode(response.body);
    var apiResult = ApiResult.fromJson(json);

    String status = json['status'];
    String? message = json['message'];
    List<dynamic> data = json['data'];

    print('Status: $status, Message: $message, Number of food: ${data.length}');

    setState(() {
      FoodData.list = apiResult.data
          .map<FoodItem>((item) => FoodItem.fromJson(item))
          .toList();

      /*for (var element in apiResult.data) {
        var foodItem = FoodItem.fromJson(element);
        _foodData.add(foodItem);
      }*/
    });
  }

  Widget _buildListItem(BuildContext context, int index) {
    var foodItem = FoodData.list[index];

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      shadowColor: Colors.black.withOpacity(0.2),
      child: InkWell(
        onTap: () {
          _handleClickItem(index);
        },
        child: Row(
          children: <Widget>[
            Image.network(
              foodItem.image,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          foodItem.choice.toString(),
                          style: GoogleFonts.prompt(fontSize: 20.0),
                        ),
                        // Text(
                        //   '${foodItem.price.toString()} บาท',
                        //   style: GoogleFonts.prompt(fontSize: 15.0),
                        // ),
                      ],
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

  void _handleClickItem(int foodIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FoodDetailsPage(foodIndex: foodIndex)),
    );
  }
}