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



}
