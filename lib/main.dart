import 'package:flutter/material.dart';
import 'loading.dart'; // Import the Loading screen
import 'chat.dart';    // Import the Chat screen

void main() {
  runApp(MaterialApp(
    initialRoute: '/', // Set the initial route to Loading screen
    routes: {
      '/': (context) => const Loading(), // Route to Loading screen
      '/chat': (context) => const Chat(), // Route to Chat screen
    },
    debugShowCheckedModeBanner: false, // Remove the debug banner
  ));
}
