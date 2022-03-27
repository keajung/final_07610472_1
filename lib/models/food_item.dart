
class FoodItem {
  final String image;
  final String answer;
  final List choice;

  FoodItem ({
    required this.image,
    required this.answer,
    required this.choice,
  });

  factory FoodItem .fromJson(Map<String, dynamic> json){
    return FoodItem (
        image:  json['image'],
        answer: json['answer'],
        choice: json['choice_list']
    );
  }

  FoodItem .fromJson2(Map<String, dynamic> json)
      : image = json['image'],
        answer = json['answer'],
        choice = json['choice_list'];

  @override
  String toString() {
    return '$choice';
  }

}