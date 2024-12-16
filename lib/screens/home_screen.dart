import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../widgets/calendar_widget.dart';
import '../widgets/in_progress.dart';
import '../widgets/project_summary.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showNotificationPanel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [

          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Header Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/account_picture.png'),
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, Mr. Elon',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.titleColor,
                              ),
                            ),
                            Text(
                              '@mr.elon',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.subtitleColor,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _showNotificationPanel = !_showNotificationPanel;
                            });
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.notifications_none_rounded,
                                  color: Colors.black,
                                ),
                              ),

                              // Green alert signal at the top right of the bell icon
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Find your task....',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 20),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Positioned(
                          right: -10,
                          top: 1,
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: AppColors.greenAccent,
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  //Calendar Section
                  const CalendarWidget(),
                  const SizedBox(height: 15),

                  //Project Summary Section
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Project Summary",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const ProjectSummarySection(),
                  const SizedBox(height: 20),
                  const SafeArea(
                    child: InProgressSection(),
                  ),
                ],
              ),
            ),
          ),

          //Notification
          _showNotificationPanel
              ? GestureDetector(
            onTap: () {
              setState(() {
                _showNotificationPanel = false;
              });
            },
            child: Container(
              color: Colors.black54,
              width: double.infinity,
              height: double.infinity,
            ),
          )
              : const SizedBox.shrink(),

          // Notification Sliding Panel
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            right: _showNotificationPanel ? 0 : -300,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 5) {
                  setState(() {
                    _showNotificationPanel = false;
                  });
                }
              },
              child: _buildNotificationPanel(),
            ),
          ),
        ],
      ),
    );
  }

  // Notification Panel Widget
  Widget _buildNotificationPanel() {
    return const SizedBox(
      width: 250,
      child: Material(
        elevation: 10,
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 50.0, bottom: 8.0),
              child: Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(thickness: 1, height: 1),
            ListTile(
              leading: Icon(Icons.notifications_active),
              title: Text("You have 5 new notifications"),
            ),
            ListTile(
              leading: Icon(Icons.notifications_active),
              title: Text("Meeting at 3 PM"),
            ),
            ListTile(
              leading: Icon(Icons.notifications_active),
              title: Text("Task deadline tomorrow"),
            ),
          ],
        ),
      ),
    );
  }
}
