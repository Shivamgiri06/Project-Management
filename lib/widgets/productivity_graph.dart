import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../app_colors.dart';

class ProductivityGraph extends StatelessWidget {
  const ProductivityGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overall',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '41',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              Spacer(),

              Row(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Planned',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: AppColors.subtitleColor,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Complete',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                barGroups: _generateBarGroups(),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const days = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
                        return Text(
                          days[value.toInt()],
                          style: const TextStyle(fontSize: 12, color: Colors.black54),
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    return [
      _barGroup(0, 3, 5),
      _barGroup(1, 6, 8),
      _barGroup(2, 7, 7),
      _barGroup(3, 3, 5),
      _barGroup(4, 4, 6),
      _barGroup(5, 9, 8),
      _barGroup(6, 6, 7),
    ];
  }

  BarChartGroupData _barGroup(int x, double planned, double complete) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: planned + complete,
          color: Colors.grey.shade300,
          width: 15,
          borderRadius: BorderRadius.circular(4),
          rodStackItems: [
            BarChartRodStackItem(0, planned, Colors.green),
            BarChartRodStackItem(planned, planned + complete, Colors.grey.shade300),
          ],
        ),
      ],
    );
  }
}
