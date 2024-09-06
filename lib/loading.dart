import 'package:flutter/material.dart';
import 'chat.dart'; // Import the Chat screen

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    // Navigate to the Chat screen after a delay
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/chat');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://img.freepik.com/free-vector/cute-dog-doctor-with-stethoscope-cartoon-vector-icon-illustration-animal-healthcare-icon-isolated_138676-5182.jpg?t=st=1725527580~exp=1725531180~hmac=eece240973a1788f488a3311bfa8507e389847ec9698bda5c672f18d985ce698&w=740",
              height: 300,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 30),
            // Display a customized LinearProgressIndicator
            Container(
              width: 200, // Set width of the progress bar
              height: 10, // Set height to make the bar thicker
              child: LinearProgressIndicator(
                color: Color(0xFFAB47BC), // Light purple for the progress
                backgroundColor: Color(0xFF3D3D3D), // Dark background color
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Connecting you to your AI coach...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF500B84), // Dark background color for the loading screen
    );
  }
}
