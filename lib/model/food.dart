class Food {
  final String name;
  final int calories;
  final String servingSize;
  final String servingUnit;

  Food(
      {required this.name,
      required this.calories,
      required this.servingSize,
      required this.servingUnit});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'],
      calories: json['calories'],
      servingSize: json['serving_size'],
      servingUnit: json['serving_unit'],
    );
  }
}
