import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(name: 'Feeds', percent: 40, color: Colors.blue),
    Data(name: 'Fertilizer', percent: 60, color: Colors.green),
  ];
}

class Data {
  final String name;
  final double percent;
  final Color color;
  Data({required this.name, required this.percent, required this.color});
}
