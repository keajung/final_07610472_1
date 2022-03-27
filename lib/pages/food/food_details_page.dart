import 'package:flutter/material.dart';
import 'package:flutter_food_2_2021/pages/food/food_data.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailsPage extends StatefulWidget {
  final int foodIndex;

  const FoodDetailsPage({Key? key, required this.foodIndex}) : super(key: key);

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  late int _foodIndex;

  @override
  void initState() {
    super.initState();
    _foodIndex = widget.foodIndex;
  }

  @override
  Widget build(BuildContext context) {
    var foodItem = FoodData.list[_foodIndex];

    return Scaffold(
      //appBar: AppBar(title: Text('${foodItem.id} ${foodItem.choice}')),
      body: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1.7,
                child: Image.network(
                  foodItem.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  foodItem.choice.toString(),
                  style: GoogleFonts.prompt(fontSize: 30.0),
                ),
              ),
              /*Text(
                '${foodItem.id} บาท',
                style: GoogleFonts.prompt(fontSize: 20.0),
              ),*/
            ],
          ),
          if (_foodIndex > 0)
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () => _handleClickButton(-1),
                  label: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('ก่อนหน้า'),
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          if (_foodIndex < FoodData.list.length - 1)
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: () => _handleClickButton(1),
                    label: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('ถัดไป'),
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('เมนู ${_foodIndex + 1}/${FoodData.list.length}'),
            ),
          ),
        ],
      ),
    );
  }

  // ปรับโค้ดใหม่ ไม่เหมือนที่สอนในคาบเรียน
  void _handleClickButton(int value) {
    final newIndex = _foodIndex + value;
    if (newIndex < 0 || newIndex > FoodData.list.length - 1) return;

    setState(() {
      _foodIndex += value;
    });
  }
}