import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'data.dart';

List<PieChartSectionData> getSection() => PieData.data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      final value = PieChartSectionData(
        color: data.color,
        value: data.percent,
        title: '${data.percent}%',
        titleStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Color(0xffffffff),
        ),
      );
      return MapEntry(index, value);
    })
    .values
    .toList();
