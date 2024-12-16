import 'package:flutter/material.dart';
import '../app_colors.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  int selectedDay = 1;

  @override
  Widget build(BuildContext context) {

    // Generate calendar dates (1 to 30)
    final days = List.generate(30, (index) {
      final weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
      return {
        "day": weekdays[(index % 7)],
        "date": index + 1,
      };
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: days.map((day) {
          final isSelected = day['date'] == selectedDay;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDay = day['date'] as int;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 60,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.greenAccent
                          : AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(30),
                      border: isSelected
                          ? null
                          : Border.all(color: Colors.grey.shade300),
                      boxShadow: isSelected
                          ? [
                        BoxShadow(
                          color: AppColors.greenAccent.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(0, 5),
                        ),
                      ]
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (day['day'] as String?) ?? 'N/A',
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : AppColors.calendarInactiveTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          day['date'].toString(),
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : AppColors.calendarInactiveTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
