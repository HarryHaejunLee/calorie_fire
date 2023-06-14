import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  bool _isMale = true;

  @override
  Widget build(BuildContext context) {
    var height = _heightController.text.isNotEmpty ? double.parse(_heightController.text) : 0.0;
    var weight = _weightController.text.isNotEmpty ? double.parse(_weightController.text) : 0.0;
    var age = _ageController.text.isNotEmpty ? int.parse(_ageController.text) : 0;

    var metric = _isMale ?
    66.473 + (13.7516 * weight) + (5.0033 * height) - (6.755 * age) :
    655.0955 + (9.5634 * weight) + (1.8496 * height) - (4.6756 * age);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.height),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _heightController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '키를 입력하세요',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.fitness_center),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _weightController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '몸무게를 입력하세요',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '나이를 입력하세요',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(children: [
            const Text('성별을 선택하세요'),
            Radio<bool>(value: true, groupValue: _isMale, onChanged: (value) {
              setState(() {
                _isMale = true;
              });
            }),
            const Text('남자'),
            Radio<bool>(value: false, groupValue: _isMale, onChanged: (value) {
              setState(() {
                _isMale = false;
              });
            }),
            const Text('여자'),
          ]),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text('결과 확인'),
          ),
          const SizedBox(height: 10),
          Visibility(
              visible: _heightController.text.isNotEmpty &&
                  _weightController.text.isNotEmpty &&
                  _ageController.text.isNotEmpty,
              child: Row(
                children: [
                  Text('기초 대사량 : ${metric.floor()} calories',style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),),
                ],
              )),
        ],
      ),
    );
  }
}
