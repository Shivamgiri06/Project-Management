import 'package:flutter/material.dart';
import 'package:project_manager/app_colors.dart';
import '../widgets/productivity_graph.dart';
import '../widgets/subtask_card.dart';

class ProductivityScreen extends StatelessWidget {
  const ProductivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios_new, color: AppColors.primaryColor),
                      ),
                    ),
                    const Icon(Icons.notifications, color: AppColors.primaryColor),
                  ],
                ),
              ),
              // Productivity Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Productivity",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2B184D),
                  ),
                ),
              ),

              // Bar Chart Section
              const ProductivityGraph(),
              // Subtasks Section
              const SubtasksCard(),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBar(double height, String day, {bool isHighlighted = false}) {
    return Column(
      children: [
        Container(
          width: 24.0,
          height: height,
          decoration: BoxDecoration(
            color: isHighlighted ? Colors.grey : const Color(0xFF5DBB9F),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          day,
          style: const TextStyle(color: Colors.grey, fontSize: 12.0),
        ),
      ],
    );
  }

  Widget _buildLegend(String text, Color color) {
    return Row(
      children: [
        CircleAvatar(radius: 6, backgroundColor: color),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildSubtask(String title, bool isChecked) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
              color: const Color(0xFF5DBB9F),
            ),
            const SizedBox(width: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF2B184D),
              ),
            ),
          ],
        ),
        const Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: AppColors.subtitleColor,
              child: Icon(Icons.person, color: AppColors.buttonTextColor, size: 12),
            ),
            SizedBox(width: 4),
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: AppColors.buttonTextColor, size: 12),
            ),
          ],
        ),
      ],
    );
  }
}
