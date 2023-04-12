import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/friend.dart';
import '../models/group.dart';

class OverviewScreen extends StatelessWidget {
  final List<Friend> friends;
  final List<Group> groups;

  OverviewScreen({required this.friends, required this.groups});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple
    ];

    final List<PieChartSectionData> sections = friends
        .asMap()
        .entries
        .map((entry) => PieChartSectionData(
              color: colors[entry.key % colors.length],
              value: entry.value.balance.abs(),
              title: entry.value.name,
            ))
        .toList();

    return Column(
      children: [
        const Text(
          'Total Outstanding',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: PieChart(
            PieChartData(
              sections: sections,
              centerSpaceRadius: 80,
              sectionsSpace: 0,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Outstanding Balances',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
