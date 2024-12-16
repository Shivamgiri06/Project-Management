import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../screens/productivity_screen.dart';

class ProjectSummarySection extends StatelessWidget {
  const ProjectSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(
            width: 180,
            child: _ProjectCard(
              title: "18",
              subtitle: "In progress project",
              icon: Icons.edit,
              gradientColors: [
                Color(0xFF5DBB9F),
                Color(0xFF42856A),
              ],
              curveColor: Color(0xFF4BAA88),
            ),
          ),
          SizedBox(width: 16.0),
          SizedBox(
            width: 180,
            child: _ProjectCard(
              title: "42",
              subtitle: "Completed project",
              icon: Icons.check_circle,
              gradientColors: [
                Color(0xFF81599C),
                Color(0xFF5A3B70),
              ],
              curveColor: Color(0xFF6C4A80),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradientColors;
  final Color curveColor;

  const _ProjectCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradientColors,
    required this.curveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: CurvePainter(curveColor: curveColor),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductivityScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(height: 120.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppColors.buttonTextColor,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final Color curveColor;

  CurvePainter({required this.curveColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = curveColor
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width * 0.6, 0);
    path.quadraticBezierTo(
      size.width * 0.8, size.height * 0.3,
      size.width, size.height * 0.6,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
