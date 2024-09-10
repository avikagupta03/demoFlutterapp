import 'package:flutter/material.dart';
import 'loading.dart'; // Import the Loading screen
import 'chat.dart';    // Import the Chat screen
import 'menu.dart';    // Import the MenuDrawer
import 'self_care_card.dart'; // Import the SelfCareCardsPage
import 'test.dart'; // Import the DepressionTestQuestionnaire
import 'profile.dart'; // Import the ProfileScreen
import 'profile_model.dart'; // Import the Profile model
import 'languageselection.dart'; // Import the LanguageSelection screen
import 'chat_hindi.dart';    // Import the Hindi Chat screen
import 'selfcar_card_hindi.dart'; // Import the Hindi SelfCareCardsPage
import 'test_hindi.dart'; // Import the Hindi DepressionTestQuestionnaire
import 'profile_hindi.dart'; // Import the Hindi ProfileScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Updated parameter
          bodyLarge: TextStyle(color: Colors.white70), // Updated parameter
        ),
        colorScheme: ColorScheme.dark(
          primary: Colors.black,
          secondary: Colors.blueAccent,
        ),
        cardColor: Colors.black54,
      ),
      initialRoute: '/loading', // Start with the Loading screen
      routes: {
        '/loading': (context) => Loading(), // Route to Loading screen
        '/language_selection': (context) => LanguageSelection(), // Route to Language Selection screen
        '/chat': (context) => Chat(), // Route to English Chat screen
        '/self_care': (context) => SelfCareCardsPage(), // Route to English SelfCareCardsPage
        '/test': (context) => DepressionTestQuestionnaire(), // Route to English DepressionTestQuestionnaire
        '/profile': (context) => ProfileScreen(
          profile: Profile(
            name: 'John Doe',
            email: 'john.doe@example.com',
            medicalConditionStatus: 'No issues',
          ),
        ), // Route to English ProfileScreen
        '/chat_hindi': (context) => ChatHindi(), // Route to Hindi Chat screen
        '/self_care_hindi': (context) => SelfCareCardsPageHindi(), // Route to Hindi SelfCareCardsPage
        '/test_hindi': (context) => DepressionTestQuestionnaireHindi(), // Route to Hindi DepressionTestQuestionnaire
        '/profile_hindi': (context) => ProfileScreenHindi(
          profile: Profile(
            name: 'John Doe',
            email: 'john.doe@example.com',
            medicalConditionStatus: 'No issues',
          ),
        ), // Route to Hindi ProfileScreen
      },
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}
