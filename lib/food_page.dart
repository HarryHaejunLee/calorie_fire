import 'package:flutter/material.dart';

import 'model/food.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FootPageState();
}

class _FootPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Food>>(
      future: fetchFood(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(snapshot.data![index].name),
                subtitle: Text(snapshot.data![index].calories.toString()),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Future<List<Food>> fetchFood() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => <Food>[
        Food(
            name: 'Apple',
            calories: 52,
            servingSize: '1 medium',
            servingUnit: ''),
        Food(
            name: 'Banana',
            calories: 89,
            servingSize: '1 medium',
            servingUnit: ''),
        Food(
            name: 'Orange',
            calories: 47,
            servingSize: '1 medium',
            servingUnit: ''),
        Food(
            name: 'Pineapple',
            calories: 50,
            servingSize: '1 slice',
            servingUnit: ''),
        Food(
            name: 'Strawberry',
            calories: 33,
            servingSize: '1 medium',
            servingUnit: ''),
        Food(
            name: 'Watermelon',
            calories: 30,
            servingSize: '1 medium',
            servingUnit: ''),
      ],
    );
  }
}
