import 'package:flutter/material.dart';

class LanguageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Language'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[200], // Light purple background color
              foregroundColor: Colors.white, // White text color
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/english');
            },
            child: Text('English'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[200], // Light purple background color
              foregroundColor: Colors.white, // White text color
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/hindi');
            },
            child: Text('हिन्दी'),
          ),
        ],
      ),
    );
  }
}
