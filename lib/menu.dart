import 'package:flutter/material.dart';
import 'dart:ui'; // Import for BackdropFilter
import 'profile.dart';
import 'profile_model.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height; // Get screen height
    final boxHeight = screenHeight * 0.25;
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4A148C).withOpacity(0.9), // Dark purple with high opacity
              Color(0xFF4A148C).withOpacity(0.7), // Slightly lighter
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10.0,
              offset: Offset(0, 5), // Adjust the offset as needed
            ),
          ],
        ),
        child: Stack(
          children: [
            // Add BackdropFilter to create a blur effect for a glossy appearance
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Adjust blur intensity as needed
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0), // Add vertical padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min, // Avoid stretching
                  children: [
                    SizedBox(height: boxHeight),
                    // App logo
                    Container(
                      width: 100.0, // Adjust size as needed
                      height: 100.0, // Adjust size as needed
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo.jpeg'), // Path to your logo image
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.0), // Optional: Add rounded corners
                      ),
                    ),
                    SizedBox(height: 20.0), // Space between logo and heading

                    // Menu heading with text and decorative curved line
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Menu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0), // Space between text and line
                        CustomPaint(
                          size: Size(80.0, 10.0), // Adjust size as needed
                          painter: CurvedLinePainter(color: Colors.white.withOpacity(0.3)),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    // Spacing between heading and options

                    // Menu options with white text and icons
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true, // Avoid list stretching
                        itemCount: 4, // Number of menu options
                        itemBuilder: (context, index) {
                          String title;
                          IconData iconData;
                          switch (index) {
                            case 0:
                              title = 'Chat';
                              iconData = Icons.chat;
                              break;
                            case 1:
                              title = 'Self Care';
                              iconData = Icons.self_improvement;
                              break;
                            case 2:
                              title = 'Depression Test';
                              iconData = Icons.assignment;
                              break;
                            case 3:
                              title = 'Personal Profile';
                              iconData = Icons.person;
                              break;
                            default:
                              title = '';
                              iconData = Icons.error;
                          }
                          return ListTile(
                            leading: Icon(iconData, color: Colors.white),
                            title: Text(
                              title,
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Navigator.pushNamed(context, '/chat');
                                  break;
                                case 1:
                                  Navigator.pushNamed(context, '/self_care');
                                  break;
                                case 2:
                                  Navigator.pushNamed(context, '/test');
                                  break;
                                case 3:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProfileScreen(
                                            profile: Profile(
                                              name: 'John Doe',
                                              email: 'john.doe@example.com',
                                              medicalConditionStatus: 'No issues',
                                            ),
                                          ),
                                    ),
                                  );
                                  break;
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvedLinePainter extends CustomPainter {
  final Color color;

  CurvedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 10.0; // Adjust line thickness as desired

    final path = Path();
    path.moveTo(0.0, size.height / 2);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CurvedLinePainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
