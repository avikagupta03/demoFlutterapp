import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    // Start the loading process and then show the language selection dialog
    _startLoadingProcess();
  }

  void _startLoadingProcess() async {
    // Simulate a loading process with a delay
    await Future.delayed(Duration(seconds: 3));
    _showLanguageSelectionDialog();
  }

  void _showLanguageSelectionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Language Medium'),
          content: Text('Please select your preferred language to proceed.'),
          actions: <Widget>[
            TextButton(
              child: Text('English'),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacementNamed(context, '/chat'); // Navigate to Chat in English
              },
            ),
            TextButton(
              child: Text('Hindi'),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacementNamed(context, '/chat_hindi'); // Navigate to Hindi Chat screen
              },
            ),
          ],
          backgroundColor: Colors.purple[50], // Light purple background color
          titleTextStyle: TextStyle(color: Colors.black), // Black title text
          contentTextStyle: TextStyle(color: Colors.black), // Black content text
        );
      },
    );
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
