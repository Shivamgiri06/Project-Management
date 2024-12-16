import 'package:flutter/material.dart';

import '../app_colors.dart';

class InProgressSection extends StatelessWidget {
  const InProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Section Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "In Progress",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.calendarInactiveTextColor,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5A3B70),
                  ),
                ),
              ),
            ],
          ),
        ),

        // List of Projects
        SizedBox(
          height: 180,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: const [
              ProjectCard(
                progress: 55,
                title: "Meta Work Project",
                date: "18 Oct 2022",
                progressColor: Color(0xFF5DBB9F),
              ),
              SizedBox(height: 12.0),
              ProjectCard(
                progress: 78,
                title: "3d Design",
                date: "8 Oct 2022",
                progressColor: Color(0xFF81599C),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final int progress;
  final String title;
  final String date;
  final Color progressColor;

  const ProjectCard({
    super.key,
    required this.progress,
    required this.title,
    required this.date,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: progress / 100,
                  backgroundColor: progressColor.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                  strokeWidth: 5.0,
                ),
                Center(
                  child: Text(
                    "$progress%",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),

          // Project Title and Date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.calendarInactiveTextColor,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.subtitleColor,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.more_vert,
            color: AppColors.subtitleColor,
          ),
        ],
      ),
    );
  }
}
